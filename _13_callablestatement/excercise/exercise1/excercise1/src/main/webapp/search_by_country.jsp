<%--
  Created by IntelliJ IDEA.
  User: This PC
  Date: 8/6/2021
  Time: 3:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<p><a href="/users">Back to home page</a></p>

<h2>Search User By Country</h2>

<p style="color: red">${message}</p>

<form action="" method="post">
    <p><input type="text" name="country" value="${country}" placeholder="Enter Country"></p>
    <p><input type="submit" value="Search User"></p>
</form>

<%--hien thi ket qua--%>

<c:if test="${usersList != null}">
    <table border="1">
        <tr>
            <th>ID</th>
            <th>User Name</th>
            <th>Email</th>
            <th>Country</th>
        </tr>
        <c:forEach var="userObj" items='${requestScope["usersList"]}'>  <!-- nếu không có: "requestScope" -> lỗi -->
            <tr>
                <td>${userObj.getId()}</td>
                <td>${userObj.getName()}</td> <!-- Lỗi: "getName()" -> lỗi -->
                <td>${userObj.getEmail()}</td>
                <td>${userObj.getCountry()}</td>
            </tr>
        </c:forEach>
    </table>
</c:if>
</body>
</html>
