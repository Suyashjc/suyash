<%@include file="/WEB-INF/view/Header.jsp" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

 <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
 
<div class="container">
<form:form method="post" action="InsertUser" modelAttribute="userdetails">

<div class="table-responsive">
<table class="table table-dark table-striped">
<tr>
		<td>User Name</td>
		<td><form:input path="username"/></td>
	</tr>

<tr>
		<td>Password</td>
		<td><form:password path="password"/></td>
	</tr>
	
<tr>
		<td>Customer Name</td>
		<td><form:input path="customerName"/></td>
	</tr>

<tr>
		<td>Mobile Number</td>
		<td><form:input path="mobileNo"/></td>
</tr>

<tr>
		<td>Email ID</td>
		<td><form:input path="emailId"/></td>
	</tr>
	
<tr>
		<td>Address</td>
		<td><form:input path="address"/></td>
	</tr>
				
<tr>
		<td colspan="2">
		<center><input type="submit" value="SUBMIT"></center>
	</tr>
</table>
</div>
</form:form>
</div>


<%@include file="/WEB-INF/view/Footer.jsp" %>