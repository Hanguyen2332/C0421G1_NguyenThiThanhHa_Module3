package model.service.iplm.employee_ser;

import model.bean.employee.Division;
import model.bean.employee.EducationDegree;
import model.repository.IFuramaRepository;
import model.repository.i_employee.IDegreeRepository;
import model.repository.iplm.employee.DegreeRepository;
import model.repository.iplm.employee.DivisionRepository;
import model.service.i_empoyee_ser.IEducationDegreeService;

import java.util.List;

public class EducationDegreeService implements IEducationDegreeService {
    private IFuramaRepository<EducationDegree> furamaRepository = new DegreeRepository() ;

    @Override
    public List<EducationDegree> showList() {
        return furamaRepository.showList();
    }
}
