<%@page contentType="text/html" pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<title>Registracija vozila NK - Zakazivanje</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="css/w3.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<style>
		body {
		  background-image: url("slike/4.jpg");
		  background-size: cover;
		}
	</style>
</head>
<body class="w3-container w3-cyan">

	<c:choose>
		<c:when test="${status.equals('zauzetTermin')}">
			<div class="w3-panel w3-red  w3-round w3-display-container">
			  <span onclick="this.parentElement.style.display='none'" class="w3-button w3-large w3-display-topright">&times;</span>
			  <h3>Greska u unosu! </h3>
			  <p>Vec postoji vozilo koje je rezervisano u istom terminu. Pokusajte ponovo u nekom drugom terminu.</p>
			</div>
		</c:when>
		<c:when test="${status.equals('zakazanTermin')}">
			<div class="w3-panel w3-green  w3-round w3-display-container">
			  <span onclick="this.parentElement.style.display='none'" class="w3-button w3-large w3-display-topright">&times;</span>
			  <h3>Cestitamo! </h3>
			  <p>Uspesno ste rezervisali termin vase registrasije, sto mozete proveriti i tabeli ispod.</p>
			</div> 
		</c:when>
		<c:otherwise></c:otherwise>
	</c:choose>
	

	<h1 class="w3-center w3-wide w3-jumbo w3-text-white" style="text-shadow:5px 5px 0 #444">Postovani korisnici <br>u samo jednom kliku zakazite registraciju vaseg vozila</h1>
	<p class="w3-center w3-wide w3-xlarge">U tabeli mozete videti termine koji su vec zakazani i u odnosu na njih pronadjete svoj zeljeni termin</p><br><br>

	<div class="w3-center">
		<button class="w3-button w3-green" style="width:50%" onclick="document.getElementById('zakazi').style.display='block'"> ZAKAZI </button>
	</div></br></br>
	
	<div class="w3-row">
	  <div class="w3-col" style="width:5%"><p></p></div>
	  <div class="w3-col" style="width:90%">
		  <div class="w3-container w3-margin-64">
		  <table class="w3-table-all w3-card-4">
		    <thead>
		      <tr class="w3-orange">
		        <th>Datum</th>
		        <th>Vreme</th>
		        <th>Marka</th>
		        <th>Tip</th>
		        <th>Godiste</th>
		        <th>Ime vlasnika</th>
		        <th class="w3-center">Status rezervacije</th>
		      </tr>
		    </thead>
		<!--   for (Vozilo vozilo: svaZakazanaVozila) {  -->
		     <c:forEach var="vozilo" items="${svaZakazanaVozila}">
		     	<tr class="w3-hover-blue">
			      <td><c:out value="${vozilo.datum}"/></td>
			      <td><c:out value="${vozilo.vreme}"/></td>
			      <td><c:out value="${vozilo.marka}"/></td>
			      <td><c:out value="${vozilo.tip}"/></td>
			      <td><c:out value="${vozilo.godiste}"/></td>
			      <td><c:out value="${vozilo.imeVlasnika}"/></td>
			      <td class="w3-center">ZAKAZANO </td>
			    </tr>
		     </c:forEach>
		     <!-- } -->
		   </table></br></br></br></br></br>
		</div>
	  </div>
	  <div class="w3-col" style="width:5%"><p></p></div>
	</div>
	
	
	<!-- Zakazi Model -->
	<div id="zakazi" class="w3-modal w3-animate-opacity">
	  <div class="w3-modal-content" style="padding:32px">
	    <div class="w3-container w3-white">
	      <i onclick="document.getElementById('zakazi').style.display='none'" class="fa fa-remove w3-transparent w3-button w3-xlarge w3-right"></i>
	      <h2 class="w3-wide">POPUNUTE OBRAZAC</h2>
	      <p>Unesite sve trazene podatke kako bi ste uspesno rezervisali svoje vozilo.</p>
	      <form method="get" action="snimiVozilo"> 
	      <p><input class="w3-input w3-border" type="text" name="datum" placeholder="Datum (datum uneti u formatu godina-mesec-dan npr. 2021-04-09)" required></p>
		   <p>
	      	<select class="w3-select w3-border" name="vreme" required>
			  <option value="" disabled selected>Odaberite jedno od ponudjenih vremena</option>
			  <option value="09:00">09:00</option>
			  <option value="11:00">11:00</option>
			  <option value="13:00">13:00</option>
			  <option value="15:00">15:00</option>
			  <option value="17:00">17:00</option>
			  <option value="19:00">19:00</option>
			</select>
		  </p>
	      <p><input class="w3-input w3-border" type="text" name="marka" placeholder="Marka vozila" required></p>
	      <p><input class="w3-input w3-border" type="text" name="tip" placeholder="Tip vozila" required></p>
	      <p><input class="w3-input w3-border" type="text" name="godiste" placeholder="Godiste vozila (godiste uneti bez tacke)" required></p>
	      <p><input class="w3-input w3-border" type="text" name="imeVlasnika" placeholder="Ime vlasnika" required></p>
	      <p><input class="w3-input w3-border" type="text" name="telefon" placeholder="Kontakt telefon (telefon uneti u formatu 063/1234-567)" required></p>
	      <p><input class="w3-input w3-border" type="text" name="adresa" placeholder="Kontakt e-mail" required></p>
	      <button type="submit" class="w3-button w3-block w3-padding-large w3-red w3-margin-bottom">ZAKAZI</button>
	      </form>
	    </div>
	  </div>
	</div>

</body>
</html>