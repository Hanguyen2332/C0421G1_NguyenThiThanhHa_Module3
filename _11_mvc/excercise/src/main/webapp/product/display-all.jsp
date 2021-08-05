<%--
  Created by IntelliJ IDEA.
  User: This PC
  Date: 8/4/2021
  Time: 11:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Create new Product</h1>
<p><a href="/products?action=create">Create new Product</a></p>
<p><a href="/products?action=search">Search by Name</a></p>

<%--<p><a href="/products?action=search&id=${productObj.getId()}">Search by id</a></p>--%>

<table border="1">
    <tr>
        <th>ID</th>
        <th>Tên sản phẩm</th>
        <th>Nhà sản xuất</th>
        <th>Gía</th>
        <td>Update</td>
        <td>Delete</td>

    </tr>
    <c:forEach var="productObj" items="${productList}">
        <tr>
            <td>${productObj.getId()}</td>
            <td><a href="/products?action=detail&id=${productObj.getId()}">${productObj.getName()}</a></td>
            <td>"${productObj.getMaker()}"</td>
            <td>"${productObj.getPrice()}"</td>
            <td><a href="/products?action=update&id=${productObj.getId()}">Update</a></td>
            <td><a href="/products?action=delete&id=${productObj.getId()}">Delete</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
