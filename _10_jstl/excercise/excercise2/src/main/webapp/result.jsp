<%--
  Created by IntelliJ IDEA.
  User: This PC
  Date: 8/4/2021
  Time: 12:16 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<c:if test="${message !=null}">
    <p style="color: red">"${message}"</p>
</c:if>
<c:if test="${message == null}">
    <h3 style="color: blue">Result:"${result}"</h3>
</c:if>
</body>
</html>
