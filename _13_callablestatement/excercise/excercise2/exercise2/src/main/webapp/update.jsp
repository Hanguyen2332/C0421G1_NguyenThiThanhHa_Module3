<%--
  Created by IntelliJ IDEA.
  User: This PC
  Date: 8/6/2021
  Time: 11:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update</title>
</head>
<body>
<p style="color: red">${message}</p>
<form action="" method="post">

        <h3>Update User</h3>
        <h5>ID</h5>
        <input type="text" name="id" value="${userObj.getId()}" readonly>
        <h5>user Name</h5>
        <input type="text" name="userName" value="${userObj.getName()}">
        <h5>email</h5>
        <input type="text" name="email" value="${userObj.getEmail()}">
        <h5>country</h5>
        <input type="text" name="country" value="${userObj.getCountry()}">
        <input type="submit" value="Update User"></p>

</form>
</body>
</html>
