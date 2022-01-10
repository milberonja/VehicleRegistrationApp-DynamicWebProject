<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<title>Registracija vozila - NK</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Lato", sans-serif;}
body, html {
  height: 100%;
  color: #777;
  line-height: 1.8;
}

/* Create a Parallax Effect */
.bgimg-1, .bgimg-2, .bgimg-3 {
  background-attachment: fixed;
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
}

/* First image (Logo. Full height) */
.bgimg-1 {
  background-image: url("slike/registracija1.jpg");
  min-height: 100%;
}

/* Second image (Portfolio) */
.bgimg-2 {
  background-image: url("slike/registracija.jpg");
  min-height: 400px;
}

/* Third image (Contact) */
.bgimg-3 {
  background-image: url("slike/kontakt.png");
  min-height: 400px;
}

.w3-wide {letter-spacing: 10px;}
.w3-hover-opacity {cursor: pointer;}

/* Turn off parallax scrolling for tablets and phones */
@media only screen and (max-device-width: 1600px) {
  .bgimg-1, .bgimg-2, .bgimg-3 {
    background-attachment: scroll;
    min-height: 400px;
  }
}
</style>
<body>

<!-- Navbar (sit on top) -->
<div class="w3-top">
  <div class="w3-bar" id="myNavbar">
    <a class="w3-bar-item w3-button w3-hover-black w3-hide-medium w3-hide-large w3-right" href="javascript:void(0);" onclick="toggleFunction()" title="Toggle Navigation Menu">
      <i class="fa fa-bars"></i>
    </a>
    <a href="#home" class="w3-bar-item w3-button">POCETNA</a>
    <a href="#about" class="w3-bar-item w3-button w3-hide-small"><i class="fa fa-user"></i> O NAMA</a>
    <a href="#portfolio" class="w3-bar-item w3-button w3-hide-small"><i class="fa fa-th"></i> PORTFOLIO</a>
    <a href="#contact" class="w3-bar-item w3-button w3-hide-small"><i class="fa fa-envelope"></i> KONTAKT</a>
    <button onclick="document.getElementById('id01').style.display='block'" class="w3-bar-item w3-button w3-hide-small w3-right w3-hover-red"><i class="fa fa-user"> </i> ADMIN</button>
  </div>

  <!-- Navbar on small screens -->
  <div id="navDemo" class="w3-bar-block w3-white w3-hide w3-hide-large w3-hide-medium">
    <a href="#about" class="w3-bar-item w3-button" onclick="toggleFunction()">O NAMA</a>
    <a href="#portfolio" class="w3-bar-item w3-button" onclick="toggleFunction()">PORTFOLIO</a>
    <a href="#contact" class="w3-bar-item w3-button" onclick="toggleFunction()">KONTAKT</a>
    <a href="" class="w3-bar-item w3-button" onclick="document.getElementById('id01').style.display='block'">ADMIN</a>
  </div>
</div>

<c:choose>
	<c:when test="${adminStatus.equals('NePostojiAdmin')}">
		<div class="w3-panel w3-red  w3-round w3-display-container">
		  <span onclick="this.parentElement.style.display='none'" class="w3-button w3-large w3-display-topright">&times;</span>
		  <h3>Greska u unosu! </h3>
		  <p>Admin ime ili sifra nisu tacni</p>
		</div>
	</c:when>
</c:choose>

<!-- First Parallax Image with Logo Text -->
<div class="bgimg-1 w3-display-container w3-opacity-min" id="home">
  <div class="w3-display-middle" style="white-space:nowrap;">
    <a href="prikaziRezervacije" class="w3-button w3-center w3-padding-large w3-black w3-xlarge w3-wide w3-animate-opacity"> ZAKAZI REZERVACIJU </a>
  </div>
</div>

