<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<%@ include file="allcomponents/allCss.jsp" %> 
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css" integrity="sha384-4SKN9Qh4+OHpAhWcYI/t5GZ1nqbFjQm5yXgJwU8V6VInb1V4Xe1Kg2lmRfK5smpt" crossorigin="anonymous">

</head>
<body>
    <%@ include file="allcomponents/navbar.jsp" %> 

    <div class="container d-flex justify-content-center align-items-center" style="min-height: 80vh;">
        <!-- Card Structure for Login Form -->
        <div class="card p-4 shadow-lg" style="width: 100%; max-width: 400px;">
            <!-- Display Error Message if 'error' parameter is present -->
            <c:if test="${not empty param.error}">
                <div class="alert alert-danger" role="alert">
                    ${param.error}
                </div>
            </c:if>

            <h3 class="card-title text-center mb-4">Login</h3>
            
            <form action="login" method="post">
                <div class="form-group mb-3">
                    <label for="username">Username:</label>
                    <input type="text" id="username" name="username" class="form-control" required>
                </div>
                <div class="form-group mb-3">
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" class="form-control" required>
                </div>
                <button type="submit" class="btn btn-primary w-100">Log In</button>
            </form>
        </div>
    </div>

    <%@ include file="allcomponents/footer.jsp" %>
</body>
</html>
