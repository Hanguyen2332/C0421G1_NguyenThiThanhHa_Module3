package controller;

import model.bean.customer.CustomerType;
import model.bean.employee.Division;
import model.bean.employee.EducationDegree;
import model.bean.employee.Employee;
import model.bean.employee.Position;
import model.service.ICustomerService;
import model.service.IFuramaService;
import model.service.i_empoyee_ser.IDivisionService;
import model.service.i_empoyee_ser.IEducationDegreeService;
import model.service.i_empoyee_ser.IEmployeeService;
import model.service.i_empoyee_ser.IPositionService;
import model.service.iplm.customer_ser.CustomerService;
import model.service.iplm.customer_ser.CustomerTypeService;
import model.service.iplm.employee_ser.DivisionService;
import model.service.iplm.employee_ser.EducationDegreeService;
import model.service.iplm.employee_ser.EmployeeService;
import model.service.iplm.employee_ser.PositionService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "EmployeeServlet",urlPatterns = "/employee")
public class EmployeeServlet extends HttpServlet {
    //list nhân viên:
    private static IEmployeeService employeeService = new EmployeeService();
    private static List<Employee> employeeList = employeeService.showList();
    //position
    private static IPositionService positionService = new PositionService();
    private static List<Position> positionList = positionService.showList();
    //division
    private static IDivisionService divisionService = new DivisionService();
    private static List<Division> divisionList = divisionService.showList();
    //education degree
    private static IEducationDegreeService educationDegree = new EducationDegreeService();
    private static List<EducationDegree> educationDegreeList = educationDegree.showList();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
//            case "create_customer":
//                //goi ham create:
//                createEmployee(request, response);
//                break;
            case "edit":
                //goi ham editEmploy():
                editEmployee(request, response);
                break;
            default:
                break;
        }
    }
    //editEmployee:
    private void editEmployee(HttpServletRequest request, HttpServletResponse response) {
        //tao list hung NumberFormatEx:
        Map<String,String> isNumber = new HashMap<>();
        int id = Integer.parseInt(request.getParameter("id"));
        Employee employee = employeeService.findById(id);  //get object
        //set:
        employee.setEmployeeName(request.getParameter("name"));
        employee.setDayOfBirth(Date.valueOf(request.getParameter("dateOfBirth")));
        employee.setIdCard(request.getParameter("idCard"));
        employee.setSalary(Double.parseDouble(request.getParameter("salary")));
        employee.setPhone(request.getParameter("phone"));
        employee.setEmail(request.getParameter("email"));
        employee.setAddress(request.getParameter("address"));

        employee.setPositionId(Integer.parseInt(request.getParameter("positionId")));
        employee.setDegreeId(Integer.parseInt(request.getParameter("EduDegreeId")));
        employee.setDivisionId(Integer.parseInt(request.getParameter("divisionId")));

        employee.setUserName(request.getParameter("userName"));
        //validate:


        //object
        request.setAttribute("employee", employee);
        //position --> forward: (select-option)
        request.setAttribute("positionList", positionList);
        //divivsion -- select-option
        request.setAttribute("divisionList", divisionList);
        //education degree - select-option
        request.setAttribute("educationDegreeList", educationDegreeList);
        try {
            request.getRequestDispatcher("furama/employee/employee_edit.jsp").forward(request, response);
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
//            case "create_employee":
//                //show form create:
//                showCreateEmployeeForm(request, response);
//                break;
            case "delete":
                //goi ham delete():
                deleteEmployee(request, response);
                break;
            case "edit":
                //goi ham editCusForm():
                editEmployForm(request, response);
                break;
            default:
                //hien thi list customer:
                FuramaServlet.showCustomerList(request, response);
        }
    }

//    //    //ham editEmploy():
        private void editEmployForm(HttpServletRequest request, HttpServletResponse response) {
            int id = Integer.parseInt(request.getParameter("id"));
            Employee employee = employeeService.findById(id);  //hien thi theo id
            //object
            request.setAttribute("employee", employee);
            //position --> forward: (select-option)
            request.setAttribute("positionList", positionList);
            //divivsion -- select-option
            request.setAttribute("divisionList", divisionList);
            //education degree - select-option
            request.setAttribute("educationDegreeList", educationDegreeList);
            try {
                request.getRequestDispatcher("furama/employee/employee_edit.jsp").forward(request, response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        }

    //ham deleteCus():
    private void deleteEmployee(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        employeeService.delete(id); //viet ham xoa
        FuramaServlet.showEmployeeList(request, response);
    }
}
