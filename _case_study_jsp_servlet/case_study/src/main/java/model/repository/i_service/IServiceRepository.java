package model.repository.i_service;

import model.bean.service.Service;
import model.repository.IFuramaRepository;

public interface IServiceRepository extends IFuramaRepository<Service> {

    String createService(Service service);
}
