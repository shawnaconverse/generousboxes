<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Donations</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
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
				Hello, ${user.firstName } | <a href="/store">Store</a> | <a href="/logout">Logout</a>
			</div>
		</c:if>
		<c:if test="${partner != null }"> 
			<div>
				Hello, ${partner.firstName } | <a href="/logout">Logout</a>
			</div>
		</c:if>	
		<c:if test="${partner == null && user == null}"> 
			<div>
				<a href="/login">Login</a> | <a href="/registration">Sign Up</a>
			</div>
		</c:if>
			
	</div>
</nav>	

	<div class="main container container-fluid col-med-">
<!-- 		<a href="/orders/cancel">Cancel current subscription</a> -->	
		<table class="table">
			<thead>
				<tr>
					<th scope="col">Donation Amount</th>
					<th scope="col">Date Donated</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${partner.getDonations()}" var="donation">
					<tr>
						<td><c:out value="${donation.getDonation()}"/></td>
						<td><c:out value="${donation.getCreatedAt()}"/></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<form:form class="mt-4 border" action="/partners/donate" method="post" modelAttribute="donation">
			<p>
				<form:label path="donation">Amount: </form:label>
				<form:input type="number" path="donation" step="any" min="1.00"/>
			</p>
			<button>Donate!</button>
			<form:errors path="donation.*"/>
		</form:form>
	</div>

</body>
</html>