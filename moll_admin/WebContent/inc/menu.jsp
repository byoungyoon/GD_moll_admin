<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 
	메뉴를 지정한 곳
 -->
 
 	<div class="row">
		<!-- 12분할 중 3개를 제목 -->	
		<div class="col-sm-3"><a href="<%=request.getContextPath()%>/index.jsp" class="text-dark"><h1>Goodee Shop</h1></a></div>
		<div class="col-sm-9">
			<div class="text-right" style="margin-top:10px"><a href="<%=request.getContextPath()%>/login/logoutAction.jsp" class="btn btn-dark">로그아웃</a></div>
		</div>
	</div>
		<!-- flex 브투스트랩 , reverse반대로, bg 배경, text 색깔 -->
  
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<a class="navbar-brand btn btn-outline-secondary" href="/moll_admin/index.jsp">관리자 홈</a>
		<ul class="navbar-nav">
			<li class="nav-item">
				<a class="nav-link btn btn-outline-secondary" href="<%=request.getContextPath()%>/category/categoryList.jsp">카테고리 관리</a>
			</li>
			<li class="nav-item">
				<a class="nav-link btn btn-outline-secondary" href="<%=request.getContextPath()%>/product/productList.jsp">상품 관리</a>
			</li>
			<li class="nav-item">
				<a class="nav-link btn btn-outline-secondary" href="<%=request.getContextPath()%>/orders/ordersList.jsp">주문 관리</a>
			</li>
			<li class="nav-item">
				<a class="nav-link btn btn-outline-secondary" href="<%=request.getContextPath()%>/notice/noticeList.jsp">공지 관리</a>
			</li>
			<li class="nav-item">
				<a class="nav-link btn btn-outline-secondary" href="<%=request.getContextPath()%>/shopping/shoppingList.jsp">장바구니 관리</a>
			</li>
			<li class="nav-item">
				<a class="nav-link btn btn-outline-secondary" href="<%=request.getContextPath()%>/member/memberList.jsp">회원 관리</a>
			</li>
		</ul>
	</nav>
