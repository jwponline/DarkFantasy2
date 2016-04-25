<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<c:url value="/resources/UI.css" />" rel="stylesheet"
	type="text/css" />
<title>Map</title>
<sec:csrfMetaTags />
<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
	// configureer JQuery om csrf-token mee te sturen
	var csrfParameter = $("meta[name='_csrf_parameter']").attr("content");
	var csrfHeader = $("meta[name='_csrf_header']").attr("content");
	var csrfToken = $("meta[name='_csrf']").attr("content");
</script>
<script src="resources/ImageMapResizer.min.js"></script>
</head>
<body>

	<menu>
<p>${player.name}</p>
		<button>Charactersheet</button>

		Inventory Map

	</menu>

	Welcome to the map!


	<img src="resources\fantasy_forest.png" usemap="#forestmap"
		style="width: 100%; height: 100%;">

	<map name="forestmap">
		<area shape="circle" coords="720,140,40" alt="Ulfang"
			href="<c:url value="/Ruins"/>">
		<area shape="circle" coords="230,350,130" alt="lake"
			href="<c:url value="/Ruins"/>">
		<area shape="circle" coords="170,930,40" alt="Gellrey"
			href="<c:url value="/Ruins"/>">
		<area shape="circle" coords="870,570,55" alt="Strongfair"
			href="<c:url value="/Ruins"/>">
		<area shape="circle" coords="530,350,100" alt="Greatwood"
			href="<c:url value="/Ruins"/>">
		<area shape="circle" coords="1050,400,155" alt="Gibli Plains"
			href="<c:url value="/Ruins"/>">
	</map>
	<script type="text/javascript">
		$('map').imageMapResize();
	</script>
</body>
</html>