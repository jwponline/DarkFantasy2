<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Dark Fantasy</title>
<link href="<c:url value="resources/bootstrap/css/bootstrap.min.css"/>"
	rel="stylesheet">
<link href="<c:url value="resources/bootstrap/css/jumbotron.css"/>"
	rel="stylesheet">
<link href="<c:url value="resources/bootstrap/css/ie10-viewport-bug-workaround.css"/>"
	rel="stylesheet">
<link href="<c:url value="/resources/style.css" />" rel="stylesheet"
	type="text/css" />
<script src="resources/bootstrap/css/ie-emulation-modes-warning.js"></script>
</head>
<body>

<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="/DarkFantasyNew/">Dark Fantasy</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<form:form class="navbar-form navbar-right" method="post" modelAttribute="Account">
					<div class="form-group">
						<form:input path="username" type="text" placeholder="Username" class="form-control"/>
					</div>
					<div class="form-group">
						<form:input path="password" type="password" placeholder="Password" class="form-control"/>
					</div>
					<button type="submit" class="btn btn-success">Sign in</button>
				</form:form>
			</div>
		</div>
	</nav>
	<div class="container">
		<h2 class="col-sm-offset-2">Dark Fantasy</h2>
		<h4 class="col-sm-offset-2"></h4>

		<p class="col-sm-offset-2">Please login:</p>
		<form:form class="form-horizontal" method="post"
			modelAttribute="Account">
			<div class="form-group">
				<label for="inputUsername3" class="col-sm-2 control-label">Username</label>
				<div class="col-sm-10">
					<form:input path="username" type="text" class="form-control"
						name="username" id="inputEmail3" placeholder="Username" />
				</div>
			</div>
			<div class="form-group">
				<label for="inputPassword3" class="col-sm-2 control-label">Password</label>
				<div class="col-sm-10">
					<form:input path="password" type="password" class="form-control"
						name="password" id="inputPassword3" placeholder="Password" />
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<%--<div class="checkbox">
        <label>
          <input type="checkbox"> Remember me
        </label>
      </div>--%>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-default">Sign in</button>
					<br>
					<form:errors path="username" />
					<br>
				</div>
			</div>
		</form:form>

		<p class="col-sm-offset-2">Don't have an account yet?</p>
		<p class="col-sm-offset-2">
			<a href="<c:url value="/register"/>">Register here!</a>
		</p>
	</div>
</body>
</html>