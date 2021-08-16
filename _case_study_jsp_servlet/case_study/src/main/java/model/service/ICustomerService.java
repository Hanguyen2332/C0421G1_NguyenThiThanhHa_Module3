package model.service;

import model.bean.customer.Customer;

import java.util.Map;

public interface ICustomerService extends IFuramaService<Customer> {

    //    boolean createNew (Customer object);
    Map<String, String> createNew(Customer object);


    void delete(int id);

    boolean edit(Customer customer);

    Customer findById(int id);

    String checkDuplicateCode(String cusCode);

    String checkDuplicateIdCard(String cusIdCard);
}
