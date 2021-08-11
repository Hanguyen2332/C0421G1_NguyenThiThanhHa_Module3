<%--
  Created by IntelliJ IDEA.
  User: This PC
  Date: 8/11/2021
  Time: 12:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../../assert/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="../../layout/header.jsp"></jsp:include>
<jsp:include page="../../layout/navbar.jsp"></jsp:include>

<div class="container-fluid">
    <div class="row p-0">
        <jsp:include page="../../layout/left_sidebar.jsp"></jsp:include>
        <div class="col-sm-9 col-lg-9">
            <h2>Customer</h2>
            <c:if test="${empty customerList}">
                <p STYLE="color: red">Customer List is EMPTY!</p>
            </c:if>

<%--            create Customer--%>
            <a class="btn btn-primary" href="/customer?action=create_customer" role="button">Create Customer</a>

            <c:if test="${not empty customerList}">
                <table>
                    <tr>
                        <th>ID</th>
                        <th>Customer type</th>
                        <th>Name</th>
                        <th>Day of Birth</th>
                        <th>Gender</th>
                        <th>ID Card</th>
                        <th>Phone number</th>
                        <th>Email</th>
                        <th>Address</th>
                    </tr>
                    <c:forEach var="cusObj" items="${requestScope['customerList']}">
                        <tr>
                            <td>${cusObj.customerId}</td>
                            <td>${cusObj.getCustomerCode()}</td>
                            <td>${cusObj.getCustomerName()}</td>
                            <td>${cusObj.getCustomerTypeName()()}</td>
                            <td>${cusObj.getDayOfBirth()}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${cusObj.getGender()=true}">Female</c:when>
                                    <c:when test="${cusObj.getGender()=false}">Male</c:when>
                                    <c:otherwise>LGBT</c:otherwise>
                                </c:choose>
                            </td>
                            <td>${cusObj.getIdCard()}</td>
                            <td>${cusObj.getPhone()}</td>
                            <td>${cusObj.getEmail()}</td>
                            <td>${cusObj.getAddress()}</td>
                        </tr>
                    </c:forEach>
                </table>
            </c:if>
        </div>
    </div>
    <jsp:include page="../../layout/footer.jsp"></jsp:include>
</div>



<%--<c:if test="${empty customerList}">--%>
<%--    <p STYLE="color: red">Customer List is EMPTY!</p>--%>
<%--</c:if>--%>
<%--<c:if test="${not empty customerList}">--%>
<%--    <table>--%>
<%--        <tr>--%>
<%--            <th>ID</th>--%>
<%--            <th>Customer type</th>--%>
<%--            <th>Name</th>--%>
<%--            <th>Day of Birth</th>--%>
<%--            <th>Gender</th>--%>
<%--            <th>ID Card</th>--%>
<%--            <th>Phone number</th>--%>
<%--            <th>Email</th>--%>
<%--            <th>Address</th>--%>
<%--        </tr>--%>
<%--        <c:forEach var="cusObj" items="${requestScope['customerList']}">--%>
<%--            <tr>--%>
<%--                <td>${cusObj.customerId}</td>--%>
<%--                <td>--%>
<%--                    <c:choose>--%>
<%--                        <c:when test="${cusObj.getCustomerTypeId()=1}">Diamond</c:when>--%>
<%--                        <c:when test="${cusObj.getCustomerTypeId()=2}">Platinum</c:when>--%>
<%--                        <c:when test="${cusObj.getCustomerTypeId()=3}">Gold</c:when>--%>
<%--                        <c:when test="${cusObj.getCustomerTypeId()=4}">Silver</c:when>--%>
<%--                        <c:when test="${cusObj.getCustomerTypeId()=5}">Member</c:when>--%>
<%--                    </c:choose>--%>
<%--                </td>--%>


<%--                <td>${cusObj.getCustomerName()}</td>--%>
<%--                <td>${cusObj.getDayOfBirth()}</td>--%>
<%--                <td>--%>
<%--                    <c:choose>--%>
<%--                        <c:when test="${cusObj.getGender()=0}">Female</c:when>--%>
<%--                        <c:when test="${cusObj.getGender()=1}">Male</c:when>--%>
<%--                        <c:otherwise>LGBT</c:otherwise>--%>
<%--                    </c:choose>--%>
<%--                </td>--%>

<%--                <td>${cusObj.getIdCard()}</td>--%>
<%--                <td>${cusObj.getPhone()}</td>--%>
<%--                <td>${cusObj.getEmail()}</td>--%>
<%--                <td>${cusObj.getAddress()}</td>--%>
<%--            </tr>--%>
<%--        </c:forEach>--%>
<%--    </table>--%>
<%--</c:if>--%>

<script src="../../assert/jquery/jquery-3.5.1.min.js"></script>
<script src="../../assert/jquery/popper.min.js"></script>
<script src="../../assert/js/bootstrap.min.js"></script>
</body>
</html>
