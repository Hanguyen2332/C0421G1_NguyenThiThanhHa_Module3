import java.io.IOException;
import java.io.PrintWriter;

@javax.servlet.annotation.WebServlet(name = "LoginServlet", urlPatterns = "/login")
public class GetLoginServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        PrintWriter writer = response.getWriter();
        if (username.equals("admin") && password.equals("admin")) {
            writer.println("<html>");
            writer.println("<body>");
            writer.println("<p style='text-align:center; color:blue;font-size: 40px'>");
            writer.println("Welcome admin to website!");
            writer.println("</p>");
            writer.println("</body>");
            writer.println("</html>");
        } else {
            writer.println("<html>");
            writer.println("<body>");
            writer.println("<p style='text-align:center; color:red; font-size: 40px'>");
            writer.println("Login Error!");
            writer.println("</p>");
            writer.println("</body>");
            writer.println("</html>");
        }
    }
}

