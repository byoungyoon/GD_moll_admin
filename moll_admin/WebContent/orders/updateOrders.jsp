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
 	<form method="post" action="<%=request.getContextPath() %>/orders/updateOrdersAction.jsp">
	 	<table class="table table-dark">
	 		<tr>
	 			<th>orders_id</th>
	 			<td><%=oap.orders.getOrdersId() %></td>
	 			<td><input type="hidden" name="ordersId" value=<%=oap.orders.getOrdersId() %>></td>
	 		<tr>
	 		
	 		<tr>
	 			<th>product_name</th>
	 			<td><%=oap.product.getProductName() %></td>
	 		<tr>
	 		
	 		<tr>
	 			<th>orders_amount</th>
	 			<td><input type="text" name="ordersAmount" value=<%=oap.orders.getOrdersAmount() %>></td>
	 		<tr>
	 		
	 		<tr>
	 			<th>orders_price</th>
	 			<td><input type="text" name="ordersPrice" value=<%=oap.orders.getOrdersPrice() %>></td>
	 		<tr>
	 		
	 		<tr>
	 			<th>memeber_email</th>
	 			<td><%=oap.orders.getMemberEmail() %></td>
	 		<tr>
	 		
	 		<tr>
	 			<th>orders_addr</th>
	 			<td><input type="text" name="ordersAddr" value=<%=oap.orders.getOrdersAddr() %>></td>
	 		<tr>
	 		
	 		<tr>
	 			<th>orders_state</th>
	 			<td>
	 				<select name="ordersState">
	 					<option value="결제완료">결제왼료</option>
	 					<option value="배송준비종">배송준비중</option>
	 					<option value="배송중">배송중</option>
	 					<option value="주문취소">주문취소</option>
	 				</select>
	 			</td>
	 		<tr>
	 		
	 		<tr>
	 			<th>orders_date</th>
	 			<td><%=oap.orders.getOrdersDate() %></td>
	 		<tr>
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













