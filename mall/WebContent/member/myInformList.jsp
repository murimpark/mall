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
<title>내 정보</title>
</head>
<body>
<%
	String memberEmail = (String)session.getAttribute("loginMemberEmail");
	MemberDao memberDao = new MemberDao();
	Member member = memberDao.selectMemberMyInform(memberEmail);
%>
<div class="container">
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	<h1>내 정보</h1>
		<table class="table">
		<thead>
			<tr>
				<td>E-mail</td>
				<td>이름</td>
				<td>만든 날짜</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><%=member.getMemberEmail() %></td>
				<td><%=member.getMemberName() %></td>
				<td><%=member.getMemberDate() %></td>
			</tr>
		</tbody>
	</table>
	<div>
	<a class="btn btn-primary" href="">회원 수정</a>
	<a class="btn btn-danger" href="">회원 탈퇴</a>
	</div>
</div>	
</body>
</html>