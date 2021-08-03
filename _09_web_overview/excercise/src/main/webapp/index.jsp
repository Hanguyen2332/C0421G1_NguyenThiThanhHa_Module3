<%--
  Created by IntelliJ IDEA.
  User: This PC
  Date: 8/3/2021
  Time: 8:19 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <form action="/calculate-discount"method="post">
  <input type="text" name="description" placeholder="Product Description" style="height: 30px"> <br><br>
  <input type="text" name="listPrice" placeholder="List Price" style="height: 30px"><br><br>
  <input type="text" name="discountPercent" placeholder="Discount Percent" style="height: 30px"><br><br>
  <input type="submit" value=" Calculate Discount" style="height: 30px">
  </form>
  </body>
</html>
