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
    <title>Home</title>
    <style>

    </style>
    <link rel="stylesheet" href="../assert/css/bootstrap.min.css">
</head>
<body>
    <jsp:include page="../layout/header.jsp"></jsp:include>
    <jsp:include page="../layout/navbar.jsp"></jsp:include>

    <div class="container-fluid px-0">
        <div class="row p-0">
            <div class="col-sm-3 col-md-3 col-lg-3">
                <jsp:include page="../layout/left_sidebar.jsp"></jsp:include>
            </div>
            <div class="col-sm-9 col-md-9 col-lg-9 pe-2" id="background_body">
                <h3 class="mt-3 text-center" style="color:orange;">THIS WORLD CLASS RESORT, FURAMA DANANG, REPUTABLE FOR BEING A CULINARY RESORT IN VIETNAM</h3>
                <p style="text-align: justify">Overlooking the long stretch of wide white sand on Danang Beach, Furama Resort Danang is a gateway to three World Heritage Sites of Hoi An (20 minutes), My Son (90 minutes) and Hue (2 hours). The 198 rooms and suites plus 70 two to four bedroom pool villas feature tasteful décor, designed with traditional Vietnamese style and a touch of French colonial architecture and guarantee the Vietnam’s the most prestigious resort -counting royalty, presidents, movie stars and international business leaders among its celebrity guests.</p>
                <img src="/assert/img/furama_bg.jpg" class="container-fluid" style="width: 100%; height: 400px" alt="...">
            </div>
        </div>
        <jsp:include page="../layout/footer.jsp"></jsp:include>
    </div>

<script src="../assert/jquery/jquery-3.5.1.min.js"></script>
<script src="../assert/jquery/popper.min.js"></script>
<script src="../assert/js/bootstrap.min.js"></script>
</body>
</html>
