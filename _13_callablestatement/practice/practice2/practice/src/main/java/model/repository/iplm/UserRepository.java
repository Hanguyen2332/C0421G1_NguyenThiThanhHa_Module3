package model.repository.iplm;

import model.bean.User;
import model.repository.BaseRepository;
import model.repository.IUserRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserRepository implements IUserRepository {
    BaseRepository baseRepository = new BaseRepository();

    // -----------------------------------Exercise---------------------------------------//

    @Override
    public List<User> searchByCountry(String country) {
        List<User> userList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = baseRepository.getConnection().prepareStatement("select id, user_name,email,country\n" +
                    "from users\n" +
                    "where country = ?");
            preparedStatement.setString(1,country);

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                User user = new User();
                user.setId(resultSet.getInt("id"));
                user.setName(resultSet.getString("user_name"));
                user.setEmail(resultSet.getString("email"));
                user.setCountry(resultSet.getString("country"));

                userList.add(user);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return userList;
    }

    //ham sap xep theo ten:
    @Override
    public List<User> orderByName(){
        List<User> usersList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = baseRepository.getConnection().prepareStatement("select id, user_name,email,country\n" +
                    "from users\n" +
                    "order by user_name;");

            //hứng kq:
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                User user = new User();
                user.setId(resultSet.getInt("id"));
                user.setName(resultSet.getString("user_name"));
                user.setEmail(resultSet.getString("email"));
                user.setCountry(resultSet.getString("country"));

                //add list
                usersList.add(user);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return usersList;
     }



    //-----------------------------------Practice------------------------------------------//
    @Override
    public List<User> selectAllUsers() {
        List<User> userList = new ArrayList<>();
        //NOTE: Nhớ khởi tạo list trong block scope (nếu để bên ngoài --> biến global --> liên tục thêm vào --> trùng thông tin

        try {
            PreparedStatement preparedStatement = baseRepository.getConnection().prepareStatement(
                    "select id,user_name,email,country\n" +
                            "from users;"
            );
            ResultSet resultSet = preparedStatement.executeQuery();

            //convert record --> object --> add userList:
            User user = null;
            while (resultSet.next()) {
                user = new User();
                user.setId(resultSet.getInt("id"));
                user.setName(resultSet.getString("user_name"));
                user.setEmail(resultSet.getString("email"));
                user.setCountry(resultSet.getString("country"));

                if(!userList.contains(user)) {  // để danh sách không bị trùng lặp
                    userList.add(user);
                }
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return userList;
    }

    @Override
    public String insertUser(User user) throws SQLException {
        int row = 0;
        PreparedStatement preparedStatement = baseRepository.getConnection().prepareStatement("insert into users(user_name, email, country) \n" +
                "values(?,?,?);");
        //set value cho ?
        preparedStatement.setString(1, user.getName());
        preparedStatement.setString(2, user.getEmail());
        preparedStatement.setString(3, user.getCountry());

        row = preparedStatement.executeUpdate();
        return row > 0 ? "successful" : "insert fail!";
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        int row = 0;
        PreparedStatement preparedStatement = baseRepository.getConnection().prepareStatement(" update users\n" +
                " set user_name = ?,email = ?,country = ?\n" +
                " where id = ?;");
        preparedStatement.setString(1,user.getName());
        preparedStatement.setString(2,user.getEmail());
        preparedStatement.setString(3,user.getCountry());
        preparedStatement.setInt(4,user.getId());
        row = preparedStatement.executeUpdate();
        return row > 0;
    }

    @Override
    public boolean delete(int id) throws SQLException {
        int row = 0;
        PreparedStatement preparedStatement = baseRepository.getConnection().prepareStatement(" delete \n" +
                " from users\n" +
                " where id = ?;");
        preparedStatement.setInt(1,id);  // set id --> lệnh SQL
        row = preparedStatement.executeUpdate();   //Note: gọi lệnh xóa!

        return row > 0;
    }

    @Override
    public User selectUser(int id) {
        User user = new User();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = baseRepository.getConnection().prepareStatement(" select id, user_name,email,country\n" +
                    " from users\n" +
                    " where id = ?;");
            preparedStatement.setString(1, id+"");
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                user.setId(id);
                user.setName(rs.getString("user_name"));
                user.setEmail(rs.getString("email"));
                user.setCountry(rs.getString("country"));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return user;
    }

    //----------------- 13_practice 1 ---------------//
    public User getUserById(int id) {
        User user = null;
        try {
            CallableStatement callableStatement = baseRepository.getConnection().prepareCall("call get_user_by_id(?); ");
            callableStatement.setInt(1,id);
            ResultSet resultSet = callableStatement.executeQuery(); //user_name,email,country
            if (resultSet.next()) {
                user = new User();
                user.setId(id);
                user.setName(resultSet.getString("user_name"));
                user.setEmail(resultSet.getString("email"));
                user.setCountry(resultSet.getString("country"));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return user;
    };

    public boolean insertUserBySP(User user) {
        int row = 0;
        try {
            CallableStatement callableStatement = baseRepository.getConnection().prepareCall("call insert_user (?,?,?);");
            callableStatement.setString(1, user.getName());
            callableStatement.setString(2,  user.getEmail());
            callableStatement.setString(3,  user.getCountry());

            row = callableStatement.executeUpdate();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return row>0;
    }

    //----------------- 13_practice 2 ---------------//
    @Override
    public void addUserTransaction(User user, int[] permisions) {
        Connection connection = null;
        // for insert a new user
        PreparedStatement pstmt = null;
        // for assign permision to user
        PreparedStatement pstmtAssignment = null;
        // for getting user id
        ResultSet rs = null;
        try {
            connection = baseRepository.getConnection();
            // set auto commit to false
            connection.setAutoCommit(false);
            // Insert user
            pstmt = connection.prepareStatement("INSERT INTO users (name, email, country) " +
                    "VALUES  (?, ?, ?)", Statement.RETURN_GENERATED_KEYS);
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getCountry());
            int rowAffected = pstmt.executeUpdate();
            // get user id
            rs = pstmt.getGeneratedKeys();
            int userId = 0;
            if (rs.next())
                userId = rs.getInt(1);

            // in case the insert operation successes, assign permision to user

            if (rowAffected == 1) {
                // assign permision to user

                pstmtAssignment = connection.prepareStatement("INSERT INTO user_permision(user_id,permision_id) \"\n" +
                        "                        + \"VALUES(?,?)");
                for (int permisionId : permisions) {
                    pstmtAssignment.setInt(1, userId);
                    pstmtAssignment.setInt(2, permisionId);
                    pstmtAssignment.executeUpdate();
                }
                connection.commit();
            } else {
                connection.rollback();
            }
        } catch (SQLException ex) {

            // roll back the transaction

            try {
                if (connection != null)
                    connection.rollback();
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
            System.out.println(ex.getMessage());

        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (pstmtAssignment != null) pstmtAssignment.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
        }
    }
}
