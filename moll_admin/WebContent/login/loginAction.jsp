<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%	
	request.setCharacterEncoding("UTF-8");
	
	// 로그인한 id와 pw를 받아온다
	String loginEmail = request.getParameter("loginEmail");
	String loginPw = request.getParameter("loginPw");
	
	// admin 데이터베이스 관련
	Admin paramAdmin = new Admin();
	paramAdmin.setAdminEmail(loginEmail);
	paramAdmin.setAdminPw(loginPw);
	
	AdminDao adminDao = new AdminDao();		
	
	Object ob = null;
	String ses = "";
	
	// 관리자 계정을 입력하였을 때 쇼핑몰 홈페이지로 이동
	// 세션 관리자를 선언하고 그때 ses변수로 Admin을 보낸다
	if(adminDao.selectAdminLogin(paramAdmin) != null){
		Admin admin = adminDao.selectAdminLogin(paramAdmin);
		session.setAttribute("adminLogin", "Admin");
		ob = session.getAttribute("adminLogin");
		ses = (String)ob;
		response.sendRedirect(request.getContextPath()+"/index.jsp?ses=" + ses);
		return;
	}
	
	response.sendRedirect(request.getContextPath() + "/login/login.jsp");
%>



