<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	String categoryName = request.getParameter("categoryName");
	String productName = request.getParameter("productName");
	String productContent = request.getParameter("productContent");
	int productPrice = Integer.parseInt(request.getParameter("productPrice"));
	int productId = Integer.parseInt(request.getParameter("productId"));
	
	CategoryAndProduct paramCap = new CategoryAndProduct();
	paramCap.category = new Category();
	paramCap.product = new Product();
	
	paramCap.category.setCategoryName(categoryName);
	paramCap.product.setProductName(productName);
	paramCap.product.setProductContent(productContent);
	paramCap.product.setProductId(productId);
	paramCap.product.setProductPrice(productPrice);
	
	ProductDao productDao = new ProductDao();
	
	productDao.updateProductList(paramCap);
	
	response.sendRedirect(request.getContextPath()+"/product/productOne.jsp?productId="+productId);
%>
