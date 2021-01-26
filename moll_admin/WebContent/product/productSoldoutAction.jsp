<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%
	if(session.getAttribute("adminLogin") == null){
		response.sendRedirect(request.getContextPath()+"/login/login.jsp");
		return;
	}

	int productId = Integer.parseInt(request.getParameter("productId"));
	String productSoldout = request.getParameter("productSoldout");
	
	ProductDao productDao = new ProductDao();
	
	productDao.updateProductSoldout(productId, productSoldout);
	
	response.sendRedirect(request.getContextPath()+"/product/updateProductList.jsp?productId=" + productId);
%>
