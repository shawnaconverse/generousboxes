<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Generous Boxes</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<a class="navbar-brand" href="#">Navbar</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
	  	<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarNavDropdown">
	  <ul class="navbar-nav">
	    <li class="nav-item active">
	      <a class="nav-link" href="/home">Home <span class="sr-only">(current)</span></a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" href="/donations">Donations</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" href="/partners">Partners</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" href="/aboutus">About Us</a>
	    </li>
	  </ul>
	</div>
	<div>
		<c:if test="${user != null}">
			<div>
				Hello, ${user.firstName } | <a href="/store">Store</a> | <a href="/logout">Logout</a>
			</div>
		</c:if>
		<c:if test="${partner != null }"> 
			<div>
				Hello, ${partner.firstName } | <a href="/store">Store</a> | <a href="/logout">Logout</a>
			</div>
		</c:if>	
		<c:if test="${partner == null && user == null}"> 
			<div>
				<a href="/login">Login</a> | <a href="/register">Sign Up</a>
			</div>
		</c:if>
			
	</div>
</nav>	
	
	<div class="main container container-fluid">
		<h2>Choose your box</h2>
		
		<form:form action="/orders" method="post" modelAttribute="order">
			<div class="card-deck">
				<div class="card">
					<img alt="produce-box" src="Pictures/fresh-VeggiesAndFruit.jpg">
					<div class="card-body">
						<h5 class="card-title">Produce Box</h5>
						<p class="card-text">A box of assorted fruits and vegetables</p>
						<form:input type="radio" value="produce" path="boxType"/>
					</div>
				</div>
				<div class="card">
					<img alt="produce-box" src="Pictures/fresh-food.jpg">
					<div class="card-body">
						<h5 class="card-title">Mix Box</h5>
						<p class="card-text">A box with a mix of meats, dairy, and produce</p>
						<form:input type="radio" value="mixed" path="boxType"/>
					</div>
				</div>
				<div class="card">
					<img alt="produce-box" src="Pictures/fresh-VeggiesAndFruit.jpg">
					<div class="card-body">
						<h5 class="card-title">Meat and Dairy Box</h5>
						<p class="card-text">A box of assorted meats and dairy</p>
						<form:input type="radio" value="meat" path="boxType"/>
					</div>
				</div>
			</div>
		</form:form>
	</div>
	
	<div class="StoreItems">
		<div class="item">
			<img alt="produce-box" src="Pictures/produce-box.jpg">
			Produce Box
			Description: lorem
			Cost:
		</div>
		<div class="item">
			<img alt="fresh-box" src="Pictures/fresh-box.jpg">
			Everything Box
			Description: lorem
			Cost:
		</div>
		<div class="item">
			<img alt="fresh-food" src="Pictures/fresh-food.jpg">
			Protein Box (Meat Only)
			Description: lorem
			Cost:
		</div>
		<div class="item">
			<img alt="dairy-products" src="Pictures/dair-products.png">
			Dairy Box
			Description: lorem
			Cost:
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