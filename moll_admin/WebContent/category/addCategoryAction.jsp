<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>

<%
	//관리자가 로그인 했을때만 관리자 페이지 접근 가능
	if(session.getAttribute("adminLogin") == null){
		response.sendRedirect("/moll/mollIndex.jsp");
		return;
	}

	request.setCharacterEncoding("UTF-8");
	
	String categoryName = request.getParameter("categoryName");
	String categoryCk = request.getParameter("categoryCk");
	
	// 객체 선언 후 caegoryName 적용
	Category paramCategory = new Category();
	paramCategory.setCategoryName(categoryName);
	paramCategory.setCategoryCk(categoryCk);
	
	// void 메서드 불러옴
	CategoryDao categoryDao = new CategoryDao();
	categoryDao.insertCategory(paramCategory);
	
	response.sendRedirect(request.getContextPath()+"/category/categoryList.jsp");
%>