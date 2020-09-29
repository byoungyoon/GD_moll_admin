<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*"%>
<%@ page import="dao.*"%>
<%
	int ordersId = Integer.parseInt(request.getParameter("ordersId"));

	Orders paramOrders = new Orders();
	paramOrders.setOrdersId(ordersId);
	
	OrdersDao ordersDao = new OrdersDao();
	ordersDao.deleteOrdersList(paramOrders);
	
	response.sendRedirect(request.getContextPath()+"/orders/ordersList.jsp");
%>
