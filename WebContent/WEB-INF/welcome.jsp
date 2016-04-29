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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome!</title>
<link href="<c:url value="resources/bootstrap/css/bootstrap.min.css"/>"
	rel="stylesheet">
<link href="<c:url value="resources/bootstrap/css/offcanvas.css"/>"
	rel="stylesheet">
<link href="<c:url value="resources/bootstrap/css/ie10-viewport-bug-workaround.css"/>"
	rel="stylesheet">
<link href="<c:url value="/resources/style.css" />" rel="stylesheet"
	type="text/css" />
<script src="resources/bootstrap/css/ie-emulation-modes-warning.js"></script>
</head>
<body>
<nav class="navbar navbar-fixed-top navbar-inverse">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="<c:url value="/"/>">Welcome ${account.username}</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="<c:url value="/logout"/>">Log Out</a></li>
            <li><a href="<c:url value="/map"/>">Go to Map</a></li>
            <li><a href="<c:url value="/Ruins"/>">Combat Ruins</a></li>
          </ul>
        </div><!-- /.nav-collapse -->
      </div><!-- /.container -->
    </nav>


	<br>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="../../dist/js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="resources/bootstrap/css/ie10-viewport-bug-workaround.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
</body>
</html>