<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up</title>
<%@ include file="allcomponents/allCss.jsp" %> 
<style>
    .card {
        max-width: 400px;
        margin: 50px auto;
        padding: 20px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        border-radius: 8px;
    }

    .form-group {
        margin-bottom: 15px;
    }
</style>
</head>
<body>
    <%@ include file="allcomponents/navbar.jsp" %> 

    <div class="container d-flex justify-content-center">
        <div class="card">
            <h3 class="text-center mb-4">Sign Up</h3>
            <form action="signup" method="post">
                <div class="form-group">
                    <label for="username">Username:</label>
                    <input type="text" id="username" name="username" class="form-control" required>
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" class="form-control" required>
                </div>
                <button type="submit" class="btn btn-primary w-100">Sign Up</button>
            </form>
        </div>
    </div>

    <%@ include file="allcomponents/footer.jsp" %>
</body>
</html>
