 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="/WEB-INF/view/Header.jsp" %>


<h3 align="center">Category Page</h3>
<div class="container">
<form action="InsertCategory" method="post">
	
			<div class="form-group">
			 <label for="usr">Category Name</label>
			<input type="text" class="form-control"  id="catname" name="catname" >
			</div>
		<div class="form-group">	
		<label for="usre">Category Description</label>
		<input type="text" class="form-control" id="catdesc" name="catdesc" >
		</div>
		 <button type="submit" class="btn btn-primary">Submit</button>
</form>
</div>
<br>
<div class="container">
<div class="table-responsive">
 <table class="table table-dark table-striped">

	<tr>
		<td>Category ID</td>
		<td>Category Name</td>
		<td>Category Desc</td>
		<td>Operation</td>
	</tr>
	<c:forEach  var="category" items="${listCategories}">
		<tr>
			<td>${category.categoryId}</td>
			<td>${category.categoryName}</td>
			<td>${category.categoryDesc}</td>
			<td><a
				href="<c:url value="/updateCategory${category.categoryId}"/>">Update</a>/
				<a href="<c:url value="/deleteCategory${category.categoryId}"/>">Delete</a>
			</td>
		</tr>
	</c:forEach>

</table>
</div>
</div>
</div>

<%@include file="/WEB-INF/view/Footer.jsp" %>