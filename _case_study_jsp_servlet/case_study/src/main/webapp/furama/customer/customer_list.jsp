
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Customer</title>
    <link rel="stylesheet" href="../../assert/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="../../layout/navbar.jsp"></jsp:include>

<div class="container-fluid">
    <div class="row p-0">
<%--                <div class="col-sm-3 col-lg-3">--%>
<%--                <jsp:include page="../../layout/left_sidebar.jsp"></jsp:include>--%>
<%--                </div>--%>
<%--                <div class="col-sm-12 col-md-12 col-lg-12">--%>
        <div class="col-sm-12 col-md-12 col-lg-12 text-center"><h2 style="color: blue">Customer</h2></div>
<%--        <div class="col-sm-12 col-md-12 col-lg-12"></div>--%>
        <div class="col-sm-12 col-md-12 col-lg-12">
            <p style="color: red">${message}</p>
            <c:if test="${empty customerList}">
                <p STYLE="color: red">Customer List is EMPTY!</p>
            </c:if>
        </div>

        <%--            create Customer--%>
        <div class="col-sm-12 col-md-12 col-lg-12 offset-sm-12 offset-md-12 offset-lg-12">
            <a class="btn btn-primary my-3" href="/customer?action=create_customer" role="button">Create Customer</a>
        </div>

        <div class="col-sm-12 col-md-12 col-lg-12">
            <c:if test="${not empty customerList}">
                <table class="table table-bordered table-striped" style="font-size: 12px">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Customer type</th>
                        <th>Name</th>
                        <th>Customer type</th>
                        <th>Day of Birth</th>
                        <th>Gender</th>
                        <th>ID Card</th>
                        <th>Phone number</th>
                        <th>Email</th>
                        <th>Address</th>
                        <th colspan="2">Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="cusObj" items="${requestScope['customerList']}">
                        <tr>
                            <td>${cusObj.customerId}</td>
                            <td>${cusObj.getCustomerCode()}</td>
                            <td>${cusObj.getCustomerName()}</td>
                            <td>${cusObj.getCustomerTypeName()}</td>
                            <td>${cusObj.getDayOfBirth()}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${cusObj.getGender()==true}">Female</c:when>
                                    <c:when test="${cusObj.getGender()==false}">Male</c:when>
                                    <c:otherwise>LGBT</c:otherwise>
                                </c:choose>
                            </td>
                            <td>${cusObj.getIdCard()}</td>
                            <td>${cusObj.getPhone()}</td>
                            <td>${cusObj.getEmail()}</td>
                            <td>${cusObj.getAddress()}</td>
                            <td><a class="btn btn-primary" href="/customer?action=edit&id=${cusObj.customerId}" role="button">Update</a></td>
                            <td>
                                <button onclick="onDelete('${cusObj.customerId}','${cusObj.getCustomerName()}')"
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
            <form action="/customer">
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
