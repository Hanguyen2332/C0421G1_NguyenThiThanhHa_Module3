<%--
  Created by IntelliJ IDEA.
  User: This PC
  Date: 8/12/2021
  Time: 2:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Customer </title>
</head>
<body>
<jsp:include page="../../layout/navbar.jsp"></jsp:include>
<div class="w-75 m-auto">
    <div class="row mb-2">
        <h3 class="col-sm-12 col-md-12 col-lg-12 text-sm-center text-md-center text-lg-center mt-3" style="color: blue">Edit Customer ID: ${customer.customerId}</h3>
        <p class="col-sm-12 col-md-12 col-lg-12" style="color: red">${message}</p>
    </div>

    <form method="post">

                <div class="row mb-1">
                    <label class="col-sm-4 col-md-4 col-lg-4 px-0 col-form-label mb-1">Customer code</label>
                    <div class="col-sm-8 col-md-8 col-lg-8 mb-1">
                        <input type="text" class="form-control" name="cusCode" id="inputEmail3" value="${customer.customerCode}">
                    </div>
                    <%--        </div>--%>

                    <%--        <div class="row mb-1">--%>
                    <label class="col-sm-4 col-md-4 col-lg-4 px-0 col-form-label mb-1">Customer Name</label>
                    <div class="col-sm-8 col-md-8 col-lg-8 mb-1">
                        <input type="text" class="form-control" name="cusName" value="${customer.customerName}">
                    </div>
                    <%--        </div>--%>

                    <%--    customer type: option--%>
                    <%--        <div class="row mb-2">--%>
                    <div class="class=col-sm-4 col-md-4 col-lg-4 px-0 mb-1">Customer Type</div>
                    <div class="col-sm-8 col-md-8 col-lg-8 mb-1">
                        <select class="form-select form-select-lg w-100" aria-label=".form-select-lg example" name="cusType" style="height: 40px">
                            <%--                <option selected>Open this select menu</option>--%>
                            <c:forEach var="cusTypeObj" items="${requestScope['customerTypeList']}">
                                <option value="${cusTypeObj.getTypeId()}">${cusTypeObj.getTypeName()}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <%--        </div>--%>

                    <%--        <div class="row mb-2">--%>
                    <label for="inputPassword3" class="col-sm-4 col-md-4 col-lg-4 mb-1 px-0 col-form-label">Day of birth</label>
                    <div class="col-sm-8 col-md-8 col-lg-8 mb-1">
                        <input type="date" class="form-control" id="inputPassword3" name="dayOfBirth" value="${customer.dayOfBirth}">
                    </div>
                    <%--        </div>--%>

                    <%-- ------ gender: radio-------------%>
                    <%--        <div class="row mb-2">--%>
                    <div class="class=col-sm-4 col-md-4 col-lg-4 px-0 my-2">Gender</div>
                    <div class="col-sm-8 col-md-8 col-lg-8 mb-1">
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="gender" id="inlineRadio1" value="true" checked>
                            <label class="form-check-label" for="inlineRadio1">Female</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="gender" id="inlineRadio2" value="false">
                            <label class="form-check-label" for="inlineRadio2">Male</label>
                        </div>
                    </div>
                    <%--        </div>--%>

                    <%--    --%>
                    <%--        <div class="row mb-2">--%>
                    <label class="col-sm-4 col-md-4 col-lg-4 px-0 mb-1 col-form-label">ID Card</label>
                    <div class="col-sm-8 col-md-8 col-lg-8 mb-1">
                        <input type="text" class="form-control" name="idCard" value="${customer.idCard}">
                    </div>
                    <%--        </div>--%>

                    <%--        <div class="row mb-2">--%>
                    <label class="col-sm-4 col-md-4 col-lg-4 px-0 mb-1 col-form-label">Phone Number</label>
                    <div class="col-sm-8 col-md-8 col-lg-8 mb-1">
                        <input type="text" class="form-control" name="phoneNumber" value="${customer.phone}">
                    </div>
                    <%--        </div>--%>

                    <%--        <div class="row mb-2">--%>
                    <label class="col-sm-4 col-md-4 col-lg-4 px-0 mb-1 col-form-label">Email</label>
                    <div class="col-sm-8 col-md-8 col-lg-8 mb-1">
                        <input type="email" class="form-control" name="email" value="${customer.email}">
                    </div>
                    <%--        </div>--%>

                    <%--        <div class="row mb-2">--%>
                    <label class="col-sm-4 col-md-4 col-lg-4 px-0 mb-1 col-form-label">Address</label>
                    <div class="col-sm-8 col-md-8 col-lg-8 mb-1">
                        <input type="text" class="form-control" name="address" value="${customer.address}">
                    </div>
                    <%--        </div>--%>
                    <button type="submit" class="btn btn-primary m-auto mt-1">Update</button>
                </div>
    </form>
</div>
<script src="../../assert/jquery/jquery-3.5.1.min.js"></script>
<script src="../../assert/jquery/popper.min.js"></script>
<script src="../../assert/js/bootstrap.min.js"></script>
</body>
</html>
