package model.service.iplm.service_ser;

import model.bean.service.RentType;
import model.repository.i_employee.IDivisionRepository;
import model.repository.i_service.IRentTypeRepository;
import model.repository.iplm.RentTypeRepository;
import model.service.IRentTypeService;

import java.util.List;

public class RentTypeService implements IRentTypeService {
    IRentTypeRepository rentTypeRepository = new RentTypeRepository();
    @Override
    public List<RentType> showList() {
        return rentTypeRepository.showList();
    }
}
