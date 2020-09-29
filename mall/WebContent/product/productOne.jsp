<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="vo.*" import="dao.*"%>
<%
	if(session.getAttribute("loginMemberEmail")== null) { // 
		response.sendRedirect(request.getContextPath()+"/login.jsp"); // login페이지로 돌아가시오
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

</head>
<body>
<div class="container">
<%
	int productId = Integer.parseInt(request.getParameter("productId")); 
	ProductDao productDao = new ProductDao();
	Product product = productDao.selectProductOne(productId);
%>
	<h1>상품 상세보기</h1>
	<form action="<%=request.getContextPath() %>/orders/addOrdersAction.jsp">
			<input type="hidden" value="<%=product.getProductId() %>" name="productId">
			<input type="hidden" value="<%=product.getProductPrice()%>" name="productPrice">
			<div>
			수량:
			<select name="ordersAmount">
				<%
					for(int i=1; i<11; i+=1){
						%>
							<option value="<%=i%>"><%=i%></option>
						<%
					}
				%>
			</select>개
			</div>
			<div>
				배송주소:
				<input type="text" name="ordersAddr">
			</div>
			<div><button type="submit">주문</button></div>
	</form>
	<table class="table table-striped table-hover table-bordered">
		<tr>
			<td>product_id</td>
			<td><%=product.getProductId() %></td>
		</tr>
				<tr>
			<td>product_pic</td>
			<td><img src="<%=request.getContextPath() %>/image/<%=product.getProductPic()%>"></td>
		</tr>
		<tr>
			<td>product_name</td>
			<td><%=product.getProductName() %></td>
		</tr>
				<tr>
			<td>product_name</td>
			<td><%=product.getProductContent() %></td>
		</tr>
				<tr>
			<td>product_name</td>
			<td><%=product.getProductPrice() %></td>
		</tr>
				<tr>
			<td>product_name</td>
			<td><%=product.getProductSoldout() %></td>
		</tr>
	</table>
</div>
</body>
</html>