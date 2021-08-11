package model.service.iplm;

import model.bean.Customer;
import model.bean.CustomerType;
import model.repository.IFuramaRepository;
import model.repository.iplm.CustomerRepository;
import model.repository.iplm.CustomerTypeRepository;
import model.service.ICustomerTypeService;

import java.util.List;

public class CustomerTypeService implements ICustomerTypeService {
    private IFuramaRepository<CustomerType> furamaRepository = new CustomerTypeRepository();

    @Override
    public List<CustomerType> showList() {
        return furamaRepository.showList();
    }
}
