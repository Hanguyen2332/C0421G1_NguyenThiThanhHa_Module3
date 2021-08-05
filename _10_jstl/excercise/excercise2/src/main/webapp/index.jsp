<%--
  Created by IntelliJ IDEA.
  User: This PC
  Date: 8/3/2021
  Time: 11:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <h1>Simple Calculator</h1>
  <form action="/calculate">
    <fieldset>
      <legend>Calculator</legend>
      <table style="border: 0;">
        <tr>
          <td>First operand</td>
          <td><input type="text" name="firstOperand"></td>
        </tr>
        <tr>
          <td>Operand</td>
          <td>
            <select name="operand" id="">
              <option value="+">Addition</option>
              <option value="-">Subtraction</option>
              <option value="*">Multiplication</option>
              <option value="/">Division</option>
            </select>
          </td>
        </tr>
        <tr>
          <td>Second operand</td>
          <td><input type="text" name="secondOperand"></td>
        </tr>
        <tr>
          <td></td>
          <td><input type="submit" value="Calculate" style="border-radius: 3px"></td>
        </tr>
      </table>
    </fieldset>
  </form>
  </body>
</html>
