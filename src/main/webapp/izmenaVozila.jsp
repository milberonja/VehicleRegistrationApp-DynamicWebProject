<%@page contentType="text/html" pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<title>Registracija vozila NK - Admin panel</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="css/w3.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<style>
		body {
		  background-image: url("slike/pozadina3.jpg");
		  background-size: cover;
		}
		#izmeni {
			display: block;
		}
	</style>
</head>
<body class="w3-container w3-cyan">

	<h1 class="w3-center w3-wide w3-jumbo w3-text-white" style="text-shadow:5px 5px 0 #444">Kontrolni Admin Panel</h1><br><br><br><br>
	
	<!-- Izmeni Model -->
	<div id="izmeni" class="w3-modal w3-animate-opacity">
	  <div class="w3-modal-content" style="padding:32px">
	    <div class="w3-container w3-white">
	      <i onclick="document.getElementById('izmeni').style.display='none'" class="fa fa-remove w3-transparent w3-button w3-xlarge w3-right"></i>
	      <h2 class="w3-wide">IZMENA VOZILA</h2>
	      <form method="get" action="adminPanel/IzmeniVozilo"> 
	      <p><input class="w3-input w3-border" type="text" name="voziloID" value="${unesenoVozilo.voziloID}" required></p>
	      <p><input class="w3-input w3-border" type="text" name="datum" value="${unesenoVozilo.datum}"required></p>
		   <p>
	      	<select class="w3-select w3-border" name="vreme" required>
			  <option>${unesenoVozilo.vreme}</option>
			  <option value="09:00">09:00</option>
			  <option value="11:00">11:00</option>
			  <option value="13:00">13:00</option>
			  <option value="15:00">15:00</option>
			  <option value="17:00">17:00</option>
			  <option value="19:00">19:00</option>
			</select>
		  </p>
	      <p><input class="w3-input w3-border" type="text" name="marka" value="${unesenoVozilo.marka}" required></p>
	      <p><input class="w3-input w3-border" type="text" name="tip" value="${unesenoVozilo.tip}" required></p>
	      <p><input class="w3-input w3-border" type="text" name="godiste" value="${unesenoVozilo.godiste}" required></p>
	      <p><input class="w3-input w3-border" type="text" name="imeVlasnika" value="${unesenoVozilo.imeVlasnika}" required></p>
	      <p><input class="w3-input w3-border" type="text" name="telefon" value="${unesenoVozilo.telefon}" required></p>
	      <p><input class="w3-input w3-border" type="text" name="adresa" value="${unesenoVozilo.adresa}" required></p>
	      <button type="submit" class="w3-button w3-block w3-padding-large w3-red w3-margin-bottom">IZMENI</button>
	      </form>
	    </div>
	  </div>
	</div>


</body>
</html>
