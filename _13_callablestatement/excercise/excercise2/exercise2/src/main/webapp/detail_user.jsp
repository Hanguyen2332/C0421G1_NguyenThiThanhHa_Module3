<%--
  Created by IntelliJ IDEA.
  User: This PC
  Date: 8/6/2021
  Time: 3:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Detail user</title>
</head>
<body>
<p><a href="/users">Back to home page</a></p>
<fieldset>
    <legend>User's detail information</legend>
    <table>
        <tr>
            <td>ID</td>
            <td>${userObj.getId()}</td>
        </tr>
        <tr>
            <td>User Name</td>
            <td>${userObj.getName()}</td>
        </tr>
        <tr>
            <td>Email</td>
            <td>${userObj.getEmail()}</td>
        </tr>
        <tr>
            <td>Country</td>
            <td>${userObj.getCountry()}</td>
        </tr>
    </table>
</fieldset>
</body>
</html>
