<%--
  Created by IntelliJ IDEA.
  User: This PC
  Date: 8/6/2021
  Time: 10:13 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>insert user</title>
</head>
<body>
<p style="color: red">${message}</p>
<form action="" method="post">
    <fieldset>
        <legend>Create User</legend>
        <p><input type="text" name="userName" placeholder="User Name"></p>
        <p><input type="text" name="email" placeholder="Email"></p>
        <p><input type="text" name="country" placeholder="Country"></p>
        <p><input type="submit" value="Insert User" style="background-color: gainsboro"></p>
    </fieldset>
</form>
</body>
</html>
