<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<%
	int size = 1024 * 1024 *100; // 100M
	String path = application.getRealPath("image"); // D:\javawork\mall-admin\WebContent\images
	MultipartRequest multi = new MultipartRequest(request, path, size, "utf-8", new DefaultFileRenamePolicy());
	
	int categoryId = Integer.parseInt(multi.getParameter("categoryId"));

	String categoryPic = multi.getFilesystemName("categoryPic");
	
	System.out.println(categoryId);
	System.out.println(categoryPic);

	Category category = new Category();
	category.setCategoryId(categoryId);
	category.setCategoryPic(categoryPic);
	
	CategoryDao categoryDao = new CategoryDao();
	categoryDao.updateCategoryImage(category);

	response.sendRedirect(request.getContextPath()+"/category/categoryOne.jsp?categoryId="+categoryId);
%>
