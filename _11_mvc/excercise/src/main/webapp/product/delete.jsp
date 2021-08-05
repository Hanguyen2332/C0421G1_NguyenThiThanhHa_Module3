<%--
  Created by IntelliJ IDEA.
  User: This PC
  Date: 8/4/2021
  Time: 11:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:if test="${message != null}">
    ${message}
</c:if>
<p><a href="/products">Back to main page</a></p>
<form method="post">
    <h3>Are you sure</h3>
    <fieldset>
        <legend>Delete Product</legend>
        <table>
            <tr>
                <td>Name</td>
                <td>${product.getName()}</td>
            </tr>
            <tr>
                <td>Maker</td>
                <td>${product.getMaker()}</td>
            </tr>
            <tr>
                <td>Price</td>
                <td>${product.getPrice()}</td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Delete"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
