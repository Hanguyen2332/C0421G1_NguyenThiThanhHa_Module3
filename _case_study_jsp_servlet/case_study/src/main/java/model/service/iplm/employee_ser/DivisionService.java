package model.service.iplm.employee_ser;

import model.bean.customer.CustomerType;
import model.bean.employee.Division;
import model.repository.IFuramaRepository;
import model.repository.iplm.customer.CustomerTypeRepository;
import model.repository.iplm.employee.DivisionRepository;
import model.service.ICustomerTypeService;
import model.service.i_empoyee_ser.IDivisionService;

import java.util.List;

public class DivisionService implements IDivisionService {
    private IFuramaRepository<Division> furamaRepository = new DivisionRepository();

    @Override
    public List<Division> showList() {
        return furamaRepository.showList();
    }
}
