package model.repository.iplm.employee;

import model.bean.customer.Customer;
import model.bean.employee.Employee;
import model.repository.BaseRepository;
import model.repository.i_customer.ICustomerRepository;
import model.repository.i_employee.IEmployeeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeRepository implements IEmployeeRepository {
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
    public Employee findById(int id){
        Employee employee = null;
        String selectSql = "select employee_id,employee_name,employee_birthday,employee_id_card,employee_salary,employee_phone,employee_email,employee_address,E.position_id,E.education_degree_id,\n" +
                "E.division_id,user_name,Edu.education_degree_name,D.division_name,P.position_name\n" +
                "FROM employee E \n" +
                "INNER JOIN education_degree Edu ON Edu.education_degree_id = E.education_degree_id\n" +
                "INNER JOIN division D ON D.division_id = E.division_id\n" +
                "INNER JOIN position P ON P.position_id = E.position_id\n" +
                "WHERE employee_id = ?;\n";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(selectSql);
            preparedStatement.setInt(1,id);

            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()){
                employee = new Employee();

                employee.setEmployeeId(id);
                employee.setEmployeeName(resultSet.getString("employee_name"));
                employee.setDayOfBirth(resultSet.getDate("employee_birthday"));
                employee.setIdCard(resultSet.getString("employee_id_card"));
                employee.setSalary(resultSet.getDouble("employee_salary"));
                employee.setPhone(resultSet.getString("employee_phone"));
                employee.setEmail(resultSet.getString("employee_email"));
                employee.setAddress(resultSet.getString("employee_address"));

                employee.setPositionId(resultSet.getInt("E.position_id"));
                employee.setDegreeId(resultSet.getInt("E.education_degree_id"));
                employee.setDivisionId(resultSet.getInt("E.division_id"));

                employee.setPositionName(resultSet.getString("P.position_name"));
                employee.setDegreeName(resultSet.getString("Edu.education_degree_name"));
                employee.setDivisionName(resultSet.getString("D.division_name"));

                employee.setUserName(resultSet.getString("user_name"));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return employee;
    }

    //Update customer
    @Override
    public boolean edit(Employee employee) {
        int row = 0;
        String updateSql = "UPDATE employee\n" +
                "SET employee_name = ?,employee_birthday = ?,employee_id_card = ?,employee_salary = ?,employee_phone = ?,\n" +
                "employee_email = ?,employee_address =?,position_id = ?, education_degree_id = ?,\n" +
                "division_id = ?,user_name = ?\n" +
                "WHERE employee_id = ?;";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(updateSql);

            preparedStatement.setString(1,employee.getEmployeeName());
            preparedStatement.setDate(2,employee.getDayOfBirth()); //date
            preparedStatement.setString(3,employee.getIdCard());
            preparedStatement.setDouble(4,employee.getSalary()); //boolean --> bit
            preparedStatement.setString(5,employee.getPhone());
            preparedStatement.setString(6,employee.getEmail());
            preparedStatement.setString(7,employee.getAddress());
            preparedStatement.setInt(8,employee.getPositionId()); //int
            preparedStatement.setInt(9,employee.getDegreeId()); //int
            preparedStatement.setInt(10,employee.getDivisionId()); //int
            preparedStatement.setString(11,employee.getUserName());
            preparedStatement.setInt(12,employee.getEmployeeId()); //int
            row = preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return row>0;
    }


    //delete customer:
    @Override
    public void delete(int id) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("DELETE \n" +
                    "FROM employee\n" +
                    "WHERE employee_id = ?;");
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    //show customerList:
    @Override
    public List<Employee> showList() {
        List<Employee> employeeList = new ArrayList<>();  //NOTE: BUG: Chưa khởi tạo List;
        String sql = "select employee_id,employee_name,employee_birthday,employee_id_card,employee_salary,employee_phone,employee_email,employee_address,E.position_id,E.education_degree_id,\n" +
                "E.division_id,user_name,Edu.education_degree_name,D.division_name,P.position_name\n" +
                "FROM employee E \n" +
                "INNER JOIN education_degree Edu ON Edu.education_degree_id = E.education_degree_id\n" +
                "INNER JOIN division D ON D.division_id = E.division_id\n" +
                "INNER JOIN position P ON P.position_id = E.position_id;";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Employee employee = new Employee();

                employee.setEmployeeId(resultSet.getInt("employee_id"));
                employee.setEmployeeName(resultSet.getString("employee_name"));
                employee.setDayOfBirth(resultSet.getDate("employee_birthday"));
                employee.setIdCard(resultSet.getString("employee_id_card"));
                employee.setSalary(resultSet.getDouble("employee_salary"));
                employee.setPhone(resultSet.getString("employee_phone"));
                employee.setEmail(resultSet.getString("employee_email"));
                employee.setAddress(resultSet.getString("employee_address"));

                employee.setPositionId(resultSet.getInt("E.position_id"));
                employee.setDegreeId(resultSet.getInt("E.education_degree_id"));
                employee.setDivisionId(resultSet.getInt("E.division_id"));

                employee.setPositionName(resultSet.getString("P.position_name"));
                employee.setDegreeName(resultSet.getString("Edu.education_degree_name"));
                employee.setDivisionName(resultSet.getString("D.division_name"));

                employee.setUserName(resultSet.getString("user_name"));

                employeeList.add(employee);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return employeeList;
    }

    //create customer
    @Override
    public String createNew(Employee object) {
//        int row = 0;
//        try {
//            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO customer(customer_code,customer_type_id,customer_name,customer_birthday,customer_gender,customer_id_card,customer_phone,customer_email,customer_address)\n" +
//                    "values (?,?,?,?,?,?,?,?,?);");
//// Note: cẩn thận copy lệnh SQL sai cú pháp
//            preparedStatement.setString(1,object.getCustomerCode());
//            preparedStatement.setInt(2,object.getCustomerTypeId());
//            preparedStatement.setString(3,object.getCustomerName());
//            preparedStatement.setDate(4,object.getDayOfBirth()); //date
//
//            preparedStatement.setBoolean(5,object.getGender());//boolean --> bit
//
//            preparedStatement.setString(6,object.getIdCard());
//            preparedStatement.setString(7,object.getPhone());
//            preparedStatement.setString(8,object.getEmail());
//            preparedStatement.setString(9,object.getAddress());
//
//            row = preparedStatement.executeUpdate();
//        } catch (SQLException throwables) {
//            throwables.printStackTrace();
//        }
//        return row>0? "Create new successfully!" : "Create new Fail!";
        return  null;
    }
}
