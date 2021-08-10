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
            preparedStatement.setString(1, country);

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
    public List<User> orderByName() {
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
            CallableStatement callableStatement = baseRepository.getConnection().prepareCall(
                    "call show_list();"
            );
            ResultSet resultSet = callableStatement.executeQuery();

            //convert record --> object --> add userList:
            User user = null;
            while (resultSet.next()) {
                user = new User();
                user.setId(resultSet.getInt("id"));
                user.setName(resultSet.getString("user_name"));
                user.setEmail(resultSet.getString("email"));
                user.setCountry(resultSet.getString("country"));

                if (!userList.contains(user)) {  // để danh sách không bị trùng lặp
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
        CallableStatement callableStatement = baseRepository.getConnection().prepareCall("call update_user(?,?,?,?);");
        callableStatement.setString(1, user.getName());
        callableStatement.setString(2, user.getEmail());
        callableStatement.setString(3, user.getCountry());
        callableStatement.setInt(4, user.getId());
        row = callableStatement.executeUpdate();
        return row > 0;
    }

    @Override
    public boolean delete(int id) throws SQLException {
        int row = 0;
        CallableStatement callableStatement = baseRepository.getConnection().prepareCall(" call delete_user(?);");
        callableStatement.setInt(1, id);  // set id --> lệnh SQL
        row = callableStatement.executeUpdate();   //Note: gọi lệnh xóa!

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
            preparedStatement.setString(1, id + "");
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
}
