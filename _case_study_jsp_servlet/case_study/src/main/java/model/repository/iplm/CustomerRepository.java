package model.repository.iplm;

import model.bean.Customer;
import model.repository.BaseRepository;
import model.repository.ICustomerRepository;
import model.service.ICustomerService;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {
    private BaseRepository baseRepository = new BaseRepository();
    @Override
    public List<Customer> showList() {
        List<Customer> customerList = null;
        Connection connection = baseRepository.getConnection();
        String sql = "select  customer_id,customer_code, customer_type_name,customer_name,customer_birthday," +
                "customer_gender,customer_id_card,customer_phone,customer_email,customer_address\n" +
                "from customer C\n" +
                "inner join customer_type Ctype ON Ctype.customer_type_id = C.customer_type_id;\n";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Customer customer = new Customer();
                customer.setCustomerId(resultSet.getInt("customer_id"));
                customer.setCustomerCode(resultSet.getString("customer_code"));

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

    @Override
    public String createNew(Customer object) {
        return null;
    }
}
