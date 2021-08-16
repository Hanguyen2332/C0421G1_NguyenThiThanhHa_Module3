package model.service.iplm.customer_ser;

import model.bean.customer.CustomerType;
import model.repository.IFuramaRepository;
import model.repository.iplm.customer.CustomerTypeRepository;
import model.service.ICustomerTypeService;

import java.util.List;

public class CustomerTypeService implements ICustomerTypeService {
    private IFuramaRepository<CustomerType> furamaRepository = new CustomerTypeRepository();

    @Override
    public List<CustomerType> showList() {
        return furamaRepository.showList();
    }
}
