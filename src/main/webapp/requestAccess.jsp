<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Request Access</title>
    <%@ include file="allcomponents/allCss.jsp" %>
</head>
<body>
    <%@ include file="allcomponents/navbar.jsp" %>

    <div class="container mt-5 text-center">
        <!-- Button to Open Modal -->
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#requestAccessModal">
            Request Access
        </button>

        <!-- Display Success or Error Message -->
        <c:if test="${not empty param.success}">
            <div class="alert alert-success mt-3">
                ${param.success}
            </div>
        </c:if>
        <c:if test="${not empty param.error}">
            <div class="alert alert-danger mt-3">
                ${param.error}
            </div>
        </c:if>
    </div>

    <!-- Modal Structure -->
    <div class="modal fade" id="requestAccessModal" tabindex="-1" aria-labelledby="requestAccessModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="requestAccessModalLabel">Request Access</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <!-- Access Request Form -->
                    <form action="requestAccess" method="post">
                        <div class="mb-3">
                            <label for="software_id" class="form-label">Software:</label>
                            <select name="software_id" id="software_id" class="form-select" required>
                                <c:choose>
                                    <c:when test="${not empty softwareList}">
                                        <c:forEach var="software" items="${softwareList}">
                                            <option value="${software[0]}">${software[1]}</option>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="">No software available</option>
                                    </c:otherwise>
                                </c:choose>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="access_type" class="form-label">Access Type:</label>
                            <select name="access_type" id="access_type" class="form-select" required>
                                <option value="Read">Read</option>
                                <option value="Write">Write</option>
                                <option value="Admin">Admin</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="reason" class="form-label">Reason:</label>
                            <textarea name="reason" id="reason" class="form-control" required></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary w-100">Submit Request</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <%@ include file="allcomponents/footer.jsp" %>
</body>
</html>
