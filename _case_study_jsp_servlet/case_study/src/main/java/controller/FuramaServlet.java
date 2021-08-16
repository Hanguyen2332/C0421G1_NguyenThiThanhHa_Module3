package controller;


import model.bean.customer.Customer;
import model.bean.employee.Employee;
import model.bean.service.Service;
import model.service.IFuramaService;
import model.service.iplm.customer_ser.CustomerService;
import model.service.iplm.employee_ser.EmployeeService;
import model.service.iplm.service_ser.ServiceSer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


@WebServlet(name = "FuramaServlet", urlPatterns = {"", "/furama"})
public class FuramaServlet extends HttpServlet {
    //customer
    private static IFuramaService<Customer> customer = new CustomerService();
    //service
    private static IFuramaService<Service> service = new ServiceSer();
    //employee
    private static IFuramaService<Employee> employees = new EmployeeService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
//4.	Tạo màn hình thêm mới 1 Nhân viên (sử dụng bảng employee)
//5.	Tạo màn hình liệt kê danh sách Nhân viên (Dạng bảng, có phân trang, nhảy trang, tìm kiếm, liên kết đến các chức năng xóa và chỉnh sửa thông tin của Nhân viên).
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "customer_list":
              //goi ham showCustomerList() : forward --> jsp customer
                showCustomerList(request,response);
                break;
            case "service_list":
               //goi ham showServiceList() : forward --> jsp service
                showServiceList(request,response);
                break;
            case "employee_list":
                //goi ham showEmployeeList() : forward --> jsp service
                showEmployeeList(request,response);
                break;

            default:
                //call function furama/host_page.jsp:
                hostPage(request, response);
        }
    }

    //showEmployeeList:
    public static void showEmployeeList(HttpServletRequest request, HttpServletResponse response) {
        List<Employee> employeeList = employees.showList();
        //forward --> employee_list.jsp
        request.setAttribute("employeeList",employeeList);
        try {
            request.getRequestDispatcher("furama/employee/employee_list.jsp").forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    //hien thi showServiceList():
    public static void showServiceList(HttpServletRequest request, HttpServletResponse response) {
        List<Service> serviceList = service.showList();
        //forward --> employee_list.jsp
        request.setAttribute("serviceList",serviceList);
        try {
            request.getRequestDispatcher("furama/service/service_list.jsp").forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    //hien thi showCustomerList():
    public static void showCustomerList(HttpServletRequest request, HttpServletResponse response) {
        List<Customer> customerList = customer.showList();
        //gui sang jsp:
            request.setAttribute("customerList",customerList);
        try {
            request.getRequestDispatcher("furama/customer/customer_list.jsp").forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    //hien thi hostPage-default:
    public void hostPage(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("furama/host_page.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
