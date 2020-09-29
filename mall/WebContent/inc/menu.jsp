<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">  

		<div>
			<!-- 최상단 검색바 -->
			<div class="row">
				<div class="col"><h3><a class="text-secondary" href="<%=request.getContextPath() %>/index.jsp">Goodee Shop</a></h3></div>
				<div class="col">
					<form>
						<input type="text">
						<button type="submit" class="btn btn-secondary">검색</button>
					</form>
				</div>
				<div class="col">
					<i class='fas fa-user-alt' style='font-size: 48px'></i> <i
						class='fas fa-shopping-cart' style='font-size: 48px'></i>
				</div>
			</div>
		</div>

		<div>
			<!-- 로그인/회원가입 메뉴바 -->
			<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
			<%
				if(session.getAttribute("loginMemberEmail") == null) {
			%>
				
				<!-- Links -->
				<ul class="navbar-nav">  <!-- 로그아웃 상태 -->
					<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath() %>/login.jsp">로그인</a></li>
					<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath() %>/member/signUp.jsp">회원가입</a></li>
				</ul>
				<%
					}
				else {	
				%>
				<ul class="navbar-nav">  <!-- 로그인 상태 -->
					<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath() %>/logoutAction.jsp">로그아웃</a></li>
					<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath() %>/orders/myOrdersList.jsp">주문 정보</a></li>
					<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath() %>/member/myInformList.jsp">회원 정보</a></li>
					<li class="nav-item text-muted"><%=session.getAttribute("loginMemberEmail") %>님 반갑습니다.</li>
				</ul>
				<%
					}
				%>
			</nav>
		</div>