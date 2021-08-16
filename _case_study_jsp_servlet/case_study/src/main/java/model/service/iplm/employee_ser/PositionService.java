package model.service.iplm.employee_ser;

import model.bean.employee.Division;
import model.bean.employee.Position;
import model.repository.IFuramaRepository;
import model.repository.iplm.employee.DivisionRepository;
import model.repository.iplm.employee.PositionRepository;
import model.service.i_empoyee_ser.IPositionService;

import java.util.List;

public class PositionService implements IPositionService {
    private IFuramaRepository<Position> furamaRepository = new PositionRepository();

    @Override
    public List<Position> showList() {
        return furamaRepository.showList();
    }
}
