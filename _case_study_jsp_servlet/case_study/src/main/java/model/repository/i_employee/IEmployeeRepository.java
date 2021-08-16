package model.repository.i_employee;

import model.bean.customer.Customer;
import model.bean.employee.Employee;
import model.repository.IFuramaRepository;

public interface IEmployeeRepository extends IFuramaRepository<Employee> {
        String createNew (Employee object);
//void createNew (Customer object);

        void delete(int id);

        boolean edit(Employee employee);

        Employee findById(int id);

        String checkDuplicateCode(String cusCode);

        String checkDuplicateIdCard(String cusIdCard);
}
