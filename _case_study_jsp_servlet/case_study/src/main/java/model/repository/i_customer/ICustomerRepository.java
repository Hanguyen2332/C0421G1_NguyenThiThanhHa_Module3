package model.repository.i_customer;

import model.bean.customer.Customer;
import model.repository.IFuramaRepository;

public interface ICustomerRepository extends IFuramaRepository<Customer> {
        String createNew (Customer object);
//void createNew (Customer object);

        void delete(int id);

        boolean edit(Customer customer);

        Customer findById(int id);

        String checkDuplicateCode(String cusCode);

        String checkDuplicateIdCard(String cusIdCard);
}
