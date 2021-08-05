package controller;

import model.bean.Product;
import model.reponritory.iplm.ProductRepository;
import model.service.IProductService;
import model.service.iplm.ProductService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", urlPatterns = {"", "/products"})
public class ProductServlet extends HttpServlet {
    private IProductService productService = new ProductService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                //goi ham createNew:
                create(request, response);
                break;
            case "update":
                //goi ham update():
                update(request, response);
                break;
            case "delete":
                //goi ham delete():
                delete(request, response);
                break;
            case "search":
                //goi ham searchById();
                search(request, response);
                break;
            default:
                break;
        }
    }

    //ham createNew():
    public void create(HttpServletRequest request, HttpServletResponse response) {
        int id = ProductRepository.autoIncrementId();
        String name = request.getParameter("name");
        String maker = request.getParameter("maker");
        double price = Double.parseDouble(request.getParameter("price"));
        //add vao Map:
        productService.createNew(new Product(id, name, maker, price));
        //set Attribute --> forward --> JSP:
        request.setAttribute("message", "Creating new Product successful!");
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/create.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    //ham update():
    public void update(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String maker = request.getParameter("maker");
        double price = Double.parseDouble(request.getParameter("price"));
        Product product = productService.searchById(id);
        RequestDispatcher dispatcher;
        if (product == null) {
            dispatcher = request.getRequestDispatcher("product/error-404.jsp");
        } else {
            product.setName(name);
            product.setMaker(maker);
            product.setPrice(price);
            productService.updateProduct(id, product);
            request.setAttribute("product", product);
            request.setAttribute("message", "Update successfully!");
            dispatcher = request.getRequestDispatcher("product/update.jsp");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    //ham delete():
    public void delete(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.searchById(id);
        RequestDispatcher dispatcher;
        if (product == null) {
            dispatcher = request.getRequestDispatcher("product/error-404.jsp");
        } else {
            productService.delete(id);
//            request.setAttribute("product",product);
            request.setAttribute("message", "Delete successfully!");
            dispatcher = request.getRequestDispatcher("product/delete.jsp");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    //ham search():
    public void search(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        Product product = productService.searchByName(name);
        RequestDispatcher dispatcher;
        if (product == null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("product", product);
            dispatcher = request.getRequestDispatcher("product/detail.jsp");
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
            case "create":
                //goi ham showCreateForm:
                showCreateForm(request, response);
                break;
            case "update":
                //goi ham showUpdateForm:
                showUpdateForm(request, response);
                break;
            case "detail":
                //goi ham showDetail() = view-Thuc hanh:
                detailProduct(request, response);
                break;
            case "search":
                //goi ham showSearchById();
                showSearchByNameForm(request, response);
                break;
            case "delete":
                //goi ham showSearchById();
                showDeleteForm(request, response);
                break;
            default:
                //goi ham displayAll():
                displayAll(request, response);
                break;
        }
    }

    //hiển thị all product:
    public void displayAll(HttpServletRequest request, HttpServletResponse response) {
        List<Product> productList = productService.display();
        request.setAttribute("productList", productList);

        RequestDispatcher dispatcher = request.getRequestDispatcher("product/display-all.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    //hiển thị form createNew:
    public void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        //Controller: Chuyển hướng request nhận được từ client --> trang create.jsp --> hiển thị form:
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/create.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    //hiển thị form Update:
    public void showUpdateForm(HttpServletRequest request, HttpServletResponse response) {
        //kiểm tra xem id nhập vào có tồn tại k:
        int id = Integer.parseInt(request.getParameter("id")); // id lấy ở link (thẻ a)
        Product product = productService.searchById(id);
        RequestDispatcher dispatcher;
        if (product == null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("product", product);
            dispatcher = request.getRequestDispatcher("product/update.jsp");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    //hiển thị chi tiết sản phẩm:
    public void detailProduct(HttpServletRequest request, HttpServletResponse response) {
        //kiểm tra xem id nhập vào có tồn tại k:
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.searchById(id);
        RequestDispatcher dispatcher;
        if (product == null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("product", product);
            dispatcher = request.getRequestDispatcher("product/detail.jsp");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    //hiển thị form timf kiếm:
    public void showSearchByNameForm(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/search.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    //hiển thị form timf kiếm:
    public void showDeleteForm(HttpServletRequest request, HttpServletResponse response) {
        //kiểm tra xem id nhập vào có tồn tại k:
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.searchById(id);
        RequestDispatcher dispatcher;
        if (product == null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("product", product);
            dispatcher = request.getRequestDispatcher("product/delete.jsp");
        }
        //try-catch:
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
