<%@include file="/WEB-INF/view/Header.jsp"  %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<c:forEach var="order" items="${orderList}">
<div> Your Order with ID ${order.cartId} has been shipped to ${order.shippingAddr}. be ready with amount ${order.totalAmount}
</div>
</c:forEach>

<%@include file="/WEB-INF/view/Footer.jsp"  %>