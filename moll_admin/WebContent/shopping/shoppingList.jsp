<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>shoppingList.jsp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<%
	//로그인 세션값이 없을 경우 login 페이지로 돌아감
	if(session.getAttribute("adminLogin") == null){
		response.sendRedirect(request.getContextPath()+"/login/login.jsp");
		return;
	}

	ArrayList<Shopping> list = new ArrayList<Shopping>();
	ShoppingDao shoppingDao = new ShoppingDao();
	
	list = shoppingDao.selectShoppingList();
%>
	<div class="container">
		<jsp:include page="/inc/menu.jsp"></jsp:include>
		<br>
		<h3>상품 목록</h3>
		
		<table class="table table-dark">
			<thead>
				<tr>
					<th>shopping_id</th>
					<th>member_email</th>
					<th>product_id</th>
				</tr>
			</thead>
			
			<tbody>
				<%
					for(Shopping s : list){
					%>
						<tr>
							<td><%=s.getShoppingId() %></td>
							<td><%=s.getMemberEmail() %></td>
							<td><%=s.getProductId() %></td>
						</tr>
					<%
					}
				%>
			</tbody>
		</table>
	</div>
</body>
</html>




















