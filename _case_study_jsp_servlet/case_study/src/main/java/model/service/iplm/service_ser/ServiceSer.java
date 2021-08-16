package model.service.iplm.service_ser;

import model.bean.service.Service;
import model.repository.i_service.IServiceRepository;
import model.repository.iplm.ServiceRepository;
import model.service.IService;
import model.service.common.Validate;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ServiceSer implements IService {
    private IServiceRepository serviceRepository = new ServiceRepository();

    @Override
    public Map<String, String> createService(Service service) {
        //Tao map code:
        Map<String, String> validateMesMap = new HashMap<>();

        //validate:
        String checkCode = Validate.serCode(service.getCode());
        if (checkCode != null) {
            validateMesMap.put("checkCode",checkCode);
        }
        //service name/description:
            String checkSerName = Validate.text(service.getServiceName());
            if (checkSerName != null) {
                validateMesMap.put("checkName",checkSerName);
            }
//
        //doubleNumber: area/price...
        String checkArea = Validate.doubleNumber(service.getArea());
        if (checkArea != null) {
            validateMesMap.put("checkArea",checkArea);
        }
        //maxPeople
        String checkMaxPeople = Validate.intNumber(service.getMaxPeople());
        if (checkMaxPeople != null) {
            validateMesMap.put("checkMaxPeople",checkMaxPeople);
        }
        //service standard room - text:
        if (!service.getStandardRoom().equals("")) { //Room: NOT HAVE
            String checkStandardRoom = Validate.text(service.getStandardRoom());
            if (checkStandardRoom != null) {
                validateMesMap.put("checkStandardRoom",checkStandardRoom);
            }
        }

        //POOL Area
        if (service.getPoolArea()!=0) {  ////Room: NOT HAVE
            String checkPoolArea= Validate.doubleNumber(service.getPoolArea());
            if (checkPoolArea != null) {
                validateMesMap.put("checkPoolArea",checkPoolArea);
            }
        }

        //maxPeople
        if (service.getFloors()!=0) {  ////Room: NOT HAVE
            String checkFloors = Validate.intNumber(service.getFloors());
            if (checkFloors != null) {
                validateMesMap.put("checkFloors",checkFloors);
            }
        }

        //Price
        String checkCost = Validate.doubleNumber(service.getCost());
        if (checkCost != null) {
            validateMesMap.put("checkCost",checkCost);
        }
        //neu map empty --> khong co loi validate--> goi ham:
        if (validateMesMap.isEmpty()) {
            String message = serviceRepository.createService(service);
            validateMesMap.put("messFromCreateFunction",message);
        }
        return validateMesMap;
    }

    @Override
    public List<model.bean.service.Service> showList() {
        return serviceRepository.showList();
    }
}
