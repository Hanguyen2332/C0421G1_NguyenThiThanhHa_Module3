package controller;

import model.bean.customer.Customer;
import model.bean.customer.CustomerType;
import model.service.ICustomerService;
import model.service.IFuramaService;
import model.service.iplm.customer_ser.CustomerService;
import model.service.iplm.customer_ser.CustomerTypeService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.util.List;
import java.util.Map;

@WebServlet(name = "CustomerServlet", urlPatterns = {"/customer"})
public class CustomerServlet extends HttpServlet {
    private IFuramaService<CustomerType> customerTypeService = new CustomerTypeService();
    private ICustomerService customerService = new CustomerService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create_customer":
                //goi ham create:
                createCus(request, response);
                break;
            case "edit":
                //goi ham editCus():
                editCus(request, response);
                break;
            default:
                break;
        }
    }

    //ham editCus():
    protected void editCus(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = customerService.findById(id);

        //set:
        customer.setCustomerCode(request.getParameter("cusCode"));
        customer.setCustomerName(request.getParameter("cusName"));
        customer.setCustomerTypeId(Integer.parseInt(request.getParameter("cusType")));
        customer.setDayOfBirth(Date.valueOf(request.getParameter("dayOfBirth")));
        customer.setGender(Boolean.getBoolean(request.getParameter("customer_gender")));
        customer.setIdCard(request.getParameter("idCard"));
        customer.setPhone(request.getParameter("phoneNumber"));
        customer.setEmail(request.getParameter("email"));
        customer.setAddress(request.getParameter("address"));

        if (customerService.edit(customer)) {
            request.setAttribute("message", "Update Customer Successfully!");
            FuramaServlet.showCustomerList(request, response);
        } else {
            request.setAttribute("message", "Update Customer fail!");
            try {
                request.getRequestDispatcher("furama/customer/customer_edit.jsp").forward(request, response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        }
    }

    //ham create customer:
    protected void createCus(HttpServletRequest request, HttpServletResponse response) {
        Customer customer = new Customer();
        customer.setCustomerCode(request.getParameter("cusCode"));
        customer.setCustomerName(request.getParameter("cusName"));
        customer.setCustomerTypeId(Integer.parseInt(request.getParameter("cusType")));
        customer.setDayOfBirth(Date.valueOf(request.getParameter("dayOfBirth")));
        customer.setGender(Boolean.getBoolean(request.getParameter("customer_gender")));
        customer.setIdCard(request.getParameter("idCard"));
        customer.setPhone(request.getParameter("phoneNumber"));
        customer.setEmail(request.getParameter("email"));
        customer.setAddress(request.getParameter("address"));

        //thong bao neu ma KH trung:
//        String mesCodeDup = customerService.checkDuplicateCode(request.getParameter("cusCode"));
//        //thong bao neu ID Card trung:
//        String mesIdCardDup = customerService.checkDuplicateIdCard(request.getParameter("idCard"));

        Map<String, String> validateMesMap = customerService.createNew(customer);
//----------------test------------------------//
        try {
            if (validateMesMap.get("messCallFunction") != null) {  //TH: gọi hàm thành công + add DB ok:
                if (validateMesMap.get("messCallFunction").equals("Create new successfully!")) {
                    request.setAttribute("message", "Create new successfully!");
                    FuramaServlet.showCustomerList(request, response);
                } else {  //Gọi hàm thành công - add DB fail [do loi khac (VD: Ma code trung nhau..)]
                    request.setAttribute("cusObj", customer);
                    request.setAttribute("customerTypeList", customerTypeService.showList());  //show option Cus-type
                    request.setAttribute("message", "Create new FAIL!");
                    request.getRequestDispatcher("furama/customer/customer_create.jsp").forward(request, response);
                }
            } else {   //KHONG goi được hàm - do lỗi Validate
                request.setAttribute("cusObj", customer);
                request.setAttribute("customerTypeList", customerTypeService.showList());  //show option Cus-type
                request.setAttribute("validateMesMap", validateMesMap);                 //show message wrong format
                request.getRequestDispatcher("furama/customer/customer_create.jsp").forward(request, response);
            }
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create_customer":
                //show form create:
                showCreateCustomerForm(request, response);
                break;
            case "delete":
                //goi ham deleteCus():
                deleteCus(request, response);
                break;
            case "edit":
                //goi ham editCusForm():
                editCusForm(request, response);
                break;
            default:
                //hien thi list customer:
                FuramaServlet.showCustomerList(request, response);
        }
    }

    //ham editCus():
    private void editCusForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = customerService.findById(id);
        request.setAttribute("customer", customer);
        //get CustomerType --> forward:
        List<CustomerType> customerTypeList = customerTypeService.showList();
        request.setAttribute("customerTypeList", customerTypeList);
        try {
            request.getRequestDispatcher("furama/customer/customer_edit.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    //ham deleteCus():
    private void deleteCus(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        customerService.delete(id); //viet ham xoa
        FuramaServlet.showCustomerList(request, response);
    }

    //ham create Customer:
    private void showCreateCustomerForm(HttpServletRequest request, HttpServletResponse response) {
        List<CustomerType> customerTypeList = customerTypeService.showList();
        request.setAttribute("customerTypeList", customerTypeList);
        try {
            request.getRequestDispatcher("furama/customer/customer_create.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
