<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: This PC
  Date: 8/9/2021
  Time: 10:26 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Search By User ID</title>
</head>
<body>
<h2>Search By User ID</h2>
<p style="color: red">${message}</p>

<form action="" method="post">
    <input type="text" name="id" value="${id_servlet}" placeholder="Enter ID">
    <input type="submit" value="Search">
</form>

<%--hien thi kq--%>
<c:if test="${userObj!=null}">
    <table border="1">
        <tr>
            <td>User Name</td>
            <td>${userObj.getName()}</td>
        </tr>
        <tr>
            <td>User Email</td>
            <td>${userObj.getEmail()}</td>
        </tr>
        <tr>
            <td>User Country</td>
            <td>${userObj.getCountry()}</td>
        </tr>
    </table>
</c:if>

</body>
</html>
