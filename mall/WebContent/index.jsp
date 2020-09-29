<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*" import="vo.*" import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>goodee shop</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
</head>
<%
	request.setCharacterEncoding("utf-8");
	CategoryDao categoryDao = new CategoryDao();
	ArrayList<Category> categoryList1 = categoryDao.selectCategoryList(); // 전체 카테고리 목록의 리스트
	ArrayList<Category> categoryList2 = categoryDao.selectCategoryCkList(); //추천 카테고리 목록의 리스트
%>
<body>
	<div class="container">
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	<div>
	이 페이지는 사용자 홈쇼핑 페이지입니다.
	추가해야할 목록 1. 회원 수정, 탈퇴 추가  2. 디자인 전면 수정 3. 검색 추가 4. 페이징 추가 5. 주석 삽입
	</div>
		<div>
			<!-- 전체카테고리3 / 이미지 배너9 -->
			<div class="row">
				<div class="col-sm-3">
					<!-- 전체카테고리 -->
					<div class="btn-group-vertical container-fluid">
						<%
							for (Category c : categoryList1) {
						%>
							<a href="<%=request.getContextPath()%>/product/productList.jsp?categoryId=<%=c.getCategoryId()%>" class="btn btn-secondary"><%=c.getCategoryName()%></a>
						<%
							}
						%>
					</div>
				</div>
				<div class="col-sm-9">
					<img src="<%=request.getContextPath()%>/image/cat.jpg" width="800" height="400">
				</div>
			</div>
		</div>
		<!-- 최근 공지 2개 -->
		<%
			NoticeDao noticeDao = new NoticeDao();
			ArrayList<Notice> noticeList = noticeDao.selectNoticeList();
		%>
		<div>
			<table class="table">
				<thead>
					<tr>
						<td>번호</td>
						<td>공지</td>
					</tr>
				</thead>
				<tbody>
					<%
						for(Notice n : noticeList) {
					%>
					<tr>
						<td><%=n.getNoticeId()%></td>
						<td>
							<a href="<%=request.getContextPath()%>/notice/noticeOne.jsp?noticeId=<%=n.getNoticeId()%>"><%=n.getNoticeTitle()%></a>
						</td>
					</tr>
				<%
						}
				%>	
				</tbody>
			</table>
		</div>
		<!-- 추천 카테고리 이미지 링크 -->
		<div class="d-flex justify-content-between">
			<%
				for (Category c : categoryList2) {
			%>
			<a href="<%=request.getContextPath()%>/product/productList.jsp?categoryId=<%=c.getCategoryId() %>">
				<img src="<%=request.getContextPath()%>/image/ogu.jpg" class="rounded-circle" width="200" height="200">
			</a>
			<%
				}
			%>
		</div>

		<%
			Calendar today = Calendar.getInstance(); 
		%>
		<!-- 카테고리별 추천상품 -->
		<div>
			<h3>
				오늘의 추천상품 <span class="badge badge-primary"> <%=today.get(Calendar.YEAR)%>.<%=today.get(Calendar.MONTH) + 1%>.<%=today.get(Calendar.DAY_OF_MONTH)%>
				</span>
			</h3>
			<div>
				<%
					for (Category c : categoryList1) {
				%>
				 	<a class="btn btn-secondary" href="<%=request.getContextPath() %>/index.jsp?categoryId=<%=c.getCategoryId()%>">[<%=c.getCategoryName()%>]</a>	
				<%
					}
				%>
			</div>
		</div>

		<%
		ProductDao productDao = new ProductDao();
		ArrayList<Product> productList = null;
		int categoryId = -1;
		if(request.getParameter("categoryId") != null){ // 카테고리 id가 채워져있을때 
			categoryId = Integer.parseInt(request.getParameter("categoryId"));
		}
		
		if(categoryId==-1) {
			productList = productDao.selectProductList();
		} else {
			productList = productDao.selectProductListByCategoryId(categoryId);
		}
		%>
		<!-- 상품 목록 6개 -->
		<table class="table">
			<tr>
				<%
					int i = 0;
					for (Product p : productList) {
						i=i+1;
				%>
						<td>
							<div class="card">
								<img class="card-img-top" src="<%=request.getContextPath()%>/image/<%=p.getProductPic()%>">
								<div class="card-body">
									<h4 class="card-title"><a href="<%=request.getContextPath()%>/product/productOne.jsp?productId=<%=p.getProductId() %>"><%=p.getProductName()%></a></h4>
									<p class="card-text"><%=p.getProductPrice()%></p>
								</div>
							</div>
						</td>
				<%
						if(i%3==0) {
				%>
							</tr><tr>
				<%			
						}
					}
				%>
			</tr>
		</table>
	</div>
</body>
</html>