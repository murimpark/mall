<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" import="java.sql.*" import="vo.*" import="dao.*"%>
<%
	if(session.getAttribute("loginMemberEmail")== null) { // admin아이디가 로그인이 되어있지 않다면
		response.sendRedirect(request.getContextPath()+"/login.jsp"); // login페이지로 돌아가시오
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>orderList</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
	<%
		request.setCharacterEncoding("utf-8");
		String memberEmail = (String)session.getAttribute("loginMemberEmail");
		OrdersDao ordersDao = new OrdersDao();
		ArrayList<OrdersAndProduct> list = ordersDao.selectOrdersListByEmail(memberEmail);
	%>
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	<h1>내 주문 목록</h1>
	<table class="table">
		<thead>
			<tr>
				<td>orders_id</td>
				<td>product_id</td>
				<td>product_name</td>
				<td>orders_amount</td>
				<td>orders_price</td>
				<td>member_email</td>
				<td>orders_addr</td>
				<td>orders_state</td>
				<td>orders_date</td>
			</tr>
		</thead>
		<tbody>
			<%
				for(OrdersAndProduct oap : list) {
			%>
			<tr>
				<td><%=oap.orders.getOrdersId() %></td>
				<td><%=oap.orders.getProductId() %></td>
				<td><%=oap.product.getProductName() %></td>
				<td><%=oap.orders.getOrdersAmount() %></td>
				<td><%=oap.orders.getOrdersPrice() %></td>
				<td><%=oap.orders.getMemberEmail() %></td>
				<td><%=oap.orders.getOrdersAddr() %></td>
				<td><%=oap.orders.getOrdersState() %></td>
				<td><%=oap.orders.getOrdersDate() %></td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>
</div>
</body>
</html>