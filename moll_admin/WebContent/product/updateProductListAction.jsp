<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<%
	request.setCharacterEncoding("UTF-8");

	String productName = request.getParameter("productName");
	String productContent = request.getParameter("productContent");
	int productPrice = Integer.parseInt(request.getParameter("productPrice"));
	int productId = Integer.parseInt(request.getParameter("productId"));
	
	Product paramProduct = new Product();
	paramProduct.setProductName(productName);
	paramProduct.setProductContent(productContent);
	paramProduct.setProductId(productId);
	paramProduct.setProductPrice(productPrice);
	
	ProductDao productDao = new ProductDao();
	
	productDao.updateProductList(paramProduct);
	
	response.sendRedirect(request.getContextPath()+"/product/productOne.jsp?productId="+productId);
%>
