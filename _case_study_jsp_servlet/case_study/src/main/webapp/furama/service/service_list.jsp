<%--
  Created by IntelliJ IDEA.
  User: This PC
  Date: 8/14/2021
  Time: 3:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Service list</title>
    <link rel="stylesheet" href="../../assert/css/bootstrap.min.css">
</head>
<body>

<jsp:include page="../../layout/header.jsp"></jsp:include>
<jsp:include page="../../layout/navbar.jsp"></jsp:include>

<%--BODY--%>
<div class="container-fluid">
    <div class="row p-0">

        <%--        thong bao --%>
        <div class="col-sm-12 col-md-12 col-lg-12 text-center">
            <h2 style="color: #0d6efd">Service List</h2>
            <c:if test="${empty serviceList}">
                List Service is empty!
            </c:if>
        </div>

        <%--    botton create new--%>
        <div class="col-sm-12 col-md-12 col-lg-12">
            <a class="btn btn-success my-3" href="/service?action=create_service" role="button">Create Service</a>
        </div>

        <%--    Hien thi list--%>
        <div class="col-sm-12 col-md-12 col-lg-12">
            <c:if test="${not empty serviceList}">
                <table class="table table-bordered table-striped" style="font-size: 12px">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Code</th>
                        <th>Name</th>
                        <th>Service Type</th>
                        <th>Area</th>
                        <th>Max people</th>
                        <th>Standard</th>
                        <th>Pool area</th>
                        <th>Floors</th>
                        <th>Other convenience description</th>
                        <th>Rent Type</th>
                        <th>Price</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="serObj" items="${requestScope['serviceList']}">
                        <tr>
                            <td>${serObj.id}</td>
                            <td>${serObj.code}</td>
                            <td>${serObj.serviceName}</td>
                            <td>${serObj.serviceTypeName}</td>
                            <td>${serObj.area}</td>

                            <td>${serObj.maxPeople}</td>
                            <td>
                                <c:if test="${serObj.standardRoom !=null}">
                                    ${serObj.standardRoom}
                                </c:if>
                            </td>
                            <td>
                                <c:if test="${serObj.poolArea !=0}">
                                    ${serObj.poolArea}>
                                </c:if>
                            </td>
                            <td>
                                <c:if test="${serObj.floors} !=0}">
                                    ${serObj.floors}
                                </c:if>
                            </td>
                            <td>
                                <c:if test="${serObj.otherConvenienceDes != null}">
                                    ${serObj.otherConvenienceDes}
                                </c:if>
                            </td>
                            <td>${serObj.rentTypeName}</td>
                            <td>${serObj.cost}</td>

                                <%--                            <td><a href="/customer?action=edit&id=${serObj.customerId}">Update</a></td>--%>
                                <%--                            <td>--%>
                                <%--                                <button onclick="onDelete('${serObj.customerId}','${serObj.getCustomerName()}')"--%>
                                <%--                                        type="button"--%>
                                <%--                                        class="btn btn-danger" data-target="#modalId" data-toggle="modal">Delete--%>
                                <%--                                </button>--%>
                                <%--                            </td>--%>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </c:if>
        </div>
    </div>
    <%--    row--%>
</div>
<script src="../../assert/jquery/jquery-3.5.1.min.js"></script>
<script src="../../assert/jquery/popper.min.js"></script>
<script src="../../assert/js/bootstrap.min.js"></script>
</body>
</html>
