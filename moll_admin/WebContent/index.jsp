<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>index.jsp</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- 

	로그인이 성공했을 경우 맨 처음 들어오는 페이지
	
 -->
</head>
<body>
	<%
		if(session.getAttribute("adminLogin") == null){
			response.sendRedirect("/moll_admin/login/login.jsp");
			return;
		}
	%>
	<div class="container">
		<div>
			<jsp:include page="/inc/menu.jsp"></jsp:include>
		</div>		
			<br>
			
	 	<h3>관리자 페이지</h3>
	 		
	 	<div class="row">
	 		<div class="col-sm-8">
	 			<img src="<%=request.getContextPath()%>/image/12.jfif">
			</div>
		</div>
	</div>
		
</body>
</html>