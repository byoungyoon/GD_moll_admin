<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ordersOne.jsp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<%
	//사용자가 관리자 일때만 들어올수 있는 사이트 다른 이용자 일 경우 return하여 mollIndex로
	if(session.getAttribute("adminLogin") == null){
		response.sendRedirect(request.getContextPath()+"/login/login.jsp");
		return;
	}

	request.setCharacterEncoding("UTF-8");

	int ordersId = Integer.parseInt(request.getParameter("ordersId"));
	
	System.out.println(ordersId);
	
	OrdersDao ordersDao = new OrdersDao();
	OrdersAndProduct oap = new OrdersAndProduct();
	oap.orders = new Orders();
	oap.product = new Product();
	oap = ordersDao.selectordersListOne(ordersId);
%>
<div class="container">
	<jsp:include page="/inc/menu.jsp"></jsp:include>
	<br>
 	<h3>주문 목록</h3>
 	
 	<table class="table table-dark">
 		<tr>
 			<th>orders_id</th>
 			<td><%=oap.orders.getOrdersId() %></td>
 		<tr>
 		
 		<tr>
 			<th>product_name</th>
 			<td><%=oap.product.getProductName() %></td>
 		<tr>
 		
 		<tr>
 			<th>orders_amount</th>
 			<td><%=oap.orders.getOrdersAmount() %></td>
 		<tr>
 		
 		<tr>
 			<th>orders_price</th>
 			<td><%=oap.orders.getOrdersPrice() %></td>
 		<tr>
 		
 		<tr>
 			<th>memeber_email</th>
 			<td><%=oap.orders.getMemberEmail() %></td>
 		<tr>
 		
 		<tr>
 			<th>orders_addr</th>
 			<td><%=oap.orders.getOrdersAddr() %></td>
 		<tr>
 		
 		<tr>
 			<th>orders_state</th>
 			<td><%=oap.orders.getOrdersState() %></td>
 		<tr>
 		
 		<tr>
 			<th>orders_date</th>
 			<td><%=oap.orders.getOrdersDate() %></td>
 		<tr>
 	</table>
 	<div class="row">
 		<div class="col-sm-12 text-right">
 			<a href="<%=request.getContextPath() %>/orders/updateOrders.jsp?ordersId=<%=oap.orders.getOrdersId() %>" class="btn btn-dark">수정</a>
 			<a href="<%=request.getContextPath() %>/orders/deleteOrdersAction.jsp?ordersId=<%=oap.orders.getOrdersId() %>" class="btn btn-dark">삭제</a>
 		</div>
 	</div>
</div>
</body>
</html>













