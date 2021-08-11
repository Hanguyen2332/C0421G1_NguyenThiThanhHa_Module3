package model.repository;

import model.bean.Customer;
import model.service.iplm.CustomerService;

public interface ICustomerRepository extends IFuramaRepository<Customer> {
        String createNew (Customer object);
}
