<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>categoryList</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
	<%
		// 관리자가 로그인 했을때만 관리자 페이지 접근 가능
		if(session.getAttribute("adminLogin") == null){
			response.sendRedirect("/moll/mollIndex.jsp");
			return;
		}
	
		CategoryDao categoryDao = new CategoryDao();
		ArrayList<Category> list = new ArrayList<Category>();
		list = categoryDao.selectCategoryList();
	%>
	<div class="container">
		<jsp:include page="/inc/menu.jsp"></jsp:include>
		<br>
		
		<div class="row">
			<div class="col-sm-3">
				<h3>카테고리 목록</h3>
			</div>
			
			<div class="col-sm-9 text-right">
				<a href="<%=request.getContextPath() %>/category/addCategory.jsp" class="btn btn-dark">추가</a>
			</div>
		</div>
	
			<table class="table table-dark">
				<thead>
					<tr>
						<th>category_id</th>
						<th>category_menu</th>
						<th>category_ck</th>
					</tr>
				</thead>
			
				<tbody>
					<%
						for(Category c : list){
						%>
							<tr>
								<td><a href="<%=request.getContextPath() %>/category/categoryOne.jsp?categoryId=<%=c.getCategoryId() %>"><%=c.getCategoryId() %></a></td>
								<td><%=c.getCategoryName() %></td>
								<td><%=c.getCategoryCk() %></td>
							</tr>
						<%
						}
					%>
				</tbody>
			</table>
	</div>
</body>
</html>


































