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
    <link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
<h1>User List</h1>

<button><a href="/users?action=insert">Create new User</a></button>

<button><a href="/users?action=search_by_country">Search By Country</a></button>

<button><a href="/users?action=search_by_id_sp">Search By ID</a></button>

<button><a href="/users?action=insert_by_sp">Create new User (by SP)</a></button>

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
            <td><button onclick="onDelete(${userObj.getId()})" type="button" class="btn btn-danger">Delete</button></td>
        </tr>
    </c:forEach>
</table>
<div class="modal fade" id="modelId" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Confirm delete</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="/student">
                <input type="hidden" name="action" value="delete">
                <input type="hidden" name="id" value="" id="idOnDelete">
                <div class="modal-body">
                    Ban co muon xoa user <span style="color: red">${userObj.getName()}</span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-primary">OK</button>
                </div>
            </form>
        </div>
    </div>
</div>
<%--<form action="" method="post">--%>
<%--    <input type="text" name="id" value="" id="idOnDelete">--%>
<%--    <p></p>--%>
<%--</form>--%>
<script src="js/bootstrap.min.js"></script>
<script>
    function onDelete(id) {
        document.getElementById("idOnDelete").value = id;
    }
</script>
</body>
</html>
