<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$("#btn").click(function() { // 유효성 검사 코드
			if($("#memberEmail").val() == "") {
				alert("Email 입력");
				return; 
			}else if($("#memberPw").val() == "") {
				alert("pw 입력");
				return;
			}else if($("#memberName").val() == "") {
				alert("이름 입력");
				return;
			}
			$("#addForm").submit();
		});
	});
</script>
</head>
<body>
<div class="container">
	<h1>회원가입</h1>
	<form action="<%=request.getContextPath() %>/member/signUpAction.jsp" method="post" id="addForm">
		<table class="table">
			<tr>
				<td>이메일</td>
				<td><input type="text" name="memberEmail" id="memberEmail"></td>
				<td>패스워드</td>
				<td><input type="text" name="memberPw" id="memberPw"></td>
				<td>이름</td>
				<td><input type="text" name="memberName" id="memberName"></td>
			</tr>
			<tr>
				<td><button class="btn btn-success" type="button" id="btn">회원 가입</button></td>
			<tr>
		</table>
	</form>
</div>
</body>
</html>