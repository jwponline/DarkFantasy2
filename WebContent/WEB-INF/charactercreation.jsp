


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
<title>Character Creation</title>
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
		<form:form class="form-signin" method="post" modelAttribute="Player">
			<h2 class="form-signin-heading">Character Creation</h2>
			<label for="inputUsername" class="sr-only">Character Name</label>
			<form:input path="name" type="text" class="form-control"
				name="playername" id="inputEmail3" placeholder="Character Name" />
			<form:errors path="name" />
			<br>
			<table>
				<tr>
					<td>Sex :</td>
					<td><form:radiobutton path="sex" value="M"
							/>Male <form:radiobutton path="sex"
							value="F"  />Female</td>
					<td><form:errors path="sex" /></td>
				</tr>
			</table>
			<br>
			<button type="submit" class="btn btn-lg btn-primary btn-block">Create
				Character</button>
		</form:form>
	</div>
	<script src="resources/bootstrap/css/ie10-viewport-bug-workaround.js"></script>
</body>
</html>