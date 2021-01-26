<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>productOne.jsp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<%
	// 관리자만 접근 가능
	if(session.getAttribute("adminLogin") == null){
		response.sendRedirect(request.getContextPath()+"/login/login.jsp");
		return;
	}
	// 제품이름 가져옴
	int productId = Integer.parseInt(request.getParameter("productId"));
	
	CategoryAndProduct paramCap = new CategoryAndProduct();
	paramCap.product = new Product();
	paramCap.category = new Category();
	paramCap.product.setProductId(productId);
	
	CategoryAndProduct cap = new ProductDao().selectProductOne(paramCap);
%>
	<div class="container">
		<jsp:include page="/inc/menu.jsp"></jsp:include>
		<br>
		<h3>상품 상세보기</h3>
	
		<table class="table table-dark">
			<tr>
				<th>product_id</th>
				<td><%=cap.product.getProductId() %></td>
			</tr>
			
			<tr>
				<th>category_name</th>
				<td><%=cap.category.getCategoryName() %></td>
			</tr>
			
			<tr>
				<th>product_name</th>
				<td><%=cap.product.getProductName() %></td>
			</tr>
			
			<tr>
				<th>product_content</th>
				<td><%=cap.product.getProductContent() %></td>
			</tr>
			
			<tr>
				<th>product_price</th>
				<td><%=cap.product.getProductPrice() %></td>
			</tr>
			
			<tr>
				<th>product_soldout</th>
				<td><%=cap.product.getProductSoldout() %></td>
			</tr>
			
			<tr>
				<th>product_pic</th>
				<td><img src="<%=request.getContextPath() %>/image/<%=cap.product.getProductPic() %>" width="700px"></td>
			</tr>
		</table>
		
		<div class="row">
			<div class="col-sm-12 text-right">
				<a href="<%=request.getContextPath() %>/product/updateProductList.jsp?productId=<%=productId %>" class="btn btn-dark">수정</a>
				<a href="<%=request.getContextPath() %>/product/deleteProductAction.jsp?productId=<%=productId %>" class="btn btn-dark">삭제</a>
			</div>
		</div>
	</div>
</body>
</html>
























