package model.service.i_empoyee_ser;

import model.bean.customer.Customer;
import model.bean.employee.Employee;
import model.service.IFuramaService;

import java.util.Map;

public interface IEmployeeService extends IFuramaService<Employee> {

    Map<String, String> createNew(Employee object);

    void delete(int id);

    Map<String,String> edit(Employee employee);



    Employee findById(int name);  //Để update ....



    String checkDuplicateCode(String cusCode);

    String checkDuplicateIdCard(String cusIdCard);
}
