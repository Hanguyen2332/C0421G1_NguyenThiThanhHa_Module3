<%--
  Created by IntelliJ IDEA.
  User: This PC
  Date: 8/5/2021
  Time: 11:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        a {
            text-decoration: none;
            color: black;
        }
        a:hover {
            color: red;
        }
        img {
            height: 15px;
            width: 15px;
            background-color: khaki;
        }
        img:hover {
            background-color: red;
        }
    </style>
</head>
<body>
<h1>User List</h1>

<button><a href="/users?action=insert">Create new User</a></button>

<button><a href="/users?action=search_by_country">Search By Country</a></button>

<p style="color: red">${message}</p>

<table border="1">
    <tr>
        <th>ID</th>
        <th style="text-align: center">
            <a href="/users?action=order_by_name">Name</a>
            <a href="/users?action=order_by_name"><img src="sort_by_name.png" alt=""></a>
        </th>
        <th>Email</th>
        <th>Country</th>
        <th>Update</th>
        <th>Delete</th>
    </tr>
    <c:forEach var="userObj" items='${requestScope["usersList"]}'>  <!-- nếu không có: "requestScope" -> lỗi -->
        <tr>
            <td>${userObj.getId()}</td>
            <td>
                <a href="/users?action=detail&id=${userObj.getId()}">${userObj.getName()}</a>
            </td>
            <td>${userObj.getEmail()}</td>
            <td>${userObj.getCountry()}</td>
            <td><a href="/users?action=update&id=${userObj.getId()}">Update</a></td>
            <td><a href="/users?action=delete&id=${userObj.getId()}">Delete</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
