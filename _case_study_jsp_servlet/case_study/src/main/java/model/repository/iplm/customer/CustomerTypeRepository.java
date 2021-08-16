package model.repository.iplm.customer;

import model.bean.customer.CustomerType;
import model.repository.BaseRepository;
import model.repository.i_customer.ICustomerTypeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerTypeRepository implements ICustomerTypeRepository {
    private BaseRepository baseRepository = new BaseRepository();
    private Connection connection = baseRepository.getConnection();

    @Override
    public List<CustomerType> showList() {
        List<CustomerType> customerTypeList = new ArrayList<>();  //NOTE: BUG: Chưa khởi tạo List;
        PreparedStatement preparedStatement = null;
        {
            try {
                preparedStatement = connection.prepareStatement("select customer_type_id,customer_type_name\n" +
                        "from customer_type;");
                ResultSet resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    CustomerType customerType = new CustomerType();
                    customerType.setTypeId(resultSet.getInt(1));
                    customerType.setTypeName(resultSet.getString(2));

                    customerTypeList.add(customerType);
                }
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return customerTypeList;
    }
}
