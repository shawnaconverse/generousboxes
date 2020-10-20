<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class = "Header">
		<!-- Logo -->
		<img alt="" src=""> 
		<!-- Nav Bar -->
		<div>
			<c:if test="${LOGGED IN IS TRUE }">
				<div>
					Hello, ${User.name } | <a href="/store">Store</a> | <a href="/logout">Logout</a>
				</div>
			</c:if>
			<c:if test="${LOGGED IN IS FALSE }"> 
				<div>
					<a href="/login">Login</a> | <a href="/register">Sign Up</a>
				</div>
			</c:if>
			<div class="Navbar">
				<a href="">Home</a>
				<a href="">Produce</a>
				<a href="">About Us</a>
				<a href="">Partners</a>
				<a href="">Store</a>
			</div>
			<!-- Donation Img -->
			<img alt="" src=""> 	
		</div>
		
		
	</div>
	
	
	<div >
		<h2>Your order has been received, ${User.name}</h2>
		Your shipment of 
		<!-- list of items -->
		Your confimration Number is ........
	</div>
	
		<!--footer section -->
	<div class="footer">
		<div class = "image stubs">
			<img alt="" src="">
			<a href="">Instagram</a>
		</div>
		<div class = "image stubs">
			<img alt="" src="">
			<a href="">Twitter</a>
		</div>
		<div class = "image stubs">
			<img alt="" src="">
			<a href="">Facebook</a>
		</div>
		<div class = "image stubs">
			<img alt="" src="">
			<a href="">Pintrest</a>
		</div>
		<div class = "image stubs">
			<img alt="" src="">
			<a href="">Github</a>
		</div>
	</div>
</body>
</html>