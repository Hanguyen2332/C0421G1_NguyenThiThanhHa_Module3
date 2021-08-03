import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

@WebServlet(name = "ServerTimeServlet", urlPatterns = "/system_time")
public class ServerTimeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter writer = response.getWriter();
        Date today = new Date();
        writer.println("<html>");
        writer.println("<h1>"+ today +"</h1>");
        writer.println("</html>");
    }
}

// 3TH:
/*
1. urlPatterns = "/index" + file .jsp CÓ code --> kq hiển thị = nội dung file .jsp
2. urlPatterns = "/index" + file .jsp KHÔNG code --> kq hiển thị = ""
NHƯNG: nếu THÊM  "/index"  vào url --> kq hiển thị code file servlet
3
*/