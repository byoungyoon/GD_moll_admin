<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%
	request.setCharacterEncoding("UTF-8");

	int ordersId = Integer.parseInt(request.getParameter("ordersId"));
	int ordersAmount = Integer.parseInt(request.getParameter("ordersAmount"));
	int ordersPrice = Integer.parseInt(request.getParameter("ordersPrice"));
	String ordersAddr = request.getParameter("ordersAddr");
	String ordersState = request.getParameter("ordersState");
	
	Orders paramOrders = new Orders();
	paramOrders.setOrdersId(ordersId);
	paramOrders.setOrdersAmount(ordersAmount);
	paramOrders.setOrdersPrice(ordersPrice);
	paramOrders.setOrdersAddr(ordersAddr);
	paramOrders.setOrdersState(ordersState);
	
	OrdersDao ordersDao = new OrdersDao();
	ordersDao.updateOrdersList(paramOrders);
	
	response.sendRedirect(request.getContextPath()+"/orders/ordersOne.jsp?ordersId=" +ordersId);
%>