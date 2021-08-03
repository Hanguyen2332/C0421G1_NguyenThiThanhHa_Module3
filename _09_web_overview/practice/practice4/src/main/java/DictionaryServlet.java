import java.io.IOException;

@javax.servlet.annotation.WebServlet(name = "DictionaryServlet", urlPatterns = "/dictionary")
public class DictionaryServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        String[][] arr = {
                {"flower", "monkey", "banana", "apple", "rose", "lavender", "dog", "tiger", "lion", "elephant", "bird", "fish"},
                {"hoa", "khỉ", "chuối", "táo", "hoa hồng", "hoa oải hương", "chó", "hổ", "sư tử", "voi", "chim", "cá"}
        };
        String input = request.getParameter("input");
        int index = 0;
        String result = "";
        boolean check = false;
        for (int i = 0; i < arr[0].length; i++) {
            if (input.equals(arr[0][i])) {
                check = true;
                index = i;
                break;
            }
        }
        if (check) {
            result = arr[1][index];
        } else {
            result = "NOT found this word!";
        }

//chuyển tiếp result --> jsp --> hiển thị ra web:
        request.setAttribute("result", result);
        request.getRequestDispatcher("result.jsp").forward(request, response);
    }
}
