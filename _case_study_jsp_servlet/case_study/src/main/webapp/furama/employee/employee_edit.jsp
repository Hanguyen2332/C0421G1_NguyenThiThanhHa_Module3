<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Employee </title>
    <style>
        .mess-red {
            color: red;
        }
    </style>
</head>
<body>
<jsp:include page="../../layout/navbar.jsp"></jsp:include>
<div class="w-75 m-auto">
    <div class="row p-0">

        <%--        thong bao --%>
        <div class="row mb-2">
            <h3 class="col-sm-12 col-md-12 col-lg-12 text-sm-center text-md-center text-lg-center mt-3"
                style="color: blue">Edit Employee ID: ${employee.employeeId}</h3>
            <p class="col-sm-12 col-md-12 col-lg-12"
               style="color: red">${message}</p> <%--        create/edit - message: success/fail? --%>
        </div>

        <form action="" method="post">

            <div class="row mb-1">
                <%--            Name: validate Name (khong number)--%>
                <label for="inputEmail3" class="col-sm-4 col-md-4 col-lg-4 px-0 col-form-label mb-1">Employee
                    Name</label>
                <div class="col-sm-8 col-md-8 col-lg-8 mb-1">
                    <input type="text" class="form-control" name="name" id="inputEmail3"
                           value="${employObj.employeeName}">
                    <%--                the validate--%>
                </div>


                <%--            dateOfBirth : validate Age--%>
                <label for="dateOfBirth" class="col-sm-4 col-md-4 col-lg-4 px-0 col-form-label mb-1">Day of
                    Birth</label>
                <div class="col-sm-8 col-md-8 col-lg-8 mb-1">
                    <input type="text" class="form-control" name="dateOfBirth" id="dateOfBirth"
                           value="${employObj.dayOfBirth}">
                    <%--                the validate--%>
                </div>

                <%--            id Card: validate--%>
                <label for="idCard" class="col-sm-4 col-md-4 col-lg-4 px-0 col-form-label mb-1">ID Card</label>
                <div class="col-sm-8 col-md-8 col-lg-8 mb-1">
                    <input type="text" class="form-control" name="idCard" id="idCard" value="${employObj.idCard}">
                    <%--                the validate--%>
                </div>
                <%--            salary: validate (number+so duong)--%>
                <label for="salary" class="col-sm-4 col-md-4 col-lg-4 px-0 col-form-label mb-1">Salary</label>
                <div class="col-sm-8 col-md-8 col-lg-8 mb-1">
                    <input type="text" class="form-control" name="salary" id="salary" value="${employObj.salary}">
                    <%--                the validate--%>
                </div>
                <%--phone: validate--%>
                <label for="phone" class="col-sm-4 col-md-4 col-lg-4 px-0 col-form-label mb-1">Phone Number</label>
                <div class="col-sm-8 col-md-8 col-lg-8 mb-1">
                    <input type="text" class="form-control" name="phone" id="phone" value="${employObj.phone}">
                    <%--                the validate--%>
                </div>
                <%--email: validate--%>
                <label for="email" class="col-sm-4 col-md-4 col-lg-4 px-0 col-form-label mb-1">Email</label>
                <div class="col-sm-8 col-md-8 col-lg-8 mb-1">
                    <input type="text" class="form-control" name="email" id="email" value="${employObj.email}">
                    <%--                the validate--%>
                </div>

                <%--email: validate: text--%>
                <label for="address" class="col-sm-4 col-md-4 col-lg-4 px-0 col-form-label mb-1">Address</label>
                <div class="col-sm-8 col-md-8 col-lg-8 mb-1">
                    <input type="text" class="form-control" name="address" id="address" value="${employObj.address}">
                    <%--                the validate--%>
                </div>

                <%--Position: --%>
                <div class="class=col-sm-4 col-md-4 col-lg-4 px-0 mb-1">Position</div>
                <div class="col-sm-8 col-md-8 col-lg-8 mb-1">
                    <select class="form-select form-select-lg w-100" aria-label=".form-select-lg example"
                            name="positionId" style="height: 40px">
                        <c:forEach var="positionObj" items="${requestScope['positionList']}">
                            <option value="${positionObj.positionId}">${positionObj.positionName}</option>
                        </c:forEach>
                    </select>
                </div>
                <%--    EduDegree--%>
                <div class="class=col-sm-4 col-md-4 col-lg-4 px-0 mb-1">Education Degree</div>
                <div class="col-sm-8 col-md-8 col-lg-8 mb-1">
                    <select class="form-select form-select-lg w-100" aria-label=".form-select-lg example"
                            name="EduDegreeId" style="height: 40px">
                        <c:forEach var="EduDegreeObj" items="${requestScope['educationDegreeList']}">
                            <option value="${EduDegreeObj.degreeId}">${EduDegreeObj.degreeName}</option>
                        </c:forEach>
                    </select>
                </div>
                <%--    Division--%>
                <div class="class=col-sm-4 col-md-4 col-lg-4 px-0 mb-1">Division</div>
                <div class="col-sm-8 col-md-8 col-lg-8 mb-1">
                    <select class="form-select form-select-lg w-100" aria-label=".form-select-lg example"
                            name="divisionId" style="height: 40px">
                        <c:forEach var="divisionObj" items="${requestScope['divisionList']}">
                            <option value="${divisionObj.divisionId}">${divisionObj.divisionName}</option>
                        </c:forEach>
                    </select>
                </div>
                <%--user: --%>
                <label for="userName" class="col-sm-4 col-md-4 col-lg-4 px-0 col-form-label mb-1">User name</label>
                <div class="col-sm-8 col-md-8 col-lg-8 mb-1">
                    <input type="text" class="form-control" name="userName" id="userName" value="${employObj.userName}">
                    <%--                the validate--%>
                </div>
<%--                    submit--%>
                <button type="submit" class="btn btn-primary m-auto mt-1">Update</button>
            </div>
        </form>
    </div>
    <script src="../../assert/jquery/jquery-3.5.1.min.js"></script>
    <script src="../../assert/jquery/popper.min.js"></script>
    <script src="../../assert/js/bootstrap.min.js"></script>
</body>
</html>
