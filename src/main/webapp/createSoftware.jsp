<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Software</title>
    <%@ include file="allcomponents/allCss.jsp" %>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> <!-- Bootstrap CSS -->
    <style>
        .card-container {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh; /* Full height of the viewport */
        }
        .card {
            width: 400px; /* Set a fixed width for the card */
        }
    </style>
</head>
<body>
    <%@ include file="allcomponents/navbar.jsp" %>

    <div class="card-container">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Create Software</h5>
                <form action="createSoftware" method="post">
                    <div class="form-group">
                        <label for="name">Software Name:</label>
                        <input type="text" name="name" id="name" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label for="description">Description:</label>
                        <textarea name="description" id="description" class="form-control" required></textarea>
                    </div>
                    <div class="form-group">
                        <label>Access Levels:</label><br>
                        <input type="checkbox" name="access_levels" value="Read"> Read <br>
                        <input type="checkbox" name="access_levels" value="Write"> Write <br>
                        <input type="checkbox" name="access_levels" value="Admin"> Admin <br>
                    </div>
                    <button type="submit" class="btn btn-primary">Create Software</button>
                </form>
            </div>
        </div>
    </div>

    <%@ include file="allcomponents/footer.jsp" %>
</body>
</html>
