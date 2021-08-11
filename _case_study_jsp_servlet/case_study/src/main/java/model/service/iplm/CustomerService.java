package model.service.iplm;

import model.bean.Customer;
import model.repository.ICustomerRepository;
import model.repository.IFuramaRepository;
import model.repository.iplm.CustomerRepository;
import model.service.ICustomerService;
import model.service.IFuramaService;

import java.util.List;

public class CustomerService implements ICustomerService {
    private IFuramaRepository<Customer> customerRepository = new CustomerRepository();

    @Override
    public List<Customer> showList() {
        return customerRepository.showList();
    }

    @Override
    public String createNew(Customer object) {
        return null;
    }
}
