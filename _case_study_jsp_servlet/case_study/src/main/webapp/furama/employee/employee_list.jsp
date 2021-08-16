
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Employee</title>
    <link rel="stylesheet" href="../../assert/css/bootstrap.min.css">
    <style>
        .mess-red {
            color: red;
        }
    </style>
</head>
<body>
<jsp:include page="../../layout/header.jsp"></jsp:include>
<jsp:include page="../../layout/navbar.jsp"></jsp:include>

<div class="container-fluid">
    <div class="row p-0">

     <%--        thong bao --%>
        <div class="col-sm-12 col-md-12 col-lg-12 text-center">
            <h2 style="color: blue">Employee</h2>
        </div>
         <div class="col-sm-12 col-md-12 col-lg-12 mess-red">
             <p>${message}</p>          <%--        create/edit - message --%>
         </div>
         <div class="col-sm-12 col-md-12 col-lg-12">
             <c:if test="${empty employeeList}">
                 <p class="mess-red">Employee List is EMPTY!</p>  <%-- List empty - message --%>
             </c:if>
         </div>


         <%--    botton create new--%>
        <div class="col-sm-12 col-md-12 col-lg-12">
            <a class="btn btn-success my-3" href="/employee?action=create_employee" role="button">Create Employee</a>
        </div>

         <%--    Hien thi list--%>
        <div class="col-sm-12 col-md-12 col-lg-12">
            <c:if test="${not empty employeeList}">
                <table class="table table-bordered table-striped" style="font-size: 12px">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Employee Name</th>
                        <th>Day of Birth</th>
                        <th>ID Card</th>
                        <th>Salary</th>
                        <th>Phone number</th>
                        <th>Email</th>
                        <th>Address</th>
                        <th>Position</th>
                        <th>Education degree</th>
                        <th>Division</th>
                        <th>User Name</th>

                        <th colspan="2">Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="employObj" items="${requestScope['employeeList']}">
                        <tr style="text-align: center">
                            <td>${employObj.employeeId}</td>
                            <td>${employObj.employeeName}</td>
                            <td>${employObj.dayOfBirth}</td>
                            <td>${employObj.idCard}</td>
                            <td>${employObj.salary}</td>

                            <td>${employObj.phone}</td>
                            <td>${employObj.email}</td>
                            <td>${employObj.address}</td>

                            <td>${employObj.positionName}</td>
                            <td>${employObj.degreeName}</td>
                            <td>${employObj.divisionName}</td>

                            <td>
                                <c:if test="${employObj.userName != null}">
                                    ${employObj.userName}
                                </c:if>
                            </td>


                            <td><a href="/employee?action=edit&id=${employObj.employeeId}">Update</a></td>
                            <td>
                                <button onclick="onDelete('${employObj.employeeId}','${employObj.employeeName}')"
                                        type="button"
                                        class="btn btn-danger" data-target="#modalId" data-toggle="modal">Delete
                                </button>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </c:if>
        </div>
    </div>
</div>

<%--delete-modal--%>
<div class="modal fade" id="modalId" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Xác nhận xóa</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="/employee">
                <input type="hidden" name="action" value="delete">
                <input type="hidden" name="id" id="idUserDel">
                <div class="modal-body">
                    Ban co muon xoa
                    <span style="color:red;" id="nameUserDel"></span>
                    <%--   ??????????????   --%>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-primary">OK</button>
                </div>
            </form>
        </div>
    </div>
</div>

<%--</div>--%>
<script src="../../assert/jquery/jquery-3.5.1.min.js"></script>
<script src="../../assert/jquery/popper.min.js"></script>
<script src="../../assert/js/bootstrap.min.js"></script>
<script>
    function onDelete(id, name) {
        document.getElementById("idUserDel").value = id;
        document.getElementById("nameUserDel").innerHTML = name;
    }
</script>
</body>
</html>