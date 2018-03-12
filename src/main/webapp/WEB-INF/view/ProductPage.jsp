<%@include file="/WEB-INF/view/Header.jsp" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<div class="table-responsive">
				<table class="table table-dark table-striped-xl">
					<thead>
						<tr>
							<th>Product ID</th>
							<th>Product Name</th>
							<th>Product Image</th>
							<th>Product Description</th>
							<th>Price</th>
							<c:if test="${sessionScope.role=='ROLE_ADMIN'}">
							<th>Category</th>
							<th>Supplier</th></c:if>
				
							
						</tr>
					</thead>
					<c:forEach items="${listProducts}" var="proditem">
						<tr>
							<td>${proditem.productId}</td>
							<td>${proditem.productname}</td>
							<td><a href="<c:url value="/ProductDesc${proditem.productId}"/>"><img src="Resources/images/${proditem.productId}.jpg"
								title="${proditem.productname}"
								class=" img-thumbnail img-responsive img-rounded" width="150" height="300" /></a></td>
							<td>${proditem.prodDesc}</td>
							<td>&#x20B9 ${proditem.price}</td>
							<c:if test="${sessionScope.role=='ROLE_ADMIN'}">
							<td>${proditem.categoryId}</td>
							<td>${proditem.supplierId}</td></c:if>
							
							
						</tr>
					</c:forEach>
				</table>
<%@include file="/WEB-INF/view/Footer.jsp" %>
