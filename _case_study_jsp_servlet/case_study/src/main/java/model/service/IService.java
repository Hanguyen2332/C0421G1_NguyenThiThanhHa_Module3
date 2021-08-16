package model.service;

import model.bean.service.Service;

import java.util.Map;

public interface IService extends IFuramaService<Service> {

    Map<String,String> createService(Service service);

}
