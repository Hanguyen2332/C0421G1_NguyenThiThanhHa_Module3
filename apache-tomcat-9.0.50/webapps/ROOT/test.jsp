<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>


<%--POST--%>
<form action="/post_servlet.jsp" method="post">
    <h1>Login</h1>
    <input type="text" name="username" placeholder="username" style="height: 20px"><br><br>
    <input type="text" name="password" placeholder="password" style="height: 20px"><br><BR>
    <input type="submit" value="Sign in">
</form>
</body>
</html>