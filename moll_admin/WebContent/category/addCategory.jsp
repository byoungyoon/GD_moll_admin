<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<%
	// 관리자가 로그인 했을때만 관리자 페이지 접근 가능
	if(session.getAttribute("adminLogin") == null){
		response.sendRedirect("/moll/mollIndex.jsp");
		return;
	}
%>
	
	<div class="container">
		<jsp:include page="/inc/menu.jsp"></jsp:include>
		<br>
			
 		 <h3>카테고리 입력</h3>
 		 <form method="post" action="<%=request.getContextPath() %>/category/addCategoryAction.jsp">
	 		 <table class="table table-dark">
	 		 	<tr>
	 		 		<th>category_name</th>
	 		 		<td><input type="text" name="categoryName"></td>
	 		 	</tr>
	 		 	
	 		 	<tr>
	 		 		<th>category_ck</th>
	 		 		<td>
	 		 			<select name="categoryCk">
	 		 				<option value="Y">카테고리 추천</option>
	 		 				<option value="N">카테고리 추천안함</option>
	 		 			</select>
	 		 		</td>
	 		 	</tr>
	 		 </table>
	 		 <div class="row">
	 		 	<div class="col-sm-12 text-right">
	 		 		<button type="submit" class="btn btn-dark">카테고리 추가</button>
	 		 	</div>
	 		 </div>
 		 </form>
	</div>
	
	
</body>
</html>