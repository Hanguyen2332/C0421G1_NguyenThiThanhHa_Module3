    <%--
      Created by IntelliJ IDEA.
      User: This PC
      Date: 8/10/2021
      Time: 9:56 PM
      To change this template use File | Settings | File Templates.
    --%>
        <%@ page contentType="text/html;charset=UTF-8" language="java" %>
        <html>
        <head>
        <title>Title</title>
        <%--        <style>--%>
        <%--        a {--%>
        <%--        color: black;--%>
        <%--        }--%>
        <%--        </style>--%>
        <link rel="stylesheet" href="../assert/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
        integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
        </head>
        <body>

        <%--        TESST--%>
        <div class="container-fluid bg-light">
        <nav class="navbar navbar-expand-lg navbar-light">
        <a class="navbar-brand" href="/furama">Home</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
        <li class="nav-item active">
        <a class="nav-link" href="/furama?action=employee_list">Employee<span class="sr-only">(current)</span></a>
        </li>

        <li class="nav-item">
        <a class="nav-link" href="/furama?action=customer_list">Customer</a>
        </li>

        <li class="nav-item active">
        <a class="nav-link" href="/furama?action=service_list">Service<span class="sr-only">(current)</span></a>
        </li>

        <li class="nav-item active">
        <a class="nav-link" href="/furama?action=contract_list">Contract<span class="sr-only">(current)</span></a>
        </li>

        </ul>
        <form class="form-inline my-2 my-lg-0">
        <input class="form-control mr-sm-2" type="search" name="'customer','id'" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>
        </div>
        </nav>
        </div>


        <%--                    <ul class="nav justify-content-center bg-light py-sm-3 py-md-3 py-lg-3">--%>
        <%--                    <li class="nav-item">--%>
        <%--                    <a class="nav-link active" aria-current="page" href="/furama">Home</a>--%>
        <%--                    </li>--%>
        <%--                    <li class="nav-item">--%>
        <%--                    <a class="nav-link" href="/furama?action=employee_list">Employee</a>--%>
        <%--                    </li>--%>
        <%--                    <li class="nav-item">--%>
        <%--                    <a class="nav-link" href="/furama?action=customer_list">Customer</a>--%>
        <%--                    </li>--%>
        <%--                    <li class="nav-item">--%>
        <%--                    <a class="nav-link" href="/furama?action=service_list">Service</a>--%>
        <%--                    </li>--%>
        <%--                    <li class="nav-item">--%>
        <%--                    <a class="nav-link" href="#">Contract</a>--%>
        <%--                    </li>--%>
        <%--                    <!-- search-->--%>
        <%--                    <li class="nav-item">--%>
        <%--                    <form class="d-flex">--%>
        <%--                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">--%>
        <%--                    <button class="btn btn-outline-success" type="submit">--%>
        <%--                    Search--%>
        <%--                    </button>--%>
        <%--                    </form>--%>
        <%--                    </li>--%>
        <%--                    </ul>--%>

        <script src="../assert/jquery/jquery-3.5.1.min.js"></script>
        <script src="../assert/jquery/popper.min.js"></script>
        <script src="../assert/js/bootstrap.min.js"></script>
        </body>
        </html>
