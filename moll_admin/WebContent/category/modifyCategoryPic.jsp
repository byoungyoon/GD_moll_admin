<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modifyCategoryPic</title>
</head>
<body>
	<%
		int categoryId = Integer.parseInt(request.getParameter("categoryId"));
	
		System.out.println(categoryId);
	%>
	<h1>상품 이미지 수정</h1>
	<form action="/moll_admin/category/modufyCategoryAction.jsp" method="post" enctype="multipart/form-data">
		<input type="hidden" name="categoryId" value="<%=categoryId%>">
		<div>
			이미지 선택 :
			<input type="file" name="categoryPic">
		</div>
		<div>
			<button type="submit">이미지 수정</button>
		</div>
	</form>
</body>
</html>
