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
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<sec:csrfMetaTags />
<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
  <!-- <style>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">-->
	<style>
  .ui-progressbar {
    position: relative;
  }
  .ui-progressbar-value{
  	background: rgb(255,0,0);
  }
  .progress-label {
    position: absolute;
    left: 30%;
    top: 4px;
    font-weight: bold;
    text-shadow: 1px 1px 0 #fff;
  }
  </style>
  <script>
  $(function() {
	  var currentHP = ${player.currentHP};
	  var maxHP = ${player.maxHP};
	  var healthpercentage = 100 * currentHP / maxHP - 1;
    var progressbar = $( "#progressbar" ),
      progressLabel = $( ".progress-label" );
 
    progressbar.progressbar({
      value: false,
      change: function() {
        progressLabel.text( "Health: " + progressbar.progressbar( "value" ) + "%" );
      },
      complete: function() {
        progressLabel.text( "Full Health!" );
      }
    });
 
    function progress() {
      var val = progressbar.progressbar( "value" ) || 0;
 
      progressbar.progressbar( "value", val + 1 );
 		
      if ( val < healthpercentage ) {
    	  var red = 255 - (val * 255)/100;
    	  var yellow = (val * 255)/100 - 1;
    	  var blue = (val * 255)/100 - 1;
        setTimeout( progress, 40 );
        progressbarValue.css({"background": "rgb(" + red + ", " + yellow + ", " + blue + ")"});
      }
    }
 
    setTimeout( progress, 2000 );
  });
  </script>
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
	<div id="progressbar" style="margin-right: 5%"><div class="progress-label">Loading...</div></div>		
		<ul>
			<li id="playername">${player.name}</li>
			<li>Gender: ${player.sex}</li>
			<li>current HP: ${player.currentHP}</li>
			<li>max HP: ${player.maxHP}</li>
			<li>bash: ${player.bashDMG}</li>
			<li>slash: ${player.slashDMG}</li>
			<li>pierce: ${player.pierceDMG}</li>
			<li>weapon: ${player.weapon}</li>
		</ul>


		<button>Charactersheet</button>

		<ul>
	<li><a href="<c:url value="/welcome"/>">Go back to welcome page</a></li>
	<li><a href="<c:url value="/logout"/>">Logout</a></li>
	<!--  <li><a href="<c:url value="/register"/>">Delete account</a></li>-->
	</ul>

	</menu>


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