<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
	<h1>회원가입</h1>
	<form action="<%=request.getContextPath() %>/member/signUpAction.jsp" method="post">
		<table class="table">
			<tr>
				<td>이메일</td>
				<td><input type="text" name="memberEmail"></td>
				<td>패스워드</td>
				<td><input type="text" name="memberPw"></td>
				<td>이름</td>
				<td><input type="text" name="memberName"></td>
			</tr>
			<button class="btn btn-success" type="submit">회원 가입</button>
		</table>
	</form>
</div>
</body>
</html>