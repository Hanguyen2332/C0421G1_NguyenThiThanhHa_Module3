<%--
  Created by IntelliJ IDEA.
  User: This PC
  Date: 8/3/2021
  Time: 4:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
    <style>
        /*form{*/
        /*    margin: auto;*/
        /*}*/
        table {
            border: 1px solid black;
            margin: auto;
        }
        tr,td{
            border: 1px solid black;
        }
        td {
            width: 150px;
            font-weight: bold;
        }
        img {
            height: 200px;
            width: 200px;
        }
    </style>
</head>
<body>
<h1 style="text-align: center">DANH SÁCH KHÁCH HÀNG</h1>
<table>
    <tr>
        <th>STT</th>
        <th>Tên</th>
        <th>Ngày sinh</th>
        <th>Địa chỉ</th>
        <th>Ảnh</th>
    </tr>
    <c:forEach var="customerOjb" items="${CustomerListServlet}" varStatus="loop">
        <tr>
            <td style="width: 50px;text-align: center"><c:out value="${loop.count}"/></td>
            <td><c:out value="${customerOjb.fullName}"/></td>
            <td><c:out value="${customerOjb.dateOfBirth}"/></td>
            <td><c:out value="${customerOjb.address}"/></td>
            <td><img src="${customerOjb.image}" alt=""></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
