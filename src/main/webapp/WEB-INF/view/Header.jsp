
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  </head>
<body>


<nav class="navbar navbar-expand-sm navbar-dark" style="background: black; height: 120px">
<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#nav-content" aria-controls="nav-content" aria-expanded="false" aria-label="Toggle navigation">
<span class="navbar-toggler-icon"></span>
</button>

<!-- Brand -->
<a class="navbar-brand"  href="Home"><img src="<c:url value="/Resources/header1.JPG/"></c:url>" height=100 width=300 /></a>

<c:if test="${!sessionScope.loggedIn}">
<div class="collapse navbar-collapse" id="collapsibleNavbar">
<ul class="navbar-nav mr-auto">
<li class="nav-item">
<a class="nav-link" href="Home">Home</a>
</li>
<li class="nav-item">
<a class="nav-link" href="AboutUs">About Us</a>

</ul>
<ul class="nav navbar-nav navbar-right">
<li class="nav-item">
<a class="nav-link" href="Register">Register</a>
</li>
<li class="nav-item">
<a class="nav-link" href="Loginpage">Login</a>
</li>
</ul>
</div>
</c:if>


<c:if test="${sessionScope.loggedIn}">

	<c:if test="${sessionScope.role=='ROLE_ADMIN'}">
	<div class="collapse navbar-collapse" id="collapsibleNavbar">
<ul class="navbar-nav mr-auto">
<li class="nav-item">
<a class="nav-link" href="Home">Home</a>
</li>

<li class="nav-item">
<a class="nav-link" href="Category">Category</a>
</li>
<li class="nav-item">
<a class="nav-link" href="Product">Product</a>
</li>
<li class="nav-item">
<a class="nav-link" href="ProductPage">View Products</a>
</li>
<li class="nav-item">
<a class="nav-link" href="Supplier">Supplier</a>
</li>
</ul>
<ul class="nav navbar-nav navbar-right">
<li class="userDisableButton" ><h4 class="text-success">Welcome <c:out value="${pageContext.request.userPrincipal.name}"></c:out></h4></li>
<li class="nav-item">
<a class="nav-link" href="logout">Logout</a></li>
</ul>
</div>
</c:if>


<c:if test="${sessionScope.role=='ROLE_USER'}">
<div class="collapse navbar-collapse" id="collapsibleNavbar">
<ul class="navbar-nav mr-auto">
<li class="nav-item">
<a class="nav-link" href="Home">Home</a>
</li>
<li class="nav-item">
<a class="nav-link" href="ProductPage">View Products</a>
</li>
</ul>

<ul class="nav navbar-nav navbar-right">
<li class="nav=item">
<a class="nav-link" href="Cart">Cart</a>
</li>
<li class="nav=item">
<a class="nav-link" href="logout">Logout</a>
</li>
</ul>
</div>
</c:if>

</c:if>
</nav>

  