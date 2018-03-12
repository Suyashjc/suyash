 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="/WEB-INF/view/Header.jsp" %>


<h3 align="center">Supplier</h3>
<div class="container">
<form action="InsertSupplier" method="post">
	
			<div class="form-group">
			 <label for="usr">Supplier Name</label>
			<input type="text" class="form-control"  id="supname" name="supname" >
			</div>
		 <button type="submit" class="btn btn-primary">Submit</button>
</form>
</div><br>

<div class="table-responsive">
 <table class="table table-dark table-striped">
 <tr>
		<td>Category ID</td>
		<td>Category Name</td>
 </tr>
 <c:forEach  var="supplier" items="${listSuppliers}">
		<tr>
			<td>${supplier.supplierId}</td>
			<td>${supplier.supplierName}</td>
			
			<td>
				
				<a href="<c:url value="/deleteSupplier${supplier.supplierId}"/>">Delete</a>
			</td>
		</tr>
			</c:forEach>
</table>
</div>
<%@include file="/WEB-INF/view/Footer.jsp" %>