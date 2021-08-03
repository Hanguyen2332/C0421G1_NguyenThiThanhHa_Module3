import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ConvertCurrencyServlet", urlPatterns = "/convert_currency")
public class ConvertCurrencyServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int rate = Integer.parseInt(request.getParameter("rate"));
        int usd = Integer.parseInt(request.getParameter("usd")); // note: chú ý: phân biệt HOA-THƯỜNG khi lấy tên infor
        int vnd = usd*rate;

        // gửi lại kết quả về jsp:
        request.setAttribute("VND",vnd);
        request.getRequestDispatcher("result.jsp").forward(request,response);
    }
}
