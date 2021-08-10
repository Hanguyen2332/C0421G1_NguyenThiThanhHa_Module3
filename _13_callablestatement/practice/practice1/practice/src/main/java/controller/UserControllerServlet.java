package controller;

import model.bean.User;
import model.service.IUserService;
import model.service.iplm.UserService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "UserControllerServlet", urlPatterns = {"", "/users"})


public class UserControllerServlet extends HttpServlet {
    private IUserService userService = new UserService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "insert":
                //goi ham inserUser():
                insertUser(request, response);
                break;
            case "delete":
                //goi ham deleteUser():
                deleteUser(request, response);
                break;
            case "update":
                //goi ham updateUser():
                updateUser(request, response);
                break;
            case "search_by_country":
                //goi ham searchByCountry():
                searchByCountry(request, response);
                break;
            case "search_by_id_sp":
                //goi ham getUserByIdSp():
                getUserByIdSp(request, response);
                break;
            case "insert_by_sp":
                //goi ham insert_by_sp():
                insertUserBySp(request, response);
                break;
            default:
                break;
        }
    }
    //------------------13_Practice1 ----------------------//
    public void getUserByIdSp(HttpServletRequest request, HttpServletResponse response) {
        //lay id (request):
        int id = Integer.parseInt(request.getParameter("id"));
        User user = userService.getUserById(id);
        if (user == null) {
            request.setAttribute("id_servlet",id);
            request.setAttribute("message","NOT FOUND THIS USER!");
        }else {
            request.setAttribute("id_servlet",id);
            request.setAttribute("userObj",user);
        }
        try {
            request.getRequestDispatcher("get_user_by_id.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void insertUserBySp(HttpServletRequest request, HttpServletResponse response) {
        //lấy data từ form (request):
        String userName = request.getParameter("userName");
        String email = request.getParameter("email");
        String country = request.getParameter("country");

        //tạo đổi tượng mới:
        User user = new User();
        user.setName(userName);
        user.setEmail(email);
        user.setCountry(country);

        //set message (success/fail) --> jsp --> response cho client:
        RequestDispatcher dispatcher = null;
            if (this.userService.insertUserBySP(user)) {
                request.setAttribute("message", "Create successfully!");
                request.setAttribute("usersList", this.userService.selectAllUsers());
                dispatcher = request.getRequestDispatcher("select_all_users.jsp");
            } else {
                request.setAttribute("message", "Create fail!");
                dispatcher = request.getRequestDispatcher("insert_user.jsp");
            }

        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    //Ham searchByCountry():
    public void searchByCountry(HttpServletRequest request, HttpServletResponse response) {
        String country = request.getParameter("country");

        //check if/else --> response message --> client:
        if (userService.searchByCountry(country).size() == 0) {
            request.setAttribute("country",country);
            request.setAttribute("message", "NOT FOUND THIS USER");
        } else {
            request.setAttribute("country",country);
            request.setAttribute("usersList", userService.searchByCountry(country));
        }

        try {
            request.getRequestDispatcher("search_by_country.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    //ham updateUser():
    public void updateUser(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        User user = userService.selectUser(id);

        String name = request.getParameter("userName");
        String email = request.getParameter("email");
        String country = request.getParameter("country");

        user.setName(name);
        user.setEmail(email);
        user.setCountry(country);

        RequestDispatcher dispatcher = null;
        try {
            if (userService.updateUser(user)) {
                request.setAttribute("message", "Update successfully");
                request.setAttribute("usersList", userService.selectAllUsers());
                dispatcher = request.getRequestDispatcher("select_all_users.jsp");
            } else {
                request.setAttribute("message", "Update fail");
                dispatcher = request.getRequestDispatcher("update.jsp");
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    //ham deleteUser():
    public void deleteUser(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        //set message (success/fail) --> jsp --> response cho client:
        RequestDispatcher dispatcher = null;
        try {
            if (this.userService.delete(id)) {
                request.setAttribute("message", "Delete successfully!");
                request.setAttribute("usersList", this.userService.selectAllUsers());
                dispatcher = request.getRequestDispatcher("select_all_users.jsp");
            } else {
                request.setAttribute("message", "Delete fail!");
                dispatcher = request.getRequestDispatcher("delete.jsp");
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    //ham insertUser():
    public void insertUser(HttpServletRequest request, HttpServletResponse response) {
        //lấy data từ form (request):
        String userName = request.getParameter("userName");
        String email = request.getParameter("email");
        String country = request.getParameter("country");

        //tạo đổi tượng mới:
        User user = new User();
        user.setName(userName);
        user.setEmail(email);
        user.setCountry(country);

        //set message (success/fail) --> jsp --> response cho client:
        RequestDispatcher dispatcher = null;
        try {
            if ("successful".equals(this.userService.insertUser(user))) {
                request.setAttribute("message", "Create successfully!");
                request.setAttribute("usersList", this.userService.selectAllUsers());
                dispatcher = request.getRequestDispatcher("select_all_users.jsp");
            } else {
                request.setAttribute("message", "Create fail!");
                dispatcher = request.getRequestDispatcher("insert_user.jsp");
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "insert":
                //goi ham showInsertUserForm():
                showInsertUserForm(request, response);
                break;
            case "update":
                //goi ham showUpdateUserForm():
                showUpdateUserForm(request, response);
                break;
            case "delete":
                //goi ham hien thi showDeleteUserForm():
                showDeleteUserForm(request, response);
                break;
            case "detail":
                //goi ham hien thi thông tin chi tiết user:
                selectUser(request, response);
                break;
            case "search_by_country":
                //goi ham searchByCountry():
                searchByCountryForm(request, response);
                break;
            case "order_by_name":
                //goi ham orderByName():
                orderByName(request, response);
                break;
            case "search_by_id_sp":
                //goi ham getUserByIdSp():
                getUserByIdSpForm(request, response);
                break;
            case "insert_by_sp":
                //goi ham insertUserBySp():
                insertUserBySpForm(request, response);
                break;
            default:
                //goi ham hien thi all user selectAllUsers():
                selectAllUsers(request, response);
        }
    }

    //------------------13_Practice1 ----------------------//
    public void getUserByIdSpForm(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("get_user_by_id.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    public void insertUserBySpForm(HttpServletRequest request, HttpServletResponse response) {
    showInsertUserForm(request, response);
    }


    //-------------------Exercise------------------------//

    //ham orderByName():
    public void orderByName(HttpServletRequest request, HttpServletResponse response) {
        List<User> usersList = userService.orderByName();
        request.setAttribute("usersList", usersList);
        try {
            request.getRequestDispatcher("select_all_users.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    //------------------------------Practice---------------------------------//

    //ham searchByCountry():
    public void searchByCountryForm(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("search_by_country.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // ham showUpdateUserForm():
    public void showUpdateUserForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        User user = userService.selectUser(id);
        try {
            request.setAttribute("userObj", user);
            request.getRequestDispatcher("update.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void selectAllUsers(HttpServletRequest request, HttpServletResponse response) {
        List<User> usersList = userService.selectAllUsers();

        request.setAttribute("usersList", usersList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("select_all_users.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    //hiển thị chi tiết User (theo id)
    public void selectUser(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        User user = userService.selectUser(id);
        request.setAttribute("userObj", user);
        RequestDispatcher dispatcher = request.getRequestDispatcher("detail_user.jsp"); // tái sử dụng detail.jsp
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    //insert form;
    public void showInsertUserForm(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("insert_user.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    //delete form:
    public void showDeleteUserForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        User user = userService.selectUser(id);
        RequestDispatcher dispatcher = null;
        if (user == null) {
            request.setAttribute("message", "NOT FOUND THIS USER!");
            dispatcher = request.getRequestDispatcher("select_all_users.jsp");
        } else {
            request.setAttribute("userObj", user);
            dispatcher = request.getRequestDispatcher("delete.jsp"); // change: link "delete.jsp" --> "/users"
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
