package controller;


import model.bean.Customer;
import model.service.ICustomerService;
import model.service.IFuramaService;
import model.service.iplm.CustomerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


@WebServlet(name = "FuramaServlet", urlPatterns = {"", "/furama"})
public class FuramaServlet extends HttpServlet {
    private IFuramaService<Customer> furamaService = new CustomerService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "customer_list":
//                //goi ham showCustomerList() : forward --> jsp customer
                showCustomerList(request,response);
                break;

            default:
                //call function furama/host_page.jsp:
                hostPage(request, response);
        }
    }

    //hien thi showCustomerList():
    public void showCustomerList(HttpServletRequest request, HttpServletResponse response) {
        List<Customer> customerList = furamaService.showList();
        //gui sang jsp:
            request.setAttribute("customerList",customerList);
        try {
            request.getRequestDispatcher("furama/customer/customer_list.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    //hien thi hostPage-default:
    public void hostPage(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("furama/host_page.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
