<%--
  Created by IntelliJ IDEA.
  User: This PC
  Date: 8/4/2021
  Time: 11:25 PM
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
<c:if test="${message != null}">
    ${message}
</c:if>
<p><a href="/products">Back to main page</a></p>
<form method="post">
    <fieldset>
        <legend>Create</legend>
        <table>
            <tr>
                <td>Name</td>
                <td><input type="text" name="name"></td>
            </tr>
            <tr>
                <td>Maker</td>
                <td><input type="text" name="maker"></td>
            </tr>
            <tr>
                <td>Price</td>
                <td><input type="text" name="price"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Create"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
