<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>productList.jsp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
	<%
		// 로그인 세션값이 없을 경우 login 페이지로 돌아감
		if(session.getAttribute("adminLogin") == null){
			response.sendRedirect("/moll_admin/login/login.jsp");
			return;
		}
		
		// 인코딩 형식
		request.setCharacterEncoding("UTF-8");
		
		// 카테고리 아이디의 초기값
		int categoryId = 0;
		
		if(request.getParameter("categoryId") != null){
			categoryId = Integer.parseInt(request.getParameter("categoryId"));
		}
		
		// 카테고리 값이 입력 되었을때 productNameList로 리스트를 저장
		// 없을 경우(맨 처음) productList로 리스트를 저장
		ArrayList<Product> productNameList = new ArrayList<Product>();
		ArrayList<Product> productList = new ArrayList<Product>();
		
		// 카테고리 값이 선택이 아닐경우(카테고리 메뉴를 선택하였을 때)
		if(categoryId != 0){
			ProductDao productDao = new ProductDao();
			productNameList = productDao.selectProductName(categoryId);
		}
		else{
			ProductDao productDao = new ProductDao();
			productList = productDao.selectProductList();
		}
		
		// 카테고리 목록 출력을 위한 객체 선언
		CategoryDao categoryDao = new CategoryDao();
		ArrayList<Category> categoryList = new ArrayList<Category>();
		
		// 카테고리 목록을 출력하는 메서드
		categoryList = categoryDao.selectCategoryList();
	%>
	<div class="container">
		<jsp:include page="/inc/menu.jsp"></jsp:include>
		<br>
		<h3>상품 목록</h3>
		
		<form method="post" action="/moll_admin/product/productList.jsp"> 
			<div class="row">
				<div class="col-sm-3">
		 			<!-- 선택 항목 foreach로 option 값 출력 -->
		 			<select name="categoryId">
		 				<!-- 초기 값이 0이므로 선택시 0으로 출력 -->
		 				<option value="0">선택</option>
		 				<%
		 					for(Category c : categoryList){
		 					%>
		 						<option value=<%=c.getCategoryId() %>><%=c.getCategoryName() %></option>
		 					<%
		 					}
		 				%>
		 			</select>
		 			<button type="submit" class="btn btn-dark">선택</button>
	 			</div>
	 				
	 			<div class="col-sm-9 text-right">
	 				<a href="/moll_admin/product/addProduct.jsp" class="btn btn-dark">상품 추가</a>
	 			</div>
 			</div>
 		</form>
 		
 		<br>
 		
 		<table class="table table-dark">
 			<tr>
 				<th>product_id</th>
 				<th>product_name</th>
 				<th>product_price</th>
 				<th>product_soldout</th>
 			</tr>
			<%
			// option값이 선택이거나 초기화면일 경우
			if(categoryId == 0){
				for(Product p : productList){
				%>
					<tr>
						<td><a href="<%=request.getContextPath() %>/product/productOne.jsp?productId=<%=p.getProductId() %>"><%=p.getProductId() %></a></td>
						<td><%=p.getProductName() %></td>
						<td class="text-center"><%=p.getProductPrice() %></td>
						<td class="text-center"><%=p.getProductSoldout() %></td>
					</tr>
				<%
				}
			}
			// option값을 선택하였을 경우
			else{
				for(Product p : productNameList){
					%>
						<tr>
							<td><a href="<%=request.getContextPath() %>/product/productOne.jsp?productId=<%=p.getProductId() %>"><%=p.getProductId() %></a></td>
							<td><%=p.getProductName() %></td>
							<td class="text-center"><%=p.getProductPrice() %></td>
							<td class="text-center"><%=p.getProductSoldout() %></td>
						</tr>
					<%
					}
			}
		%>
		</table>
	</div>
</body>
</html>