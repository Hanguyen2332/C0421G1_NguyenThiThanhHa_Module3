package model.service;

import model.bean.Customer;

public interface ICustomerService extends IFuramaService<Customer> {
    String createNew (Customer object);
}
