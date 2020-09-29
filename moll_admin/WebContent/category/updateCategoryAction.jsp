<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%
	//관리자가 로그인 했을때만 관리자 페이지 접근 가능
	if(session.getAttribute("adminLogin") == null){
		response.sendRedirect("/moll_admin/login/login.jsp");
		return;
	}

	// 인코딩 형식
	request.setCharacterEncoding("UTF-8");
	
	String categoryName = request.getParameter("categoryName");
	String categoryCk = request.getParameter("categoryCk");
	int categoryId = Integer.parseInt(request.getParameter("categoryId"));
	
	
	Category paramCategory = new Category();
	paramCategory.setCategoryName(categoryName);
	paramCategory.setCategoryId(categoryId);
	paramCategory.setCategoryCk(categoryCk);
	
	CategoryDao categoryDao = new CategoryDao();
	categoryDao.updateCategory(paramCategory);
	
	response.sendRedirect("/moll_admin/category/categoryList.jsp?categortId=" +categoryId);
%>