<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ordersList</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- 

	orders리스트의 메인 화면입니다

 -->
</head>
<body>
<%
	//사용자가 관리자 일때만 들어올수 있는 사이트 다른 이용자 일 경우 return하여 mollIndex로
 	if(session.getAttribute("adminLogin") == null){
 		response.sendRedirect("/moll_admin/login/login.jsp");
 		return;
 	}
  	request.setCharacterEncoding("UTF-8");
 	
 	// 판매여부에 대해서 가져온다
 	String ordersState = request.getParameter("ordersState");
 	if(ordersState == null) ordersState = "";
 		
 	//객체 선언
 	OrdersDao ordersDao = new OrdersDao();
 	ArrayList<OrdersAndProduct> list = new ArrayList<OrdersAndProduct>();
 		
 	//System.out.println(ordersState);
 		
 	// 아무것도 선택을 안 했을시 selectOrdersList로 선택했을경우 selectOrdersListBystate로 감
 	if(ordersState.equals("")){
 		list = ordersDao.selectOrdersList();
 	}
 	else{
 		list = ordersDao.selectOrdersListByState(ordersState);
 	}
 %>
	<div class="container">
		<jsp:include page="/inc/menu.jsp"></jsp:include>
		<br>
 		<h3>주문 목록</h3>
 		
 		<form method="post" action="/moll_admin/orders/ordersList.jsp"> 
 			<!-- 선택 항목 -->
 			<div class="row">
 				<div class="col-sm-3">
		 			<select name="ordersState">
		 				<option value="">선택</option>
		 				<option value="결제완료">결제완료</option>
		 				<option value="배송준비중">배송준비중</option>
		 				<option value="배송완료">배송완료</option>
		 				<option value="주문취소">주문취소</option>
		 			</select>
		 			<button type="submit" class="btn btn-dark">선택</button>
	 			</div>
 			</div>
 		</form>
 		
 		<br>
 		<!--  메인 테이블  -->
	 	<table class="table table-dark">
	 		<thead>
	 			<tr>
	 				<th>orders_id</th>
	 				<th>product_name</th>
	 				<th>orders_amount</th>
	 				<th>orders_price</th>
	 				<th>memeber_email</th>
					<th>orders_addr</th>
 					<th>orders_state</th>
	 				<th>orders_date</th>
	 			</tr>
			</thead>
	 			
	 		<tbody>
	 			<%
					for(OrdersAndProduct oap : list){
 					%>
	 					<tr>
	 						<td><a href="<%=request.getContextPath() %>/orders/ordersOne.jsp?ordersId=<%=oap.orders.getOrdersId() %>"><%=oap.orders.getOrdersId() %></a></td>
	 						<td><%=oap.product.getProductName() %></td>
	 						<td><%=oap.orders.getOrdersAmount() %></td>
	 						<td><%=oap.orders.getOrdersPrice() %></td>
	 						<td><%=oap.orders.getMemberEmail() %></td>
	 						<td><%=oap.orders.getOrdersAddr() %></td>
	 						<td><%=oap.orders.getOrdersState() %></td>
	 						<td><%=oap.orders.getOrdersDate() %></td>
	 					</tr>
	 				<%
					}
 				%>
	 		</tbody>
	 	</table>
	</div>
	
</body>
</html>