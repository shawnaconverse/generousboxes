<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>About Us</title>
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
				Hello, ${user.name } | <a href="/store">Store</a> | <a href="/logout">Logout</a>
			</div>
		</c:if>
		<c:if test="${partner != null }"> 
			<div>
				Hello, ${partner.name } | <a href="/store">Store</a> | <a href="/logout">Logout</a>
			</div>
		</c:if>	
		<c:if test="${partner == null && user == null}"> 
			<div>
				<a href="/login">Login</a> | <a href="/registration">Sign Up</a>
			</div>
		</c:if>
			
	</div>
</nav>	
	<div style="width:100%;height:400px;">
  		<img alt="happy-boxes" src="Pictures/happy-boxes.jpg" style="float:left;width:60%;height:100%;object-fit:cover;">
  		<img alt="produce-box" src="Pictures/produce-box.jpg" style="float:left;width:40%;height:100%;object-fit:cover;">
	</div>
</div>
		
		<!-- Donation Img -->
	<div class = "aboutUsText">
		<div>
			<h1>Our Mission</h1>
			<h4>Hungry Affects Millions</h4>
			<ul><p>Even in the worlds greatest food-producing nation, children and adults face poverty and hunger in every county across America.</ul></p>
			<ul><p>In 2019, 34 million people lived in poverty in America. Four a family of four, that means earning just $25,000 per year.</p></ul>
			<ul><p>Before the coronavirus pandemic, more than 35 million people struggled with hunger in the United States.</p></ul>
			<ul><p>A household that is food insecure has limited or uncertain access to enough food to support a healthy life.</p></ul>
			<h4>We have sustainable solutions</h4>
			<ul><p>Partnering with local groups and green companies to provide healthy alternatives.</p></ul>	
			<ul><p>Free delivery to needy families across the country.</p></ul>
			<ul><p>Fresh produce from farms for cheaper pricing and healthier meals.</p></ul>
			<ul><p></ul>
		</div>
		<div style="width:50%;height:450px;">
  			<img alt="dairy-products" src="Pictures/dairy-products.jpg" style="float:right;width:90%;height:100%;object-fit:cover;">
		</div>
	</div>
	<div class="footer">
		<div class = "image stubs">
			<img alt="instagram" src="Pictures/instagram-logo.png">
			<a href="">Instagram</a>
		</div>
		<div class = "image stubs">
			<img alt="twitter" src="Pictures/twitter.png">
			<a href="">Twitter</a>
		</div>
		<div class = "image stubs">
			<img alt="facebook" src="Pictures/facebook.jpg">
			<a href="">Facebook</a>
		</div>
		<div class = "image stubs">
			<img alt="pintrest" src="Pictures/pintrest.jpg">
			<a href="">Pintrest</a>
		</div>
		<div class = "image stubs">
			<img alt="github" src="Pictures/github.png">
			<a href="">Github</a>
		</div>
	</div>
</body>
</html>