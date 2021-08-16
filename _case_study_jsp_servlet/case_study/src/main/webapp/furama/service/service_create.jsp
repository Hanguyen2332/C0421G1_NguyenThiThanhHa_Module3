<%--
  Created by IntelliJ IDEA.
  User: This PC
  Date: 8/11/2021
  Time: 3:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Service</title>
    <style>
        .mesRed {
            color: red;
        }
    </style>
    <link rel="stylesheet" href="../../assert/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="../../layout/navbar.jsp"></jsp:include>

<%--Thong bao--%>
<div class="row mb-2">
    <h3 class="col-sm-12 col-md-12 col-lg-12 text-center" style="color:blue">Create New Service</h3>
    <p class="col-sm-12 col-md-12 col-lg-12 mesRed">${message}</p>
</div>

<%--    form create--%>
<div class="w-75 m-auto">
    <form action="" method="post">
        <%--        <input type="text" name="action" value="">--%>
        <div class="row mb-1">
            <%--            code: validate DV-XXXX--%>
            <label for="codeRegex" class="col-sm-4 col-md-4 col-lg-4 px-0 col-form-label mb-1">Service code</label>
            <div class="col-sm-8 col-md-8 col-lg-8 mb-">
                <input type="text" class="form-control" name="code" id="codeRegex"
                       placeholder="DV-XXXX" value="${serObj.code}" required>
                <p id="codeMes" class="mesRed">
                    ${validateMesMap.get("checkCode")}
                </p>
                <%--                <p id="checkDuplicateCode" class="mesRed"></p>--%>
            </div>

            <%--            service Name - NO NEED validate--%>
            <label class="col-sm-4 col-md-4 col-lg-4 px-0 col-form-label mb-1">Service Name</label>
            <div class="col-sm-8 col-md-8 col-lg-8 mb-1">
                <input type="text" class="form-control" id="nameRegex" value="${serObj.serviceName}" name="name"
                       required>
                <p class="mesRed">
                    ${validateMesMap.get("checkName")}
                </p>
            </div>

            <%--            service Type Name - select option: --%>
            <div class="class=col-sm-4 col-md-4 col-lg-4 px-0 mb-1">Service Type</div>
            <div class="col-sm-8 col-md-8 col-lg-8 mb-1">
                <select class="form-select form-select-lg w-100" aria-label=".form-select-lg example"
                        style="height: 40px;" name="serTypeId">
                    <c:forEach var="serTypeObj" items="${requestScope['serviceTypeList']}">
                        <option value="${serTypeObj.serviceTypeId}">${serTypeObj.serviceTypeName}</option>
                    </c:forEach>
                </select>
            </div>

            <%--            area - checkDoubleNumber --%>
            <label class="col-sm-4 col-md-4 col-lg-4 px-0 col-form-label mb-1">Area</label>
            <div class="col-sm-8 col-md-8 col-lg-8 mb-1">
                <input type="text" class="form-control" value="${serObj.area}" name="serArea" required>
                <c:if test='${validateMesMap.get("areaIsNumber")!=null}'>
                    <p class="mesRed"> ${validateMesMap.get("areaIsNumber")}</p> <%-- NumberFormatEx--%>
                </c:if>
                <c:if test='${validateMesMap.get("areaIsNumber")==null}'>
                    <p class="mesRed"> ${validateMesMap.get("checkArea")}</p>
                </c:if>
            </div>

            <%--            maxPeople - checkInputNumber + NumberFormatEx---------------------------------------------------------------%>
            <label class="col-sm-4 col-md-4 col-lg-4 px-0 col-form-label mb-1">Max People</label>
            <div class="col-sm-8 col-md-8 col-lg-8 mb-1">
                <input type="text" class="form-control" value="${serObj.maxPeople}" name="maxPeople" required>
                <c:if test='${validateMesMap.get("maxPeopleIsNumber")!=null}'>
                    <p class="mesRed"> ${validateMesMap.get("maxPeopleIsNumber")}</p> <%-- NumberFormatEx--%>
                </c:if>
                <c:if test='${validateMesMap.get("maxPeopleIsNumber")==null}'>
                    <p class="mesRed"> ${validateMesMap.get("checkMaxPeople")}</p>
                </c:if>
            </div>

            <%--            standard Room: validate Khoang trang o giua--%>
            <label class="col-sm-4 col-md-4 col-lg-4 px-0 col-form-label mb-1">Standard Room</label>
            <div class="col-sm-8 col-md-8 col-lg-8 mb-1">
                <input type="text" class="form-control" value="${serObj.standardRoom}" name="standardRoom">
                <p class="mesRed">
                    ${validateMesMap.get("checkStandardRoom")}
                </p>
            </div>

            <%--            pool area: checkDoubleNumber + NumberFormatEx---------------------------------------------------------------%>
            <label class="col-sm-4 col-md-4 col-lg-4 px-0 col-form-label mb-1">Pool area</label>
            <div class="col-sm-8 col-md-8 col-lg-8 mb-1">
                <input type="text" class="form-control" value="${serObj.poolArea}" name="poolArea">
                <c:if test='${validateMesMap.get("poolAreaIsNumber")!=null}'>
                    <p class="mesRed"> ${validateMesMap.get("poolAreaIsNumber")}</p> <%-- NumberFormatEx--%>
                </c:if>
                <c:if test='${validateMesMap.get("poolAreaIsNumber")==null}'>
                    <p class="mesRed"> ${validateMesMap.get("checkPoolArea")}</p>
                </c:if>
            </div>
            <%--            floors - checkInputNumber + NumberFormatEx---------------------------------------------------------------%>
            <label class="col-sm-4 col-md-4 col-lg-4 px-0 col-form-label mb-1">Number Of Floor</label>
            <div class="col-sm-8 col-md-8 col-lg-8 mb-1">
                <input type="text" class="form-control" value="${serObj.floors}" name="floors">
                <c:if test='${validateMesMap.get("floorIsNumber")!=null}'>
                    <p class="mesRed"> ${validateMesMap.get("floorIsNumber")}</p> <%-- NumberFormatEx--%>
                </c:if>
                <c:if test='${validateMesMap.get("floorIsNumber")==null}'>
                    <p class="mesRed"> ${validateMesMap.get("checkFloors")}</p>
                </c:if>
            </div>
            <%--            other Convenience description: NO NEED Validate--%>
            <label class="col-sm-4 col-md-4 col-lg-4 px-0 col-form-label mb-1">Other convenience description</label>
            <div class="col-sm-8 col-md-8 col-lg-8 mb-1">
                <input type="text" class="form-control" value="${serObj.otherConvenienceDes}"
                       name="otherConvenienceDes">
            </div>


            <%--             rent type:  select option: --%>
            <div class="class=col-sm-4 col-md-4 col-lg-4 px-0 mb-1">Rent Type</div>
            <div class="col-sm-8 col-md-8 col-lg-8 mb-1">
                <select class="form-select form-select-lg w-100" aria-label=".form-select-lg example"
                        style="height: 40px;" name="rentTypeId">
                    <c:forEach var="rentTypeObj" items="${requestScope['rentTypeList']}">
                        <option value="${rentTypeObj.rentTypeId}">${rentTypeObj.rentTypeName}</option>
                    </c:forEach>
                </select>
            </div>

            <%--            cost: checkDoubleNumber + NumberFormatEx---------------------------------------------------------------%>
            <label class="col-sm-4 col-md-4 col-lg-4 px-0 col-form-label mb-1">Price</label>
            <div class="col-sm-8 col-md-8 col-lg-8 mb-1">
                <input type="text" class="form-control" value="${serObj.cost}" name="cost" required>
                <c:if test='${validateMesMap.get("costIsNumber")!=null}'>
                    <p class="mesRed"> ${validateMesMap.get("costIsNumber")}</p> <%-- NumberFormatEx--%>
                </c:if>
                <c:if test='${validateMesMap.get("costIsNumber")==null}'>
                    <p class="mesRed"> ${validateMesMap.get("checkCost")}</p>
                </c:if>
            </div>
            <button type="submit" class="btn btn-primary m-auto">Create Service</button>
        </div>
    </form>
</div>

<script src="../../assert/jquery/jquery-3.5.1.min.js"></script>
<script src="../../assert/jquery/popper.min.js"></script>
<script src="../../assert/js/bootstrap.min.js"></script>

</body>
</html>
