<%@include file="/WEB-INF/view/Header.jsp" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

 <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<h3 align="center">Products</h3>
<form:form method="post" action="UpdateProduct" modelAttribute="product" enctype="multipart/form-data" >
<table align="center">
	<tr><td><center>Product Detail</center></td></tr>
	<tr>
		<td>Product ID</td>
		<td><form:hidden path="productId"/></td>
	</tr>
	
	<tr>
		<td>Product Name</td>
		<td><form:input path="productname"/></td>
	</tr>
	
	<tr>
		<td>Category</td>
		<td>
		<form:select path="categoryId">
		<form:option value="0" label="----select----"/>
		<form:options items="${catlist}"/>
		</form:select>
		</td>
	</tr>
	
	<tr>
		<td>Supplier</td>
		<td><form:input path="supplierId"/></td>
	</tr>
	
	
	<tr>
		<td>Price</td>
		<td><form:input path="price"/></td>
	</tr>
	
	<tr>
		<td>Stock</td>
		<td><form:input path="stock"/></td>
	</tr>
	
	<tr>
		<td>Product Desc</td>
		<td><form:input path="prodDesc"/></td>
	</tr>

<tr>
		<td>Product Image</td>
		<td><form:input type="file" path="pimage"/></td>
	</tr>
	<tr>
		<td colspan="2">
		<center><input type="submit" value="SUBMIT"></center>
	</tr>
</table>
</form:form>
<%@include file="/WEB-INF/view/Footer.jsp" %>
