<%--
  Created by IntelliJ IDEA.
  User: This PC
  Date: 8/11/2021
  Time: 10:09 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../assert/css/bootstrap.min.css">
</head>
<body>

    <jsp:include page="../layout/header.jsp"></jsp:include>
    <jsp:include page="../layout/navbar.jsp"></jsp:include>

    <div class="container-fluid px-0">
        <div class="row p-0">
            <jsp:include page="../layout/left_sidebar.jsp"></jsp:include>
            <div class="col-sm-9 col-lg-9" style="background-color: plum;">
                Body
            </div>
        </div>
        <jsp:include page="../layout/footer.jsp"></jsp:include>
    </div>

<script src="../assert/jquery/jquery-3.5.1.min.js"></script>
<script src="../assert/jquery/popper.min.js"></script>
<script src="../assert/js/bootstrap.min.js"></script>
</body>
</html>