<!-- Container (About Section) -->
<div class="w3-content w3-container w3-padding-64" id="about">
  <h3 class="w3-center">O NAMA</h3>
  <p class="w3-center"><em>Mi smo tu za vas</em></p>
  <p> Registracija vozila - NK je firma sa dugom praksom u radu. Vec tri generacije porodice Kovacem bespostedno radi za svoje cenjene korisnike jer nama je zadovoljna musterija imperativ. Iz generacije u generaciju
    osavremenjavali smo svoj salon kako bi mogao da odgovori svakom izovu modernog doba. Sada sa ponosom mozemo da kazemo da smo vodeca firma za registraciju vozila u nasem gradu, a bez lazne skromnosti, i u regionu.
    Kod nas cete se susresti sa osobljem koje ce vas ljubazno primiti, saslusati i izaci u susret svakom vasem zahtevu. 
  </p>
  <div class="w3-row">
    <div class="w3-col m6 w3-center w3-padding-large">
      <p><b><i class="fa fa-user w3-margin-right"></i>Nenad Kovacev</b></p><br>
      <img src="slike/vlasnik.jpg" class="w3-round w3-image w3-opacity w3-hover-opacity-off" alt="Photo of Me" width="500" height="333">
    </div>

    <!-- Hide this text on small devices -->
    <div class="w3-col m6 w3-hide-small w3-padding-large">
      <p>Imajuci u vidu da se nalazimo u 21. veku preko ovog vebsajta omogucili smo vam da vasu 
        registraciju vozila zakazete i on-line bez potrebe da licno dolazite i gubite vreme koje je danas i suvise skupo. Sa ovog mesta laka cete moci da vidite koji je termin slobodan i kada mozete da zakazete registraciju
        svog vozila.<br><br>
        Radujemo se vazem buducem dolasku, neposredno ili on-line.</p>
    </div>
  </div>
  <p class="w3-large w3-center w3-padding-16">U cemu smo zaista dobri:</p>
  <p class="w3-wide">Strucnost</p>
  <div class="w3-light-grey">
    <div class="w3-container w3-padding-small w3-dark-grey w3-center" style="width:98%">98%</div>
  </div>
  <p class="w3-wide">Profesionalnost</p>
  <div class="w3-light-grey">
    <div class="w3-container w3-padding-small w3-dark-grey w3-center" style="width:95%">95%</div>
  </div>
  <p class="w3-wide">Odnos cena - kvalitet</p>
  <div class="w3-light-grey">
    <div class="w3-container w3-padding-small w3-dark-grey w3-center" style="width:75%">75%</div>
  </div>
</div>

<div class="w3-row w3-center w3-dark-grey w3-padding-16">
  <div class="w3-quarter w3-section">
    <span class="w3-xlarge">14+</span><br>
    Partnera
  </div>
  <div class="w3-quarter w3-section">
    <span class="w3-xlarge">585+</span><br>
    Zavrsenih registracija
  </div>
  <div class="w3-quarter w3-section">
    <span class="w3-xlarge">585+</span><br>
    Zadovoljnih musterija
  </div>
  <div class="w3-quarter w3-section">
    <span class="w3-xlarge">0</span><br>
    Neuspesnih registracija
  </div>
</div>

<!-- Second Parallax Image with Portfolio Text -->
<div class="bgimg-2 w3-display-container w3-opacity-min">
  <div class="w3-display-middle">
    <span class="w3-xxlarge w3-text-white w3-wide">PORTFOLIO</span>
  </div>
</div>

<!-- Container (Portfolio Section) -->
<div class="w3-content w3-container w3-padding-64" id="portfolio">
  <h3 class="w3-center">POGLEDAJTE ZBOG CEGA SMO PONOSNI</h3>
  <p class="w3-center"><em>Evo samo dela slika koje govore o nasem profesionalizmu i predanom radu<br> Kliknite na sliku da bi je uvecali</em></p><br>

  <!-- Responsive Grid. Four columns on tablets, laptops and desktops. Will stack on mobile devices/small screens (100% width) -->
  <div class="w3-row-padding w3-center">
    <div class="w3-col m3">
      <img src="slike/1.jpg" style="width:100%; height: 100%;" onclick="onClick(this)" class="w3-hover-opacity" alt="The mist over the mountains">
    </div>

    <div class="w3-col m3">
      <img src="slike/2.jpg" style="width:100%; height: max-content" onclick="onClick(this)" class="w3-hover-opacity" alt="Coffee beans">
    </div>

    <div class="w3-col m3">
      <img src="slike/3.jpg" style="width:100%; height: 100%;" onclick="onClick(this)" class="w3-hover-opacity" alt="Bear closeup">
    </div>

    <div class="w3-col m3">
      <img src="slike/4.jpg" style="width:100%; height: 100%;" onclick="onClick(this)" class="w3-hover-opacity" alt="Quiet ocean">
    </div>
  </div>

  <div class="w3-row-padding w3-center w3-section">
    <div class="w3-col m3">
      <img src="slike/5.jpg" style="width:100%; height: 100%;" onclick="onClick(this)" class="w3-hover-opacity" alt="The mist">
    </div>

    <div class="w3-col m3">
      <img src="slike/6.jpg" style="width:100%; height: 100%;" onclick="onClick(this)" class="w3-hover-opacity" alt="My beloved typewriter">
    </div>

    <div class="w3-col m3">
      <img src="slike/7.jpg" style="width:100%; height: 100%;" onclick="onClick(this)" class="w3-hover-opacity" alt="Empty ghost train">
    </div>

    <div class="w3-col m3">
      <img src="slike/8.jpg" style="width:100%; height: 100%;" onclick="onClick(this)" class="w3-hover-opacity" alt="Sailing">
    </div>
  </div>
</div>

