<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
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
			<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<a class="navbar-brand" href="#">Navbar</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
	  	<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarNavDropdown">
	  <ul class="navbar-nav">
	    <li class="nav-item active">
	      <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" href="#">Features</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" href="#">Pricing</a>
	    </li>
	    <li class="nav-item dropdown">
	      <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	        Dropdown link
	      </a>
	      <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
	        <a class="dropdown-item" href="#">Action</a>
	        <a class="dropdown-item" href="#">Another action</a>
	        <a class="dropdown-item" href="#">Something else here</a>
	      </div>
	    </li>
	  </ul>
	</div>
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
	</div>
</nav>	
		</div>
		
		
	</div>
	<div class="firstSection">
		<!-- Generic Produce Picture -->
		<img alt="" src="">
		<!-- button to go to produce section -->
		<button>Check out our Produce</button>
	</div>
	
	<div >
		<!--Centered and in white section -->
		<button>Check out our fresh and healthy options</button>
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