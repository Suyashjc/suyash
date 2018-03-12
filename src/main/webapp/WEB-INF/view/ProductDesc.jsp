<%@include file="/WEB-INF/view/Header.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<h3 align="center">Product Page</h3>
<div class="container">
<div class="table-responsive">
<table class="table table-dark table-striped">
	<tr >
		<td rowspan="6">
		<img src="<c:url value="/Resources/images/${ProductInfo.productId}.jpg"/>" width="300" height="300"/>
		</td>
		<td>Product ID</td>
		<td>${ProductInfo.productId}</td>
	</tr>
	<tr >
		<td>Price</td>
		<td>${ProductInfo.price}</td>
	</tr>
	<tr >
		<td>Product Name</td>
		<td>${ProductInfo.productname}</td>
	</tr>
	<tr >
		<td>Category ID</td>
		<td>${categoryName}</td>
	</tr>
	<tr >
		<td>Supplier ID</td>
		<td>${ProductInfo.supplierId}</td>
	</tr>
	<tr >
		<td>Product Description</td>
		<td>${ProductInfo.prodDesc}</td>
	</tr>
	<tr>
	<form action="<c:url value="/addToCart${ProductInfo.productId }"/>" method="get"	>
	<table class="table table-dark table-striped">
		<td><h4>Quantity</h4></td>
		<td>
		<select name="quantity">
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5</option>
		</select>
		</td>
	</tr>
	<c:if test="${sessionScope.role=='ROLE_USER'}">
	<tr>
	<td>
	<input type="submit" value="AddToCart">
	</td>
	</tr>
	</c:if>
	<c:if test="${sessionScope.role=='ROLE_ADMIN'}">
	<tr>
	<td colspan="2"><a href="<c:url value="/UpdateProduct${ProductInfo.productId}"/>">Update</a></td>
	</tr>
	<tr>
	<td colspan="2"><a href="<c:url value="/DeleteProduct${ProductInfo.productId}"/>">Delete</a></td>
	</tr>
	</c:if>
	</table>
	</form>
</table>
</div>
</div>
<%@include file="/WEB-INF/view/Footer.jsp" %>