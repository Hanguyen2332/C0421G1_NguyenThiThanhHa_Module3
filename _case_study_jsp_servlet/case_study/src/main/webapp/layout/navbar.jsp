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
    <link rel="stylesheet" href="../assert/css/bootstrap.min.css">
    </head>
<body>

    <ul class="nav justify-content-center" style="color: white;background-color: lightsteelblue;">
    <li class="nav-item">
    <a class="nav-link active" aria-current="page" href="#">Home</a>
    </li>
    <li class="nav-item">
    <a class="nav-link" href="">Employee</a>
    </li>
    <li class="nav-item">
    <a class="nav-link" href="/furama?action=customer_list">Customer</a>
    </li>
    <li class="nav-item">
    <a class="nav-link" href="#">Service</a>
    </li>
    <li class="nav-item">
    <a class="nav-link" href="#">Contract</a>
    </li>
    <!--    search-->
    <li class="nav-item">
    <form class="d-flex">
    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
    <button class="btn btn-outline-success" type="submit">
    Search
    </button>
    </form>
    </li>
    </ul>

    <script src="../assert/jquery/jquery-3.5.1.min.js"></script>
    <script src="../assert/jquery/popper.min.js"></script>
    <script src="../assert/js/bootstrap.min.js"></script>
</body>
</html>
