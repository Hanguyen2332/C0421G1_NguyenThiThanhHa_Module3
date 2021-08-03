<%--
  Created by IntelliJ IDEA.
  User: This PC
  Date: 8/3/2021
  Time: 4:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h4>
    <p style="color: blue">Discount Amount: <%=request.getAttribute("discountAmount")%> VND</p>
    <p style="color: blue">Discount Price: <%=request.getAttribute("discountPrice")%> VND</p>
</h4>
</body>
</html>
