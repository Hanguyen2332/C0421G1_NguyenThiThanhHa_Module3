package model.service.iplm.customer_ser;

import model.bean.customer.Customer;
import model.bean.employee.Employee;
import model.repository.i_customer.ICustomerRepository;
import model.repository.iplm.customer.CustomerRepository;
import model.service.ICustomerService;
import model.service.common.Validate;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CustomerService implements ICustomerService {
    private ICustomerRepository customerRepository = new CustomerRepository();

    @Override
    public void delete(int id){customerRepository.delete(id);}

    @Override
    public List<Customer> showList() {
        return customerRepository.showList();
    }

//    @Override
//    public boolean createNew(Customer object) {
//        return customerRepository.createNew(object);
//    }

    @Override
    public Map<String, String> createNew(Customer object) {
//Validate:

       //tao Map --> hứng thông báo lỗi:
        Map<String,String> validateMesMap = new HashMap<>();
        //        check code
        String checkCode = Validate.cusCode(object.getCustomerCode());
        if (checkCode !=null) {
            validateMesMap.put("checkCode",checkCode);
        }

        //check BirthDay
        String checkAge = Validate.checkAge(object.getDayOfBirth());
        if (checkAge !=null) {
            validateMesMap.put("checkAge",checkAge);
        }

//        check Name
        String checkName = Validate.name(object.getCustomerName());
        if (checkName !=null) {
            validateMesMap.put("checkName",checkName);
        }

        //check Id Card
        String checkIdCard = Validate.idCard(object.getIdCard());
        if (checkIdCard !=null) {
//            validateMesMap.put("checkIdCard","");
//        }else {
            validateMesMap.put("checkIdCard",checkIdCard);
        }

        //check Phone
        String checkPhone = Validate.phoneNumber(object.getPhone());
        if (checkPhone !=null) {
//            validateMesMap.put("checkPhone","");
//        }else {
            validateMesMap.put("checkPhone",checkPhone);
        }

        //check Email
        String checkEmail = Validate.email(object.getEmail());
        if (checkEmail != null) {
//            validateMesMap.put("checkEmail","");
//        }else {
            validateMesMap.put("checkEmail",checkEmail);
        }


        //goi ham:
        if (validateMesMap.isEmpty()) {
            String message = customerRepository.createNew(object);
            validateMesMap.put("messCallFunction",message);
        }
        return validateMesMap;  //neu KHONG co loi validate --> size =1 /  ELSE --> size = so loi validate
    }

//    public static void main(String[] args) {
//        CustomerService customerService = new CustomerService();
//        Map<String,String> map = new HashMap<>();
//        map.put("hoa","flower");
//        map.put("sông","river");
//        map.put("client",null);
//        map.put("server","");
//        System.out.println(map.get("sông"));
//        System.out.println(map.size());
//    }
    @Override
    public boolean edit(Customer customer) {



        return customerRepository.edit(customer);
    };

    @Override
    public Customer findById(int id){
        return customerRepository.findById(id);
    }

    @Override
    public String checkDuplicateCode(String cusCode) {
        return customerRepository.checkDuplicateCode(cusCode);
    }

    @Override
    public String checkDuplicateIdCard(String cusIdCard) {
        return customerRepository.checkDuplicateCode(cusIdCard);
    }


}
