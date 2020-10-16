<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<%
	// 관리자가 로그인 했을때만 관리자 페이지 접근 가능
	if(session.getAttribute("adminLogin") == null){
		response.sendRedirect("/moll/mollIndex.jsp");
		return;
	}
%>
<script>
	$(document).ready(function() {
		$("#btn").click(function(){
			if($("#categoryName").val().length < 1){
				$("#err").text("카테고리 이름을 입력해 주세요");
				return
			}
			$("#addCategoryForm").submit();
		});
	});
</script>
	
	<div class="container">
		<jsp:include page="/inc/menu.jsp"></jsp:include>
		<br>
			
 		 <h3>카테고리 입력</h3>
 		 <form id="addCategoryForm" method="post" action="<%=request.getContextPath() %>/category/addCategoryAction.jsp">
	 		 <table class="table table-dark">
	 		 	<tr>
	 		 		<th>category_name</th>
	 		 		<td><input type="text" id="categoryName" name="categoryName"></td>
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
	 		 		<button type="button" id="btn" class="btn btn-dark">카테고리 추가</button>
	 		 	</div>
	 		 </div>
	 		 
	 		 <div class="row">
	 		 	<div id="err" class="col-sm-12 text-right text-danger">
	 		 	</div>
	 		 </div>
 		 </form>
	</div>
	
	
</body>
</html>