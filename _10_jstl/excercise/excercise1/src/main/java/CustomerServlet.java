import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", urlPatterns = "")
public class CustomerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customer> customers = new ArrayList<>();
        customers.add(new Customer("Nguyễn Khắc Chiba","1983-08-20","Hà Nội","chiba.jpg"));
        customers.add(new Customer("Đồng Văn Chuột","1997-08-16","Hà Tĩnh","micky.jpg"));
        customers.add(new Customer("Lê Văn Gorilla","1991-17-25","Quảng Bình","gorilla.jpg"));
        customers.add(new Customer("Nguyễn Thị Hà Bá","1995-11-11","Ninh Bình","ha_ba.jpg"));
        customers.add(new Customer("Hồ Văn Kỳ Bò","1993-12-01","Đà Nẵng","buffalo.jpg"));

        request.setAttribute("CustomerListServlet",customers);
        request.getRequestDispatcher("index.jsp").forward(request,response);
    }
}
