<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="vo.*" import="dao.*"%>
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
<title>공지</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

</head>
<body>
<div class="container">
<%
	int noticeId = Integer.parseInt(request.getParameter("noticeId")); //noticeId 받아옴
	System.out.println(noticeId); 
	
	Notice notice = new NoticeDao().selectNoticeOne(noticeId); 
	
%>
	<h1>공지 내용</h1>
	<table class="table table-striped table-hover table-bordered">
		<tr>
			<td>notice_id</td>
			<td><%=notice.getNoticeId() %></td>
		</tr>
		<tr>
			<td>제목</td>
			<td><%=notice.getNoticeTitle() %></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><%=notice.getNoticeContent()%></td>
		</tr>
		<tr>
			<td>날짜</td>
			<td><%=notice.getNoticeDate() %></td>
		</tr>
	</table>
</div>
</body>
</html>