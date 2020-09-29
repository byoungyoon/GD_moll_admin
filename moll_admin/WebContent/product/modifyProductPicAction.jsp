<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<%
	int size = 1024 * 1024 *100; // 100M
	String path = application.getRealPath("image"); // D:\javawork\mall-admin\WebContent\images
	MultipartRequest multi = new MultipartRequest(request, path, size, "utf-8", new DefaultFileRenamePolicy());
	
	int productId = Integer.parseInt(multi.getParameter("productId"));
	System.out.println(productId+"<--productId"); 
	// System.out.println(multi.getOriginalFileName("productPic")+"<-- 파일원본이름");
	String productPic = multi.getFilesystemName("productPic");
	System.out.println(multi.getFilesystemName("productPic")+"<-- 새로생성된파일이름");
	Product product = new Product();	
	product.setProductId(productId);
	product.setProductPic(productPic);
	
	ProductDao productDao = new ProductDao();
	productDao.updateImage(product);

	response.sendRedirect(request.getContextPath()+"/product/productOne.jsp?productId=" +productId);
%>
