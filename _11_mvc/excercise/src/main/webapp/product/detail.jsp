<%--
  Created by IntelliJ IDEA.
  User: This PC
  Date: 8/4/2021
  Time: 11:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<p><a href="/products">Back to main page</a></p>
    <fieldset>
        <legend>Product's detail</legend>
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
        </table>
    </fieldset>
</body>
</html>
