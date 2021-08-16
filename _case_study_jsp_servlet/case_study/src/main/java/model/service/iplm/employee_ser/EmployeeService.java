package model.service.iplm.employee_ser;

import model.bean.customer.Customer;
import model.bean.employee.Employee;
import model.repository.i_customer.ICustomerRepository;
import model.repository.i_employee.IEmployeeRepository;
import model.repository.iplm.customer.CustomerRepository;
import model.repository.iplm.employee.EmployeeRepository;
import model.service.ICustomerService;
import model.service.common.Validate;
import model.service.i_empoyee_ser.IEmployeeService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class EmployeeService implements IEmployeeService {
    private IEmployeeRepository iEmployeeRepository = new EmployeeRepository();

    @Override
    public void delete(int id){iEmployeeRepository.delete(id);}

    @Override
    public List<Employee> showList() {
        return iEmployeeRepository.showList();
    }

//    @Override
//    public boolean createNew(Customer object) {
//        return customerRepository.createNew(object);
//    }

    @Override
    public Map<String, String> createNew(Employee object) {
//        //Validate:
//
//       //tao Map --> hứng thông báo lỗi:
//        Map<String,String> validateMesMap = new HashMap<>();
//
//        //check code
//        String checkCode = Validate.cusCode(object.getCustomerCode());
//        if (checkCode !=null) {
////            validateMesMap.put("checkCode","");
////        }else {
//            validateMesMap.put("checkCode","Vui lòng nhập theo định dạng: 'KH-XXXX' (X: 0-9)");
//        }
//
//        //check Id Card
//        String checkIdCard = Validate.idCard(object.getIdCard());
//        if (checkIdCard !=null) {
////            validateMesMap.put("checkIdCard","");
////        }else {
//            validateMesMap.put("checkIdCard","Vui lòng nhập theo định dạng: 'XXXXXXXXX' or 'XXXXXXXXX'  (X: 0-9)");
//        }
//
//        //check Phone
//        String checkPhone = Validate.phoneNumber(object.getPhone());
//        if (checkPhone !=null) {
////            validateMesMap.put("checkPhone","");
////        }else {
//            validateMesMap.put("checkPhone","Vui lòng nhập theo định dạng: '090xxxxxxx' or '091xxxxxxx or (84)+90xxxxxxx or (84)+91xxxxxxx");
//        }
//
//        //check Email
//        String checkEmail = Validate.email(object.getEmail());
//        if (checkEmail != null) {
////            validateMesMap.put("checkEmail","");
////        }else {
//            validateMesMap.put("checkEmail","Email sai định dạng");
//        }
//
////        check Name
//        String checkName = Validate.name(object.getCustomerName());
//        if (checkName !=null) {
////            validateMesMap.put("checkName","");
////        }else {
//            validateMesMap.put("checkName","Tên không được chứa ký tự số");
//        }
//
//        //goi ham:
//        if (validateMesMap.isEmpty()) {
//            String message = customerRepository.createNew(object);
//            validateMesMap.put("messCallFunction",message);
//        }
//        return validateMesMap;  //neu KHONG co loi validate --> size =1 /  ELSE --> size = so loi validate
        return null;
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
    public  Map<String,String> edit(Employee employee) {
//Validate:
        //tao Map --> hứng thông báo lỗi:
        Map<String,String> validateMesMap = new HashMap<>();

//        1. check Name
        String checkName = Validate.name(employee.getEmployeeName());
        if (checkName !=null) {
            validateMesMap.put("checkName",checkName);
        }
//        2. check Birth Day:
        String checkBirthDay = Validate.checkAge(employee.getDayOfBirth());
        if (checkBirthDay !=null) {
            validateMesMap.put("checkBirthDay",checkBirthDay);
        }
//        3. check Id Card
        String checkIdCard = Validate.idCard(employee.getIdCard());
        if (checkIdCard !=null) {
            validateMesMap.put("checkIdCard",checkIdCard);
        }
        //        4. check salary (double)
        String checkSalary = Validate.doubleNumber(employee.getSalary());
        if (checkSalary !=null) {
            validateMesMap.put("checkSalary",checkSalary);
        }

        //5. check Phone
        String checkPhone = Validate.phoneNumber(employee.getPhone());
        if (checkPhone !=null) {
            validateMesMap.put("checkPhone",checkPhone);
        }

        //check Email
        String checkEmail = Validate.email(employee.getEmail());
        if (checkEmail != null) {
            validateMesMap.put("checkEmail",checkEmail);
        }

        //goi ham:
        if (validateMesMap.isEmpty()) {
            iEmployeeRepository.edit(employee);
        }
        return validateMesMap;  //neu KHONG co loi validate --> size =0 /  ELSE --> size = so loi validate
    }

    @Override
    public Employee findById(int id) {
        return iEmployeeRepository.findById(id);
    }

    @Override
    public String checkDuplicateCode(String cusCode) {

        return null;
    }

    @Override
    public String checkDuplicateIdCard(String cusIdCard) {
        return null;
    }


}
