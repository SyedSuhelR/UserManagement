<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook Index Page</title>
<%@ include file="allcomponents/allCss.jsp"%>
<style type="text/css">
.back-img {
	background: url("images/book1.jpg");
	height: 50vh;
	width: 100X;
	background-repeat: no-repeat;
	background-size: cover;
}

.card:hover {
	background-color: #c2e1f2;
}
.card-group{
padding:50px;
margin:50px;
justify-content:center;


}
</style>
</head>
<body style="background-color: #e3e3de">
	<%@include file="allcomponents/navbar.jsp"%>
	<div></div>
<div class="card-group d-flex gap-5">
  <div class="card">
    <img class="card-img-top" src="allcomponents/images/admin.jpg" alt="Card image cap">
    <div class="card-body">
      <h5 class="card-title ">Admin</h5>
      <button type="button" class="btn btn-success gap-5 m-5" onclick="window.location.href='Login.jsp'">Login as Admin</button>

    </div>
  </div>
  <div class="card">
    <img class="card-img-top" src="allcomponents/images/manager.jpg" alt="Card image cap">
    <div class="card-body">
      <h5 class="card-title">Manager</h5>
      <button type="button" class="btn btn-success m-5" onclick="window.location.href='Login.jsp'">Login as Manager</button>
      
     
    </div>
  </div>
  <div class="card">
    <img class="card-img-top" src="allcomponents/images/employee.jpg" alt="Card image cap">
    <div class="card-body">
      <h5 class="card-title">Employee</h5>
            <button type="button" class="btn btn-success m-5" onclick="window.location.href='Login.jsp'">Login</button>
            <button type="button" class="btn btn-primary "onclick="window.location.href='signup.jsp'">signup</button>
      
    </div>
  </div>
</div>
	
	
<%@ include file="allcomponents/footer.jsp" %>
</body>
</html>