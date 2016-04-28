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
   <style>
  .ui-progressbar {
    position: relative;
    margin-left: 30%;
    margin-right: 30%;
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
    $( "#accordion" ).accordion();
  });
  </script>
</head>
<body>

<menu>		
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
	<li><a href="<c:url value="/map"/>">Go back to map</a></li>
	<li><a href="<c:url value="/logout"/>">Logout</a></li>
	<!--  <li><a href="<c:url value="/register"/>">Delete account</a></li>-->
	</ul>

	</menu>

<div class="jumbotron" id="jumbotron">
<h2>You encounter enemies!</h2>
<div id="progressbar"><div class="progress-label">Loading...</div></div>	
<txtoutput class="lead">
<%---Here goes the flavour text: <%= TempMain.main()%> --%>
<div><span id="nuke"></span></div>

<h3 id="antwoordh"><span id="antwoord"> You find yourself among the ruins of an ancient library, the books have long since gone to dust, but there are still sign of habitation. You advance slowly and silently, in the distance you hear some footsteps approaching, one of which sounds very heavy. You don't have to wait long to find out what it is, as a greater demon, an imp and a cultist round the corner. The battle begins!!! </span></h3></div>
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
    setTimeout( progress, 2000 );

    function progress() {
    	
    var currentHP = ${player.currentHP};
  	  var maxHP = ${player.maxHP};
  	  var healthpercentage = 100 * currentHP / maxHP;
      var val = progressbar.progressbar( "value" ) || 0;
 	if(val < healthpercentage){
      progressbar.progressbar( "value", val + 1 );
      setTimeout( progress, 40 );
 	}
 	if(val > healthpercentage + 1){
 		progressbar.progressbar( "value", val - 1 );
 		setTimeout( progress, 40 );
 	}
 		
      if ( val == healthpercentage ) {
    	  var red = 255 - (val * 255)/100;
    	  var yellow = (val * 255)/100 - 1;
    	  var blue = (val * 255)/100 - 1;
        progressbarValue.css({"background": "rgb(" + red + ", " + yellow + ", " + blue + ")"});
      }
      
    }
 
    

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
	progress;
}

function slash(){
	
	$.get("combat/slash", function(data){
		if (data.winner){window.location = "winner"}
		if (data.loser){window.location = "loser"}
		$("#antwoord").text(data.playerDescription);
		$("#antwoord").append(data.enemyDescription);
		});
	progress;
}
function bash(){
	
	$.get("combat/bash", function(data){
		if (data.winner){window.location = "winner"}
		if (data.loser){window.location = "loser"}
		$("#antwoord").text(data.playerDescription);
		$("#antwoord").append(data.enemyDescription);
		});
	progress;
}

function defend(){
	
	$.get("combat/defend", function(data){
		$("#antwoord").text(data.playerDescription);
	});
	progress();
}

function pray(){
	
	$.get("combat/pray", function(data){
		if (data.winner){alert("winner")}
		if (data.loser){window.location = "loser"}
		$("#antwoord").text(data.playerDescription);
		$("#antwoord").append(data.enemyDescription);
		});
	progress();
	
}

function fireball(){
	
	$.get("combat/fireball", function(data){
		if (data.winner){window.location = "winner"}
		if (data.loser){window.location = "loser"}
		$("#antwoord").text(data.playerDescription);
		$("#antwoord").append(data.enemyDescription);
		});
	progress;
}

function readmind(){
	
	$.get("combat/mindread", function(data){
		if (data.winner){window.location = "winner"}
		if (data.loser){window.location = "loser"}
		$("#antwoord").text(data.playerDescription);
		$("#antwoord").append(data.enemyDescription);
		});
	progress();
}

function icespike(){
	
	$.get("combat/icespike", function(data){
		if (data.winner){window.location = "winner"}
		if (data.loser){window.location = "loser"}
		$("#antwoord").text(data.playerDescription);
		$("#antwoord").append(data.enemyDescription);
		});
	progress;
}

function inspect(){
	
	$.get("combat/inspect", function(data){
		if (data.winner){alert("winner")}
		if (data.loser){window.location = "loser"}
		$("#antwoord").text(data.playerDescription);
		});
	progress;
}

function nuke(){
	$("#nuke").prepend('<img id="Nukeit" src="<c:url value="/resources/Nukeit.jpg"/>" style="width:50%;height:50%;" />');
	$("#antwoord").text("As you give the command, you are quickly whisked away. The large orbital bombardment platform, high above the planet whirs to live, and opens fire."
			+ "The enemies that were arrayed before you are quickly reduced to ash and all is well in the world. Well for you anyway the innocent village 2 miles away isnt as lucky, neither is the city 10 miles from that."
			+ "Many puppies, kittens, and children were harmed in nuking it all from orbit. You beat the game!!!!!")
	
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