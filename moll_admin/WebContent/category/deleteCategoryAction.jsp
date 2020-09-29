<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%
	if(session.getAttribute("adminLogin") == null){
		response.sendRedirect("/moll/mollIndex.jsp");
		return;
	}

	request.setCharacterEncoding("UTF-8");
	
	int categoryId = Integer.parseInt(request.getParameter("categoryId"));
	
	Category paramCategory = new Category();
	paramCategory.setCategoryId(categoryId);
	
	CategoryDao categoryDao = new CategoryDao();
	categoryDao.deleteCategory(paramCategory);
	
	response.sendRedirect(request.getContextPath()+"/category/categoryList.jsp");
%>