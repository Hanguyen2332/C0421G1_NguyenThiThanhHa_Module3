<%--
  Created by IntelliJ IDEA.
  User: This PC
  Date: 8/11/2021
  Time: 3:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Customer</title>
    <style>
        .mesRed {
            color: red;
        }
    </style>
    <link rel="stylesheet" href="../../assert/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="../../layout/navbar.jsp"></jsp:include>

<%--/--------------test Navbar---------------------/--%>

<%--/--------------test Navbar---------------------/--%>
<div class="w-75 m-auto">
    <div class="row mb-2">
        <h3 class="col-sm-12 col-md-12 col-lg-12 text-center" style="color:blue">Create New Customer</h3>
        <p class="col-sm-12 col-md-12 col-lg-12 mesRed">${message}</p>
    </div>

    <form method="post">
        <div class="row mb-1">
            <label for="codeRegex" class="col-sm-4 col-md-4 col-lg-4 px-0 col-form-label mb-1">Customer code</label>
            <div class="col-sm-8 col-md-8 col-lg-8 mb-">
                <input type="text" class="form-control" name="cusCode" id="codeRegex"
                       placeholder="KH-XXXX" value="${cusObj.customerCode}"  required>
                <p id="codeMes" class="mesRed">
                    ${validateMesMap.get("checkCode")}
                </p>
                <%--                <p id="checkDuplicateCode" class="mesRed"></p>--%>
            </div>

            <label class="col-sm-4 col-md-4 col-lg-4 px-0 col-form-label mb-1">Customer Name</label>
            <div class="col-sm-8 col-md-8 col-lg-8 mb-1">
                <input type="text" class="form-control" id="nameRegex" value="${cusObj.customerName}" name="cusName" required>
                <p id="nameMes" class="mesRed">
                    ${validateMesMap.get("checkName")}
                </p>
            </div>

                <div class="class=col-sm-4 col-md-4 col-lg-4 px-0 mb-1">Customer Type</div>
                <div class="col-sm-8 col-md-8 col-lg-8 mb-1">
                    <select class="form-select form-select-lg w-100" aria-label=".form-select-lg example"
                            style="height: 40px;" name="cusType">
                        <c:forEach var="cusTypeObj" items="${requestScope['customerTypeList']}">
                            <option value="${cusTypeObj.getTypeId()}">${cusTypeObj.getTypeName()}</option>
                        </c:forEach>
                    </select>
                </div>

                <label for="dateOfBirth" class="col-sm-4 col-md-4 col-lg-4 px-0 col-form-label mb-1">Day of
                    birth</label>
                <div class="col-sm-8 col-md-8 col-lg-8 mb-1">
                    <input type="date" class="form-control" id="dateOfBirth" name="dayOfBirth" value="${cusObj.dayOfBirth}">
                    <p id="dateOfBirthMes" class="mesRed"> ${validateMesMap.get("checkAge")}</p>
                </div>

                <div class="class=col-sm-4 col-md-4 col-lg-4 px-0 mb-y3">Gender</div>
                <div class="col-sm-8 col-md-8 col-lg-8 mb-y3">
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="gender" id="inlineRadio1" value="true"
                               checked>
                        <label class="form-check-label" for="inlineRadio1">Female</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="gender" id="inlineRadio2" value="false">
                        <label class="form-check-label" for="inlineRadio2">Male</label>
                    </div>
                </div>

                <label class="col-sm-4 col-md-4 col-lg-4 px-0 mb-1 col-form-label">ID Card</label>
                <div class="col-sm-8 col-md-8 col-lg-8 mb-1">
                    <input type="text" oninput="checkIdCard()" class="form-control" name="idCard" id="idCardRegex"
                           value="${cusObj.idCard}" required>
                    <p id="idCardMes" class="mesRed"></p>
                    <p id="checkDupliIdCard" class="mesRed">
                        ${validateMesMap.get("checkIdCard")}
                    </p>
                </div>

                <label class="col-sm-4 col-md-4 col-lg-4 px-0 mb-1 col-form-label">Phone Number</label>
                <div class="col-sm-8 col-md-8 col-lg-8 mb-1">
                    <input type="text" oninput="checkPhone()" class="form-control" id="phoneRegex" name="phoneNumber" value="${cusObj.phone}">
                    <p id="phoneMes" class="mesRed">
                        ${validateMesMap.get("checkPhone")}
                    </p>
                </div>

                <label class="col-sm-4 col-md-4 col-lg-4 px-0 mb-1 col-form-label">Email</label>
                <div class="col-sm-8 col-md-8 col-lg-8 mb-1">
                    <input type="email" oninput="checkEmail()" class="form-control" name="email" id="emailRegex" value="${cusObj.email}">
                    <p id="emailMes" class="mesRed">
                        ${validateMesMap.get("checkEmail")}
                    </p>
                </div>

                <label class="col-sm-4 col-md-4 col-lg-4 px-0 mb-1 col-form-label">Address</label>
                <div class="col-sm-8 col-md-8 col-lg-8 mb-1">
                    <input type="text" class="form-control" name="address" value="${cusObj.address}">
                </div>
                <button type="submit" class="btn btn-primary m-auto">Create</button>
            </div>
    </form>
</div>
<script src="../../assert/jquery/jquery-3.5.1.min.js"></script>
<script src="../../assert/jquery/popper.min.js"></script>
<script src="../../assert/js/bootstrap.min.js"></script>

<%--<script>--%>
<%--function checkCode() {--%>
<%--    let code = document.getElementById("codeRegex").value;--%>
<%--    let regex = /^KH-[0-9]{4}$/--%>
<%--    if (regex.test(code)||code===""){--%>
<%--        document.getElementById("codeMes").innerHTML = "";--%>
<%--    }else {--%>
<%--        document.getElementById("codeMes").innerHTML = "Vui long nhap ma khach hang theo dinh dang: 'KH-XXXX' (X: 0-9)";--%>
<%--    }--%>
<%--}--%>
<%--</script>--%>
<%--<script src="../../assert/common/cus_employee_validate.js"></script>--%>
</body>
</html>
