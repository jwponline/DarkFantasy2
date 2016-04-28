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
  <link rel="stylesheet" href="http://code.jquery.com/ui/resources/demos/style.css">
   
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

<txtoutput>
<%---Here goes the flavour text: <%= TempMain.main()%> --%>
<span id="antwoord"></span>
</txtoutput>





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
    <button><input type = "button" value = "stab" id="stab_btn"></button>
    <button><input type = "button" value = "engage" id="engage_btn"></button>
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
    <button><input type = "button" value = "pray for holy fire" id="pray_btn"></button>
    </p>
  </div>
  <h3>Items</h3>
  <div>
    <p>
    Your bags are empty! You poor bastard! 
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

function defend(){
	
	$.get("combat/defend", function(data){
		$("#antwoord").text(data.playerDescription);
	});
}

function engage(){
	
	$.get("combat/engage", function(data){$("#antwoord").text("session created");})
}

function stab(){
	
	$.get("combat/stab", function(data){
		$("#antwoord").text(data.playerDescription);
		$("#antwoord").append(data.enemyDescription);

		});
}

function pray(){
	
	
	$.get("combat/pray", function(data){
		$("#antwoord").text(data.playerDescription);
		$("#antwoord").append(data.enemyDescription);

		});
}

$(document).ready(function(){
	$('#stab_btn').click(stab);
	$('#pray_btn').click(pray);
	$('#defend_btn').click(defend);
	$('#engage_btn').click(engage);
	$('#e1_btn').click(target1);
	$('#e2_btn').click(target2);
	$('#e3_btn').click(target3);
	
});

</script>

</body>
</html>