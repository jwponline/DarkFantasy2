<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="turnbasedcombat.* "%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<c:url value="/resources/UI.css" />" rel="stylesheet"  type="text/css" />
<title>Combat in the Ruins</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
  <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <link rel="stylesheet" href="<c:url value="/resources/bootstrap/css/bootstrap-theme.min.css"/>">
  <!-- <link rel="stylesheet" href="http://code.jquery.com/ui/resources/demos/style.css">-->
  <!-- <link rel="stylesheet" href="<c:url value="/resources/bootstrap/css/jumbotron-narrow.css"/>">-->
   
  <script>
  $(function() {
    $( "#accordion" ).accordion();
  });
  </script>
</head>
<body>

<menu>
Menu:
<menubutton>Charactersheet</menubutton>
Inventory
Map
log out
</menu>

<div class="jumbotron" id="jumbotron">
<h2>You encounter enemies!</h2>
<txtoutput class="lead">
<%---Here goes the flavour text: <%= TempMain.main()%> --%>
<span id="antwoord"></span>
</txtoutput>
</div>




<div id="accordion">
  <h3>Target selection</h3>
  <div>
    <p>
    <button><input type = "button" value = "Greater Deamon" id="e1_btn"></button>
    <button><input type = "button" value = "Imp" id="e2_btn"></button>
    <button><input type = "button" value = "Cultist" id="e3_btn"></button>
    </p>
  </div>
  <h3>Attack</h3>
  <div>
    <p>
    <button><input type = "button" value = "Stab" id="stab_btn"></button>
    <button><input type = "button" value = "Bash" id="bash_btn"></button>
    <button><input type = "button" value = "Slash" id="slash_btn"></button>
    </p>
  </div>
  <h3>Defend</h3>
  <div>
    <p>
    <button><input type = "button" value = "defend" id="defend_btn"></button>
    </p>
  </div>
  <h3>Magic</h3>
  <div>
    <p>
    <button><input type = "button" value = "Read Mind" id="readmind_btn"></button>
    <button><input type = "button" value = "Fireball" id="fireball_btn"></button>
    <button><input type = "button" value = "Ice Spike" id="icespike_btn"></button>
    <button><input type = "button" value = "pray for holy fire" id="pray_btn"></button>
    </p>
  </div>
  <h3>Items</h3>
  <div>
    <p>
    Your bags are empty! You poor bastard! 
    </p>
  </div>
    <h3>Special</h3>
  <div>
    <p>
    <button><input type = "button" value = "Inspect" id="inspect_btn"></button>
    <button><input type = "button" value = "Nuke the site from orit" id="nuke_btn"></button>
    </p>
  </div>
</div>


<script>

function target1(){
	
	$.get("combat/target1", function(data){
		$("#antwoord").text("You look at the " + data + " and prepare to strike.");
	});
}

function target2(){
	
	$.get("combat/target2", function(data){
		$("#antwoord").text("You look at the " + data + " and prepare to strike.");
	});
}
function target3(){
	
	$.get("combat/target3", function(data){
		$("#antwoord").text("You look at the " + data + " and prepare to strike.");
	});
}

function stab(){
	
	$.get("combat/stab", function(data){
		if (data.winner){window.location = "winner"}
		if (data.loser){window.location = "loser"}
		$("#antwoord").text(data.playerDescription);
		$("#antwoord").append(data.enemyDescription);
		});
}

function slash(){
	
	$.get("combat/slash", function(data){
		if (data.winner){window.location = "winner"}
		if (data.loser){window.location = "loser"}
		$("#antwoord").text(data.playerDescription);
		$("#antwoord").append(data.enemyDescription);
		});
}
function bash(){
	
	$.get("combat/bash", function(data){
		if (data.winner){window.location = "winner"}
		if (data.loser){window.location = "loser"}
		$("#antwoord").text(data.playerDescription);
		$("#antwoord").append(data.enemyDescription);
		});
}

function defend(){
	
	$.get("combat/defend", function(data){
		$("#antwoord").text(data.playerDescription);
	});
}

function pray(){
	
	$.get("combat/pray", function(data){
		if (data.winner){window.location = "winner"}
		if (data.loser){window.location = "loser"}
		$("#antwoord").text(data.playerDescription);
		$("#antwoord").append(data.enemyDescription);
		});
}

function fireball(){
	
	$.get("combat/fireball", function(data){
		if (data.winner){window.location = "winner"}
		if (data.loser){window.location = "loser"}
		$("#antwoord").text(data.playerDescription);
		$("#antwoord").append(data.enemyDescription);
		});
}

function readmind(){
	
	$.get("combat/mindread", function(data){
		if (data.winner){window.location = "winner"}
		if (data.loser){window.location = "loser"}
		$("#antwoord").text(data.playerDescription);
		$("#antwoord").append(data.enemyDescription);
		});
}

function icespike(){
	
	$.get("combat/icespike", function(data){
		if (data.winner){window.location = "winner"}
		if (data.loser){window.location = "loser"}
		$("#antwoord").text(data.playerDescription);
		$("#antwoord").append(data.enemyDescription);
		});
}

function inspect(){
	
	$.get("combat/inspect", function(data){
		if (data.winner){window.location = "winner"}
		if (data.loser){window.location = "loser"}
		$("#antwoord").text(data.playerDescription);
		});
}

function nuke(){
	window.location = "nuke"
}

$(document).ready(function(){
	$('#stab_btn').click(stab);
	$('#slash_btn').click(slash);
	$('#bash_btn').click(bash);
	$('#pray_btn').click(pray);
	$('#icespike_btn').click(icespike);
	$('#fireball_btn').click(fireball);
	$('#readmind_btn').click(readmind);
	$('#defend_btn').click(defend);
	$('#inspect_btn').click(inspect);
	$('#nuke_btn').click(nuke);
	$('#e1_btn').click(target1);
	$('#e2_btn').click(target2);
	$('#e3_btn').click(target3);
	
});

</script>

</body>
</html>