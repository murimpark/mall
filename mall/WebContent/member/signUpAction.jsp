<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<%
	if(session.getAttribute("loginMemberId") != null) { // 로그인중 회원가입 페이지로 들어올 경우
		response.sendRedirect(request.getContextPath()+"/index.jsp");
		return;
	}
	request.setCharacterEncoding("utf-8");
	String memberEmail = request.getParameter("memberEmail");
	String memberPw = request.getParameter("memberPw");
	String memberName = request.getParameter("memberName");
	
	MemberDao memberDao = new MemberDao();
	Member member = memberDao.selectMemberEmailCk(memberEmail);
	if(member != null){
		System.out.println("이미 사용중인 이메일 입니다.");
		response.sendRedirect(request.getContextPath()+"/member/signUp.jsp");
		return;
	}
	
	Member paraMember = new Member();
	paraMember.setMemberEmail(memberEmail);
	paraMember.setMemberPw(memberPw);
	paraMember.setMemberName(memberName);
	memberDao.insertMember(paraMember);
	
	response.sendRedirect(request.getContextPath()+"/index.jsp");
%>