<!-- Modal for full size images on click-->
<div id="modal01" class="w3-modal w3-black" onclick="this.style.display='none'">
  <span class="w3-button w3-large w3-black w3-display-topright" title="Close Modal Image"><i class="fa fa-remove"></i></span>
  <div class="w3-modal-content w3-animate-zoom w3-center w3-transparent w3-padding-64">
    <img id="img01" class="w3-image">
    <p id="caption" class="w3-opacity w3-large"></p>
  </div>
</div>

<!-- Third Parallax Image with Portfolio Text -->
<div class="bgimg-3 w3-display-container w3-opacity-min">
  <div class="w3-display-middle">
     <span class="w3-xxlarge w3-text-white w3-wide">CONTACT</span>
  </div>
</div>

<!-- Container (Contact Section) -->
<div class="w3-content w3-container w3-padding-64" id="contact">
  <h3 class="w3-center">EVO GDE RADIMO</h3>
  <p class="w3-center"><em>Voleo bih da cujem vase misljenje</em></p>

  <div class="w3-row w3-padding-32 w3-section">
    <div class="w3-col m4 w3-container">
      <img src="slike/kontakt.png" class="w3-image w3-round" style="width:100%">
    </div>
    <div class="w3-col m8 w3-panel">
      <div class="w3-large w3-margin-bottom">
        <i class="fa fa-map-marker fa-fw w3-hover-text-black w3-xlarge w3-margin-right"></i> Novi Sad, SRBIJA<br>
        <i class="fa fa-phone fa-fw w3-hover-text-black w3-xlarge w3-margin-right"></i> Telefon: +381 123456789<br>
        <i class="fa fa-envelope fa-fw w3-hover-text-black w3-xlarge w3-margin-right"></i> Email: registracijavozila-nk@mail.com<br>
      </div>
      <p>Svratite na kafu <i class="fa fa-coffee"></i> da licno dogovorimo sve sto je potrebno ili nam pisite na mejl. <br>Ocekujemo vas.</p>
    </div>
  </div>
</div>

<div class="w3-container">
  <div id="id01" class="w3-modal">
    <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:600px">

      <div class="w3-center"><br>
        <span onclick="document.getElementById('id01').style.display='none'" class="w3-button w3-xlarge w3-hover-red w3-display-topright" title="Close Modal">&times;</span>
        <img src="slike/img_avatar.png" alt="Avatar" style="width:30%" class="w3-circle w3-margin-top">
      </div>

      <form class="w3-container" action="admin" method="post">
        <div class="w3-section">
          <label><b>Admin ime</b></label>
          <input class="w3-input w3-border w3-margin-bottom" type="text" placeholder="Unesite Admin ime" name="adminIme" required>
          <label><b>Sifra</b></label>
          <input class="w3-input w3-border" type="password" placeholder="Unesite sifru" name="sifra" required>
          <button class="w3-button w3-block w3-green w3-section w3-padding" type="submit">Login</button>
        </div>
      </form>

      <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
        <button onclick="document.getElementById('id01').style.display='none'" type="button" class="w3-button w3-red">Cancel</button>
      </div>

    </div>
  </div>
</div>

<!-- Footer -->
<footer class="w3-center w3-black w3-padding-64 w3-opacity w3-hover-opacity-off">
  <a href="#home" class="w3-button w3-light-grey"><i class="fa fa-arrow-up w3-margin-right"></i>To the top</a>
  <div class="w3-xlarge w3-section">
    <i class="fa fa-facebook-official w3-hover-opacity"></i>
    <i class="fa fa-instagram w3-hover-opacity"></i>
    <i class="fa fa-snapchat w3-hover-opacity"></i>
    <i class="fa fa-pinterest-p w3-hover-opacity"></i>
    <i class="fa fa-twitter w3-hover-opacity"></i>
    <i class="fa fa-linkedin w3-hover-opacity"></i>
  </div>
  <p>Powered by <a href="https://99designs.com/profiles/kovacev" title="W3.CSS" target="_blank" class="w3-hover-text-green">KovacevDizajn</a></p>
</footer>
 
<script>
// Modal Image Gallery
function onClick(element) {
  document.getElementById("img01").src = element.src;
  document.getElementById("modal01").style.display = "block";
  var captionText = document.getElementById("caption");
  captionText.innerHTML = element.alt;
}

// Change style of navbar on scroll
window.onscroll = function() {myFunction()};
function myFunction() {
    var navbar = document.getElementById("myNavbar");
    if (document.body.scrollTop > 100 || document.documentElement.scrollTop > 100) {
        navbar.className = "w3-bar" + " w3-card" + " w3-animate-top" + " w3-white";
    } else {
        navbar.className = navbar.className.replace(" w3-card w3-animate-top w3-white", "");
    }
}

// Used to toggle the menu on small screens when clicking on the menu button
function toggleFunction() {
    var x = document.getElementById("navDemo");
    if (x.className.indexOf("w3-show") == -1) {
        x.className += " w3-show";
    } else {
        x.className = x.className.replace(" w3-show", "");
    }
}
</script>

</body>
</html>
