package model.repository.iplm.customer;

import model.bean.customer.Customer;
import model.repository.BaseRepository;
import model.repository.i_customer.ICustomerRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {
    private BaseRepository baseRepository = new BaseRepository();
    Connection connection = baseRepository.getConnection();

    //checkDuplicated code/idCard:
    //select customer_id_card
//    from customer;

    @Override
    public String checkDuplicateCode(String cusCode){
        List<String> cusCodeList = new ArrayList<>();
        String mesCodeDup = null;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select customer_code\n" +
                    "from customer;");
            ResultSet resultSet = preparedStatement.executeQuery();
            //add list
            while (resultSet.next()) {
                cusCodeList.add(resultSet.getString("customer_code"));
            }
            //check duplicate:
            if (cusCodeList.contains(cusCode)) {
                 mesCodeDup = "Ma KH nay da ton tai. Vui long kiem tra lai!";
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return mesCodeDup;
    };

    @Override
    public String checkDuplicateIdCard(String cusIdCard){
        List<String> cusIdCardList = new ArrayList<>();
        String mesIdCardDup = null;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select customer_id_card\n" +
                    "from customer;");
            ResultSet resultSet = preparedStatement.executeQuery();
            //add list
            while (resultSet.next()) {
                cusIdCardList.add(resultSet.getString("customer_code"));
            }
            //check duplicate:
            if (cusIdCardList.contains(cusIdCard)) {
                mesIdCardDup = "ID Card nay da ton tai. Vui long kiem tra lai!";
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return mesIdCardDup;
    };

    //find by id:
    @Override
    public Customer findById(int id){
        Customer customer = null;
        String selectSql = "select customer_code,C.customer_type_id, customer_type_name,customer_name,customer_birthday," +
                "customer_gender,customer_id_card,customer_phone,customer_email,customer_address\n" +
                "from customer C\n" +
                "inner join customer_type Ctype ON Ctype.customer_type_id = C.customer_type_id\n" +
                "where customer_id = ?;";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(selectSql);
            preparedStatement.setInt(1,id);

            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()){
                customer = new Customer();
                customer.setCustomerId(id);

                customer.setCustomerCode(resultSet.getString("customer_code"));
                customer.setCustomerTypeId(resultSet.getInt("C.customer_type_id"));
                customer.setCustomerTypeName(resultSet.getString("customer_type_name"));
                customer.setCustomerName(resultSet.getString("customer_name"));
                customer.setDayOfBirth(resultSet.getDate("customer_birthday"));

                customer.setGender(resultSet.getBoolean("customer_gender"));
                customer.setIdCard(resultSet.getString("customer_id_card"));
                customer.setPhone(resultSet.getString("customer_phone"));
                customer.setEmail(resultSet.getString("customer_email"));
                customer.setAddress(resultSet.getString("customer_address"));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return customer;
    }

    //Update customer
    @Override
    public boolean edit(Customer customer) {
        int row = 0;
        String updateSql = "UPDATE customer\n" +
                "SET customer_code = ?, customer_type_id = ?, customer_name = ?, customer_birthday = ?, customer_gender = ?,\n" +
                "customer_id_card = ?, customer_phone = ?, customer_email = ?, customer_address = ?\n" +
                "WHERE customer_id = ?;";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(updateSql);

            preparedStatement.setString(1,customer.getCustomerCode());
            preparedStatement.setInt(2,customer.getCustomerTypeId()); //int
            preparedStatement.setString(3,customer.getCustomerName());
            preparedStatement.setDate(4,customer.getDayOfBirth()); //date
            preparedStatement.setBoolean(5,customer.getGender()); //boolean --> bit
            preparedStatement.setString(6,customer.getIdCard());
            preparedStatement.setString(7,customer.getPhone());
            preparedStatement.setString(8,customer.getEmail());
            preparedStatement.setString(9,customer.getAddress());
            preparedStatement.setInt(10,customer.getCustomerId()); //int

            row = preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return row>0;
    };


    //delete customer:
    @Override
    public void delete(int id) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("delete\n" +
                    "from customer\n" +
                    "where customer_id = ?;");
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    //show customerList:
    @Override
    public List<Customer> showList() {
        List<Customer> customerList = new ArrayList<>();  //NOTE: BUG: Chưa khởi tạo List;
        String sql = "select  customer_id,customer_code,C.customer_type_id, customer_type_name,customer_name," +
                "customer_birthday,customer_gender,customer_id_card,customer_phone,customer_email,customer_address\n" +
                "from customer C\n" +
                "inner join customer_type Ctype ON Ctype.customer_type_id = C.customer_type_id;";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Customer customer = new Customer();
                customer.setCustomerId(resultSet.getInt("customer_id"));
                customer.setCustomerCode(resultSet.getString("customer_code"));

                customer.setCustomerTypeId(resultSet.getInt("C.customer_type_id"));
                customer.setCustomerTypeName(resultSet.getString("customer_type_name"));
                customer.setCustomerName(resultSet.getString("customer_name"));
                customer.setDayOfBirth(resultSet.getDate("customer_birthday"));

                customer.setGender(resultSet.getBoolean("customer_gender"));
                customer.setIdCard(resultSet.getString("customer_id_card"));
                customer.setPhone(resultSet.getString("customer_phone"));
                customer.setEmail(resultSet.getString("customer_email"));
                customer.setAddress(resultSet.getString("customer_address"));

                customerList.add(customer);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return customerList;
    }

    //create customer
    @Override
    public String createNew(Customer object) {
        int row = 0;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO customer(customer_code,customer_type_id,customer_name,customer_birthday,customer_gender,customer_id_card,customer_phone,customer_email,customer_address)\n" +
                    "values (?,?,?,?,?,?,?,?,?);");
// Note: cẩn thận copy lệnh SQL sai cú pháp
            preparedStatement.setString(1,object.getCustomerCode());
            preparedStatement.setInt(2,object.getCustomerTypeId());
            preparedStatement.setString(3,object.getCustomerName());
            preparedStatement.setDate(4,object.getDayOfBirth()); //date

            preparedStatement.setBoolean(5,object.getGender());//boolean --> bit

            preparedStatement.setString(6,object.getIdCard());
            preparedStatement.setString(7,object.getPhone());
            preparedStatement.setString(8,object.getEmail());
            preparedStatement.setString(9,object.getAddress());

            row = preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return row>0? "Create new successfully!" : "Create new Fail!";
    }
}
