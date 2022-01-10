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
	</style>
</head>
<body class="w3-container w3-cyan">

	<c:choose>
		<c:when test="${statusAkcije.equals('Uspesno')}">
			<div class="w3-panel w3-green  w3-round w3-display-container">
			  <span onclick="this.parentElement.style.display='none'" class="w3-button w3-large w3-display-topright">&times;</span>
			  <h3>Uspesno izvrsen zahtev! </h3>
			</div>
		</c:when>
		<c:when test="${statusAkcije.equals('NijeUspesno')}">
			<div class="w3-panel w3-red  w3-round w3-display-container">
			  <span onclick="this.parentElement.style.display='none'" class="w3-button w3-large w3-display-topright">&times;</span>
			  <h3>Zahtev nije izvrsen - Doslo je do greske! </h3>
			</div> 
		</c:when>
		<c:otherwise></c:otherwise>
	</c:choose>
	

	<h1 class="w3-center w3-wide w3-jumbo w3-text-white" style="text-shadow:5px 5px 0 #444">Kontrolni Admin Panel</h1><br><br>
	
	<div class="w3-row">
	  <div class="w3-container w3-quarter">
	    <div class="w3-container" onclick="document.getElementById('zakazi').style.display='block'">
		  <div class="w3-card-4 w3-red" style="width:95%">
		    <img src="slike/rezervacija1.png" style="width:70%; margin: 15%">
		    <div class="w3-container w3-center w3-white">
		      <p>ZAKAZI <br>VOZILO</p>
		    </div>
		  </div>
		</div>
	  </div>
	  <div class="w3-container w3-quarter">
	  	<div class="w3-container" onclick="document.getElementById('pronadjiPoVremenu').style.display='block'">
		  <div class="w3-card-4 w3-orange" style="width:95%">
		    <img src="slike/pescanik1.png" style="width:70%; margin: 15%">
		    <div class="w3-container w3-center w3-white">
		      <p>PRONADJI VOZILO <br>PO VREMENU REGISTRACIJE</p>
		    </div>
		  </div>
		</div>
	  </div>
	  <div class="w3-container w3-quarter">
	  	<div class="w3-container" onclick="document.getElementById('pronadjiPoMarki').style.display='block'">
		  <div class="w3-card-4 w3-amber" style="width:95%">
		    <img src="slike/cola1.png" style="width:70%; margin: 15%">
		    <div class="w3-container w3-center w3-white">
		      <p>PRONADJI VOZILO<br>PO OSNOVU MARKE AUTOMOBILA</p>
		    </div>
		  </div>
		</div>
	  </div>
	  <div class="w3-container w3-quarter">
	  	<div class="w3-container" onclick="document.getElementById('pronadjiPoVlasniku').style.display='block'">
		  <div class="w3-card-4 w3-green" style="width:95%">
		    <img src="slike/vlasnik(2).png" style="width:70%; margin: 15%">
		    <div class="w3-container w3-center w3-white">
		      <p>PRONADJI VOZILO<br>PO OSNOVU VLASNIKA</p>
		    </div>
		  </div>
		</div>
	  </div>
	</div><br></br><br>
	

	<c:choose>
		<c:when test="${pronadjenaVozilaPoTerminu.equals('pronadjenaVozilaPoTerminu')}">
			<div class="w3-row">
			  <div class="w3-col" style="width:5%"><p></p></div>
			  <div class="w3-col" style="width:90%">
				  <div class="w3-container w3-margin-64">
				  <h3 class="w3-center w3-wide w3-jumbo w3-text-white" style="text-shadow:5px 5px 0 #444">Pronadjena vozila po datumu</h3>
				  <table class="w3-table-all w3-card-4">
				    <thead>
				      <tr class="w3-orange">
				        <th>ID broj</th>
				        <th>Datum</th>
				        <th>Vreme</th>
				        <th>Marka</th>
				        <th>Tip</th>
				        <th>Godiste</th>
				        <th>Ime vlasnika</th>
				        <th>Telefon</th>
				        <th>Adresa</th>
				        <th class="w3-center">Izmeni / Obrisi</th>
				      </tr>
				    </thead>
				<!--   for (Vozilo vozilo: vozilaPoDatumu) {  -->
				     <c:forEach var="vozilo" items="${vozilaPoDatumu}">
				     	<tr class="w3-hover-blue">
					      <td><c:out value="${vozilo.voziloID}"/></td>
					      <td><c:out value="${vozilo.datum}"/></td>
					      <td><c:out value="${vozilo.vreme}"/></td>
					      <td><c:out value="${vozilo.marka}"/></td>
					      <td><c:out value="${vozilo.tip}"/></td>
					      <td><c:out value="${vozilo.godiste}"/></td>
					      <td><c:out value="${vozilo.imeVlasnika}"/></td>
					      <td><c:out value="${vozilo.telefon}"/></td>
					      <td><c:out value="${vozilo.adresa}"/></td>
					      <td class="w3-center">
					      	<a href="?izmeni=${vozilo.voziloID}" class="w3-button w3-blue w3-animate-opacity"> IZMENI </a>
					      	<a href="?obrisi=${vozilo.voziloID}" class="w3-button w3-red w3-animate-opacity"> OBRISI </a>
					      </td>
					    </tr>
				     </c:forEach>
				     <!-- } -->
				   </table></br></br></br></br></br>
				</div>
			  </div>
			  <div class="w3-col" style="width:5%"><p></p></div>
			</div>
		</c:when>
		<c:otherwise></c:otherwise>
	</c:choose>

	<c:choose>
		<c:when test="${pronadjenaVozilaPoMarki.equals('pronadjenaVozilaPoMarki')}">
			<div class="w3-row">
			  <div class="w3-col" style="width:5%"><p></p></div>
			  <div class="w3-col" style="width:90%">
				  <div class="w3-container w3-margin-64">
				  <h3 class="w3-center w3-wide w3-jumbo w3-text-white" style="text-shadow:5px 5px 0 #444">Pronadjena vozila po marki automobila</h3>
				  <table class="w3-table-all w3-card-4">
				    <thead>
				      <tr class="w3-orange">
				        <th>ID broj</th>
				        <th>Datum</th>
				        <th>Vreme</th>
				        <th>Marka</th>
				        <th>Tip</th>
				        <th>Godiste</th>
				        <th>Ime vlasnika</th>
				        <th>Telefon</th>
				        <th>Adresa</th>
				        <th class="w3-center">Izmeni / Obrisi</th>
				      </tr>
				    </thead>
				<!--   for (Vozilo vozilo: vozilaPoMarki) {  -->
				     <c:forEach var="vozilo" items="${vozilaPoMarki}">
				     	<tr class="w3-hover-blue">
					      <td><c:out value="${vozilo.voziloID}"/></td>
					      <td><c:out value="${vozilo.datum}"/></td>
					      <td><c:out value="${vozilo.vreme}"/></td>
					      <td><c:out value="${vozilo.marka}"/></td>
					      <td><c:out value="${vozilo.tip}"/></td>
					      <td><c:out value="${vozilo.godiste}"/></td>
					      <td><c:out value="${vozilo.imeVlasnika}"/></td>
					      <td><c:out value="${vozilo.telefon}"/></td>
					      <td><c:out value="${vozilo.adresa}"/></td>
					      <td class="w3-center">
					      	<a href="?izmeni=${vozilo.voziloID}" class="w3-button w3-blue w3-animate-opacity"> IZMENI </a>
					      	<a href="?obrisi=${vozilo.voziloID}" class="w3-button w3-red w3-animate-opacity"> OBRISI </a>
					      </td>
					    </tr>
				     </c:forEach>
				     <!-- } -->
				   </table></br></br></br></br></br>
				</div>
			  </div>
			  <div class="w3-col" style="width:5%"><p></p></div>
			</div>
		</c:when>
		<c:otherwise></c:otherwise>
	</c:choose>

	<c:choose>
		<c:when test="${pronadjenaVozilaPoVlasniku.equals('pronadjenaVozilaPoVlasniku')}">
			<div class="w3-row">
			  <div class="w3-col" style="width:5%"><p></p></div>
			  <div class="w3-col" style="width:90%">
				  <div class="w3-container w3-margin-64">
				  <h3 class="w3-center w3-wide w3-jumbo w3-text-white" style="text-shadow:5px 5px 0 #444">Pronadjena vozila po vlasniku automobila</h3>
				  <table class="w3-table-all w3-card-4">
				    <thead>
				      <tr class="w3-orange">
				        <th>ID broj</th>
				        <th>Datum</th>
				        <th>Vreme</th>
				        <th>Marka</th>
				        <th>Tip</th>
				        <th>Godiste</th>
				        <th>Ime vlasnika</th>
				        <th>Telefon</th>
				        <th>Adresa</th>
				        <th class="w3-center">Izmeni / Obrisi</th>
				      </tr>
				    </thead>
				<!--   for (Vozilo vozilo: vozilaPoMarki) {  -->
				     <c:forEach var="vozilo" items="${vozilaPoVlasniku}">
				     	<tr class="w3-hover-blue">
					      <td><c:out value="${vozilo.voziloID}"/></td>
					      <td><c:out value="${vozilo.datum}"/></td>
					      <td><c:out value="${vozilo.vreme}"/></td>
					      <td><c:out value="${vozilo.marka}"/></td>
					      <td><c:out value="${vozilo.tip}"/></td>
					      <td><c:out value="${vozilo.godiste}"/></td>
					      <td><c:out value="${vozilo.imeVlasnika}"/></td>
					      <td><c:out value="${vozilo.telefon}"/></td>
					      <td><c:out value="${vozilo.adresa}"/></td>
					      <td class="w3-center">
					      	<a href="?izmeni=${vozilo.voziloID}" class="w3-button w3-blue w3-animate-opacity"> IZMENI </a>
					      	<a href="?obrisi=${vozilo.voziloID}" class="w3-button w3-red w3-animate-opacity"> OBRISI </a>
					      </td>
					    </tr>
				     </c:forEach>
				     <!-- } -->
				   </table></br></br></br></br></br>
				</div>
			  </div>
			  <div class="w3-col" style="width:5%"><p></p></div>
			</div>
		</c:when>
		<c:otherwise></c:otherwise>
	</c:choose>
	
	<div class="w3-row">
	  <div class="w3-col" style="width:5%"><p></p></div>
	  <div class="w3-col" style="width:90%">
		  <div class="w3-container w3-margin-64">
		  <h3 class="w3-center w3-wide w3-jumbo w3-text-white" style="text-shadow:5px 5px 0 #444">Sva zakazana vozila</h3>
		  <table class="w3-table-all w3-card-4">
		    <thead>
		      <tr class="w3-orange"> 
		        <th>ID broj</th>
		        <th>Datum</th>
		        <th>Vreme</th>
		        <th>Marka</th>
		        <th>Tip</th>
		        <th>Godiste</th>
		        <th>Ime vlasnika</th>
		        <th>Telefon</th>
		        <th>Adresa</th>
		        <th class="w3-center">Izmeni / Obrisi</th>
		      </tr>
		    </thead>
		<!--   for (Vozilo vozilo: svaZakazanaVozila) {  -->
		     <c:forEach var="vozilo" items="${svaZakazanaVozila}">
		     	<tr class="w3-hover-blue">
			      <td><c:out value="${vozilo.voziloID}"/></td>
			      <td><c:out value="${vozilo.datum}"/></td>
			      <td><c:out value="${vozilo.vreme}"/></td>
			      <td><c:out value="${vozilo.marka}"/></td>
			      <td><c:out value="${vozilo.tip}"/></td>
			      <td><c:out value="${vozilo.godiste}"/></td>
			      <td><c:out value="${vozilo.imeVlasnika}"/></td>
			      <td><c:out value="${vozilo.telefon}"/></td>
			      <td><c:out value="${vozilo.adresa}"/></td>
			      <td class="w3-center">
			      	<a href="?izmeni=${vozilo.voziloID}" class="w3-button w3-blue w3-animate-opacity"> IZMENI </a>
			      	<a href="?obrisi=${vozilo.voziloID}" class="w3-button w3-red w3-animate-opacity"> OBRISI </a>
			      </td>
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
	      <h2 class="w3-wide">ZAKAZI VOZILO</h2>
	      <form method="get" action="adminPanel/snimiVozilo"> 
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
	
	<!-- Pronadji po vremenu Model -->
	<div id="pronadjiPoVremenu" class="w3-modal w3-animate-opacity">
	  <div class="w3-modal-content" style="padding:32px">
	    <div class="w3-container w3-white">
	      <i onclick="document.getElementById('pronadjiPoVremenu').style.display='none'" class="fa fa-remove w3-transparent w3-button w3-xlarge w3-right"></i>
	      <h2 class="w3-wide">PRONADJI VOZILO PO OSNOVU VREMENA</h2>
	      <form method="get" action=""> 
	      <p><input class="w3-input w3-border" type="text" name="datum" placeholder="Uneti zakazani datum vozila" required></p>
	      <button type="submit" class="w3-button w3-block w3-padding-large w3-red w3-margin-bottom">PRONADJI</button>
	      </form>
	    </div>
	  </div>
	</div>
	
	<!-- Pronadji po vremenu Model -->
	<div id="pronadjiPoMarki" class="w3-modal w3-animate-opacity">
	  <div class="w3-modal-content" style="padding:32px">
	    <div class="w3-container w3-white">
	      <i onclick="document.getElementById('pronadjiPoVremenu').style.display='none'" class="fa fa-remove w3-transparent w3-button w3-xlarge w3-right"></i>
	      <h2 class="w3-wide">PRONADJI VOZILO PO OSNOVU MARKE AUTOMOBILA</h2>
	      <form method="get" action=""> 
	      <p><input class="w3-input w3-border" type="text" name="marka" placeholder="Uneti marku vozila" required></p>
	      <button type="submit" class="w3-button w3-block w3-padding-large w3-red w3-margin-bottom">PRONADJI</button>
	      </form>
	    </div>
	  </div>
	</div>
	
	<!-- Pronadji po vlasniku Model -->
	<div id="pronadjiPoVlasniku" class="w3-modal w3-animate-opacity">
	  <div class="w3-modal-content" style="padding:32px">
	    <div class="w3-container w3-white">
	      <i onclick="document.getElementById('pronadjiPoVremenu').style.display='none'" class="fa fa-remove w3-transparent w3-button w3-xlarge w3-right"></i>
	      <h2 class="w3-wide">PRONADJI VOZILO PO VLASNIKU AUTOMOBILA</h2>
	      <form method="get" action=""> 
	      <p><input class="w3-input w3-border" type="text" name="vlasnik" placeholder="Uneti ime vlasnika vozila" required></p>
	      <button type="submit" class="w3-button w3-block w3-padding-large w3-red w3-margin-bottom">PRONADJI</button>
	      </form>
	    </div>
	  </div>
	</div>
	
	

</body>
</html>