<%--
  Created by IntelliJ IDEA.
  User: This PC
  Date: 8/11/2021
  Time: 3:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Customer</title>
</head>
<body>
<form action="" method="post">
    <%--    validate: tại service: if...matches("regex")  --> true --> lưu DB/ false --> message (return của validate method)--%>

    <input type="text" name="cusCode" placeholder="Code: KH-XXXX"> <%--    //validate: KH-XXXX (X là số từ 0-9) --%>

    <select name="cusTypeId" class="form-control">
        <c:forEach var="cusTypeObj" items="${requestScope['customerTypeList']}">
            <option value="${cusTypeObj.getTypeId()}">${cusTypeObj.getTypeName()}</option>
        </c:forEach>
    </select>
    <%--    //select-option// --%>

    <input type="text" name="cusName"> <%--//validate: NOT space,NOT null, NOT number--%>
    <input type="date"
           name="cusDayOfBirth"> <%--//validate: kiểu Date + 18<=age<=100 + sử dụng "datepicker" +  format DD/MM/YYYY --%>

    <select name="cusGender" class="form-control">
        <option value="true">Female</option>
        <option value="false">Male</option>
    </select>
    <%--  //select-option// --%>

    <input type="text" name="idCard"> <%--//validate: Number: 9 or 11 số (XXXXXXXXX or XXXXXXXXXXXX : (X là số 0-9) --%>
    <input type="text" name="cusPhone"> <%--//validate: 090xxxxxxx hoặc 091xxxxxxx hoặc (84)+90xxxxxxx hoặc (84)+91xxxxxxx --%>
    <input type="text" name="cusEmail"> <%--//validate: tự làm --%>
    <input type="text" name="cusAddress">
</form>
</body>
</html>
