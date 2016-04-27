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
  <h3>Attack</h3>
  <div>
    <p>
    <button><input type = "button" value = "stab" id="stab_btn"></button>
        <button><input type = "button" value = "player" id="player_btn"></button>
    <button>Slash</button>
    <a href="<c:url value="/map"/>">Bash</a>
    <ab1>ownage</ab1>
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
    Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis.
    Phasellus pellentesque purus in massa. Aenean in pede. Phasellus ac libero
    ac tellus pellentesque semper. Sed ac felis. Sed commodo, magna quis
    lacinia ornare, quam ante aliquam nisi, eu iaculis leo purus venenatis dui.
    </p>
    <ul>
      <li>List item one</li>
      <li>List item two</li>
      <li>List item three</li>
    </ul>
  </div>
  <h3>Items</h3>
  <div>
    <p>
    Cras dictum. Pellentesque habitant morbi tristique senectus et netus
    et malesuada fames ac turpis egestas. Vestibulum ante ipsum primis in
    faucibus orci luctus et ultrices posuere cubilia Curae; Aenean lacinia
    mauris vel est.
    </p>
    <p>
    Suspendisse eu nisl. Nullam ut libero. Integer dignissim consequat lectus.
    Class aptent taciti sociosqu ad litora torquent per conubia nostra, per
    inceptos himenaeos.
    </p>
  </div>
</div>


<script>

function defend(){
	
	$.get("combat/defend", function(data){
		$("#antwoord").text(data.playerDescription);
	});
}

function player(){
	
	$.get("combat/player", function(data){
		alert(data);
		$("#antwoord").text(data);
	});
}

function stab(){
	
	$.get("combat/engage", function(data){
		$("#antwoord").text(data);
	})
	$.get("combat/stab", function(data){
	  	alert(data);
		$("#antwoord").append(data.playerDescription);
		$("#antwoord").append(data.enemyDescription);

		});
}

$(document).ready(function(){
	$('#stab_btn').click(stab);
	$('#defend_btn').click(defend);
	$('#player_btn').click(player);
});

</script>

</body>
</html>