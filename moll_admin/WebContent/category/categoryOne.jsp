<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>categoryOne</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
	<%
		// 관리자가 로그인 했을때만 관리자 페이지 접근 가능
		if(session.getAttribute("adminLogin") == null){
			response.sendRedirect("/moll/mollIndex.jsp");
			return;
		}
	
		int categoryId = Integer.parseInt(request.getParameter("categoryId"));
		
		Category paramCategory = new Category();
		paramCategory.setCategoryId(categoryId);
		
		CategoryDao categoryDao = new CategoryDao();
		Category category = categoryDao.selectCategoryOne(paramCategory);
		
	%>
	<div class="container">
		<jsp:include page="/inc/menu.jsp"></jsp:include>
		<br>
		
		<div class="row">
			<div class="col-sm-3">
				<h3>카테고리 상세보기</h3>
			</div>
			
			<div class="col-sm-9 text-right">
				<a href="<%=request.getContextPath() %>/category/updateCategory.jsp?categoryId=<%=category.getCategoryId() %>" class="btn btn-dark">수정</a>
				<a href="<%=request.getContextPath() %>/category/deleteCategoryAction.jsp?categoryId=<%=category.getCategoryId() %>" class="btn btn-dark">삭제</a>
			</div>
		</div>
	
			<table class="table table-dark">
				<tr>
					<th>category_id</th>
					<td><%=category.getCategoryId() %></td>
				</tr>
				
				<tr>
					<th>category_name</th>
					<td><%=category.getCategoryName() %></td>
				</tr>
				
				<tr>
					<th>category_ck</th>
					<td><%=category.getCategoryCk() %></td>
				</tr>
				
				<tr>
					<th>category_pic</th>
					<td><img src="<%=request.getContextPath() %>/image/<%=category.getCategoryPic() %>" width="700px"></td>
				</tr>
				
			</table>
	</div>
</body>
</html>


































