<%--
  Created by IntelliJ IDEA.
  User: This PC
  Date: 8/6/2021
  Time: 2:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete</title>
</head>
<body>
<p><a href="/users">Back to home page</a></p>
<p>${message}</p>
<h2>Are you sure?</h2>
<form action="" method="post">
    <fieldset>
        <legend>Delete User</legend>
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
            <tr>
                <td></td>
                <td><input type="submit" value="Delete User"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
