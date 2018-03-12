<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="/WEB-INF/view/Header.jsp" %>
<br>
  <form action="perform_login" method="post">
 
<table class="table table-dark table-striped-xl" >
	<tr >
		<td colspan="2"><center><h3>Enter Credential</h3></center></td>
	</tr>
	<tr>
		<td>User Name </td>
		<td><input type="text" name="username" /></td>
	</tr>
	<tr>
		<td>Password</td>
		<td><input type="password" name="password" /></td>
	</tr>
	<tr >
		<td colspan="2">
		<center><input type="submit" value="Login"/></center>
		</td>
	</tr>
</table>

</form>


<br>
<%@include file="/WEB-INF/view/Footer.jsp" %>
