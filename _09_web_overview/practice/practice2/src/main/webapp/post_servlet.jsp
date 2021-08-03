<%--
  Created by IntelliJ IDEA.
  User: This PC
  Date: 8/2/2021
  Time: 10:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String display="";
    if (username.equals("admin") && password.equals("admin")) {
         display = "Welcome admin to website!";
    } else {
         display = "Login Error!";
    }
%>
<p style="color: blue; font-size: large"><%=display%></p>
</body>
</html>
