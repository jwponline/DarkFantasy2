<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>Register</title>
<link href="<c:url value="resources/bootstrap/css/bootstrap.min.css"/>"
	rel="stylesheet">
<link href="<c:url value="resources/bootstrap/css/signin.css"/>"
	rel="stylesheet">
<link
	href="<c:url value="resources/bootstrap/css/ie10-viewport-bug-workaround.css"/>"
	rel="stylesheet">
<link href="<c:url value="/resources/style.css" />" rel="stylesheet"
	type="text/css" />
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="resources/bootstrap/css/ie-emulation-modes-warning.js"></script>
</head>
<body>
    
	<div class="container">
		<form:form class="form-signin" method="post" modelAttribute="Account">
			<h2 class="form-signin-heading">Registration</h2>
			<label for="inputUsername" class="sr-only">Username</label>
			<form:input path="username" type="text" class="form-control"
				name="username" id="inputUsername" placeholder="Username" />
			<form:errors path="username" />
			<br>
			<label for="inputPassword" class="sr-only">Password</label>
			<form:input path="password" type="password" class="form-control"
				name="password" id="inputPassword3" placeholder="Password"  />
			<form:errors path="password" />
			<br>
			<button type="submit" class="btn btn-lg btn-primary btn-block">Register</button>
		</form:form>
	</div>
	<script src="resources/bootstrap/css/ie10-viewport-bug-workaround.js"></script>
</body>
</html>