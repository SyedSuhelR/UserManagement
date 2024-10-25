<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Pending Requests</title>
    <%@ include file="allcomponents/allCss.jsp" %>
</head>
<body>
    <%@ include file="allcomponents/navbar.jsp" %>

    <div class="container mt-5">
        <h2 class="text-center">Pending Access Requests</h2>

        <!-- Display Success or Error Message -->
        <c:if test="${not empty param.success}">
            <div class="alert alert-success">
                ${param.success}
            </div>
        </c:if>
        <c:if test="${not empty param.error}">
            <div class="alert alert-danger">
                ${param.error}
            </div>
        </c:if>

        <!-- Table to Display Pending Requests -->
        <c:choose>
            <c:when test="${not empty pendingRequests}">
                <table class="table table-bordered mt-3">
                    <thead>
                        <tr>
                            <th>Employee Name</th>
                            <th>Software Name</th>
                            <th>Access Type</th>
                            <th>Reason</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="request" items="${pendingRequests}">
                            <tr>
                                <td>${request.employeeName}</td>
                                <td>${request.softwareName}</td>
                                <td>${request.accessType}</td>
                                <td>${request.reason}</td>
                                <td>
                                    <form action="approveRequest" method="post" style="display:inline;">
                                        <input type="hidden" name="request_id" value="${request.id}">
                                        <button type="submit" name="action" value="approve" class="btn btn-success btn-sm">Approve</button>
                                    </form>
                                    <form action="approveRequest" method="post" style="display:inline;">
                                        <input type="hidden" name="request_id" value="${request.id}">
                                        <button type="submit" name="action" value="reject" class="btn btn-danger btn-sm">Reject</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:when>
            <c:otherwise>
                <p class="text-center mt-3">No pending requests.</p>
            </c:otherwise>
        </c:choose>
    </div>

    <%@ include file="allcomponents/footer.jsp" %>
</body>
</html>
