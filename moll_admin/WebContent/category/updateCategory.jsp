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
		
		<h3>카테고리 상세보기</h3>

		<form method="post" action="<%=request.getContextPath() %>/category/updateCategoryAction.jsp">
			<table class="table table-dark">
				<tr>
					<th>category_id</th>
					<td><%=category.getCategoryId() %></td>
					<td><input type="hidden" name="categoryId" value=<%=category.getCategoryId() %>></td>
				</tr>
				
				<tr>
					<th>category_name</th>
					<td><input type="text" name="categoryName" value=<%=category.getCategoryName() %>></td>
				</tr>
				
				<tr>
					<th>category_ck</th>
					<td>
						<select name="categoryCk" class="text-dark">
							<option value="Y">Y</option>
							<option value="N">N</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<th>category_pic</th>
					<td>
						<img src="<%=request.getContextPath() %>/image/<%=category.getCategoryPic() %>" width="700px">
						<a href="<%=request.getContextPath() %>/category/modifyCategoryPic.jsp?categoryPic=<%=category.getCategoryPic() %>&categoryId=<%=category.getCategoryId() %>">이미지 수정</a>
					</td>
				</tr>
			</table>
			<div class="row">
				<div class="col-sm-12 text-right">
					<button type="submit" class="btn btn-dark">수정</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>


































