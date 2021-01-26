<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberOne</title>
</head>
<body>
	<%
		if(session.getAttribute("adminLogin") == null){
			response.sendRedirect(request.getContextPath()+"/login/login.jsp");
			return;
		}
	%>
	<div class="container">
		<div>
			<jsp:include page="/inc/menu.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>