package controller;

import model.bean.CustomerType;
import model.service.IFuramaService;
import model.service.iplm.CustomerTypeService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CustomerServlet",urlPatterns = {"/customer"})
public class CustomerServlet extends HttpServlet {
    private IFuramaService<CustomerType> furamaService = new CustomerTypeService();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create_customer":
                //show form create:
                showCreateCustomerForm(request,response);

        }
    }
    //ham create Customer:
    private void showCreateCustomerForm(HttpServletRequest request, HttpServletResponse response) {
        List<CustomerType> customerTypeList = furamaService.showList();
        request.setAttribute("customerTypeList",customerTypeList);
        try {
            request.getRequestDispatcher("furama/customer/customer_create.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
