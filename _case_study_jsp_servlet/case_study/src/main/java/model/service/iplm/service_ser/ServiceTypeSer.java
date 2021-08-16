package model.service.iplm.service_ser;


import model.bean.service.ServiceType;
import model.repository.i_employee.IPositionRepository;
import model.repository.i_service.IServiceTypeRepos;
import model.repository.iplm.ServiceTypeRepos;
import model.service.IServiceType;

import java.util.List;

public class ServiceTypeSer implements IServiceType {
    private IServiceTypeRepos iServiceTypeRepos = new ServiceTypeRepos();
    @Override
    public List<ServiceType> showList() {
        return iServiceTypeRepos.showList();
    }
}
