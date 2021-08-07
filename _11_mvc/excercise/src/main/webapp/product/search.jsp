<%--
  Created by IntelliJ IDEA.
  User: This PC
  Date: 8/4/2021
  Time: 11:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<p><a href="/products">Back to main page</a></p>
<form action="" method="post">
    <input type="text" name="name">
    <input type="submit" value="Search">
</form>

<%--hien thi ket qua--%>
<c:if test="${productList!=null}">
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Tên sản phẩm</th>
            <th>Nhà sản xuất</th>
            <th>Gía</th>
        </tr>
        <c:forEach var="productObj" items="${requestScope['productList']}">
            <tr>
                <td>${productObj.getId()}</td>
                <td>${productObj.getName()}</td>
                <td>${productObj.getMaker()}</td>
                <td>${productObj.getPrice()}</td>
            </tr>
        </c:forEach>
    </table>
</c:if>
</body>
</html>
