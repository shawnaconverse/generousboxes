<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Charities</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
	<div class = "Header">
		<!-- Logo -->
		
		<!-- Nav Bar -->
		<div>
			<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<a class="navbar-brand" href="/home">Generous Boxes</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
	  	<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarNavDropdown">
	  <ul class="navbar-nav">
	    <li class="nav-item active">
	      <a class="nav-link" href="/home">Home <span class="sr-only">(current)</span></a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" href="/orders">Orders</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" href="/partners/donate">Partners</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" href="/aboutus">About Us</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" href="/charity">Charities</a>
	    </li>
	  </ul>
	</div>
	<div>
		<c:if test="${user != null}">
			<div>
				Hello, ${user.firstName} | <a href="/orders">Store</a> | <a href="/logout">Logout</a>
			</div>
		</c:if>
		<c:if test="${partner != null }"> 
			<div>
				Hello, ${partner.firstName } | <a href="/orders">Store</a> | <a href="/logout">Logout</a>
			</div>
		</c:if>	
		<c:if test="${partner == null && user == null}"> 
			<div>
				<a href="/login">Login</a> | <a href="/registration">Sign Up</a>
			</div>
		</c:if>
			
	</div>
</nav>	
	
</div>
	<div>
		<!-- Donation Img -->
	<div class = "aboutUsText">
		<div>
			<h2>Charity of the Month: Catholic Charities</h2>
			<ul><p>We have recently partnered with Cathoic Charities, from  Archdiocese of NewYork, to begin feeding thousands of New York Residents. Through a network of administered, sponsored and affiliated agencies, Catholic Charities delivers, coordinates, and advocates for quality human services and programs touching almost every human need.The neglected child, the homeless family and the hungry senior are among those for whom we provide help and create hope. We rebuild lives and touch almost every human need promptly, locally, day in and day out, always with compassion and dignity. We help your neighbors as you would like to be helped if your family were in need. A household that is food insecure has limited or uncertain access to enough food to support a healthy life.</p></u>
		</div>
	</div>
	<div style="width:75%;height:500px;">
		<img alt="cathoicCharities" src="Pictures/catholicCharities.png" style="float:right;width:100%;height:90%;object-fit:cover;">
	</div>
</div>
<div>
<div class = "charitylist">
		<div>
			<h2>We are grateful for every partner, family, and charity who joins us to fight against hunger.</h2>
			<h2>We will continue to help feed families along with our ongoing partners and charities.</h2>
		</div>
</div>
<div style="width:100%;height:200px;">
  	<img alt="orangeCountyBank" src="Pictures/orangeCountyBank.png" style="float:left;width:25%;height:95%;object-fit:contain;">
  	<img alt="end-poverty" src="Pictures/end-poverty.png" style="float:left;width:75%;height:95%;object-fit:contain;">
</div>

	<div class="footer">
		<div class = "image stubs">
			<img alt="instagram" src="Pictures/instagram-logo.png">
			<a href="">Instagram</a> |
		</div>
		<div class = "image stubs">
			<img alt="twitter" src="Pictures/twitter.png">
			<a href="">Twitter</a> |
		</div>
		<div class = "image stubs">
			<img alt="facebook" src="Pictures/facebook.jpg">
			<a href="">Facebook</a> |
		</div>
		<div class = "image stubs">
			<img alt="pintrest" src="Pictures/pintrest.jpg">
			<a href="">Pintrest</a> |
		</div>
		<div class = "image stubs">
			<img alt="github" src="Pictures/github.png">
			<a href="">Github</a>
		</div>
	</div>
</body>
</html>