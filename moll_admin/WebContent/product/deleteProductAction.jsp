<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<%
	request.setCharacterEncoding("UTF-8");

	int productId = Integer.parseInt(request.getParameter("productId"));
	
	Product paramProduct = new Product();
	paramProduct.setProductId(productId);
	
	ProductDao productDao = new ProductDao();
	productDao.deleteProductList(paramProduct);
	
	response.sendRedirect(request.getContextPath()+"/product/productList.jsp");
%>
