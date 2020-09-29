<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<%
	// 인코딩 형식
	request.setCharacterEncoding("UTF-8");

	// 받아오는 값 email, 패스워드, 이름
	String createEmail = request.getParameter("createEmail");
	String createPw = request.getParameter("createPw");
	String createName = request.getParameter("createName");
	
	Member paramMember = new Member();
	paramMember.setMemberEmail(createEmail);
	
	MemberDao memberDao = new MemberDao();
	Member member = memberDao.selectMemberCk(paramMember);
	
	// 아이디 중복 검사
	if(member != null || createEmail.equals("")){
		response.sendRedirect(request.getContextPath()+"/login/createLogin.jsp?ck=idFalse");
		return;
	}
	
	// 비닐번호를 입력 하였는지 검사
	else if(createPw.equals("")){
		response.sendRedirect(request.getContextPath()+"/login/createLogin.jsp?ck=pwFalse");
		return;
	}
	
	// 이름을 입력 하였는지 검사
	else if(createName.equals("")){
		response.sendRedirect(request.getContextPath()+"/login/createLogin.jsp?ck=nameFalse");
		return;
	}
	
	paramMember.setMemberPw(createPw);
	paramMember.setMemberName(createName);
	
	memberDao.insertMember(paramMember);
	
	response.sendRedirect(request.getContextPath()+"/login/login.jsp");
%>
