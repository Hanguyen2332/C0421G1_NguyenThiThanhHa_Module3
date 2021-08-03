<%--
  Created by IntelliJ IDEA.
  User: This PC
  Date: 8/3/2021
  Time: 4:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <form action="/discount"method="post">
    <input type="text" name="description" style="height: 30px" placeholder="Product Description"> <br><br>
    <input type="text" name="listPrice" style="height: 30px" placeholder="List Price"> <br><br>
    <input type="text" name="discountPercent" style="height: 30px" placeholder="Discount Percent"> <br><br>
    <input type="submit" value=" Calculate Discount" style="height: 30px">
  </form>
  </body>
</html>
