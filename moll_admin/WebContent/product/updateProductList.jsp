<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
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
	if(session.getAttribute("adminLogin") == null){
		response.sendRedirect("/moll_admin/login/login.jsp");
		return;
	}	
	
	int productId = Integer.parseInt(request.getParameter("productId"));
	
	CategoryAndProduct paramCap = new CategoryAndProduct();
	paramCap.product = new Product();
	paramCap.category = new Category();
	paramCap.product.setProductId(productId);
	
	CategoryAndProduct cap = new ProductDao().selectProductOne(paramCap);
	
	CategoryDao categoryDao = new CategoryDao();
	ArrayList<Category> list = new ArrayList<Category>();
	list = categoryDao.selectCategoryList();
%>
	<div class="container">
		<jsp:include page="/inc/menu.jsp"></jsp:include>
		<br>
		<h3>상품 상세보기</h3>
		<form method="post" action="<%=request.getContextPath() %>/product/updateProductListAction.jsp">
			<table class="table table-dark">
				<tr>
					<th>product_id</th>
					<td><%=cap.product.getProductId() %></td>
					<td><input type="hidden" name="productId" value=<%=productId %>></td>
				</tr>
				
				<tr>
					<th>categort_name</th>
					<td>
						<select name="categoryName">
							<option value=<%=cap.category.getCategoryName() %>><%=cap.category.getCategoryName() %></option>
							<%
								for(Category c : list){
									if(c.getCategoryName().equals(cap.category.getCategoryName())){
										continue;
									}
								%>
									<option value=<%=c.getCategoryName() %>><%=c.getCategoryName() %></option>
								<%
								}
							%>
						</select>
					</td>
				</tr>
				
				<tr>
					<th>product_name</th>
					<td><input type="text" name="productName" value=<%=cap.product.getProductName() %>></td>
				</tr>
				
				<tr>
					<th>product_content</th>
					<td><textarea name="productContent" rows="5" cols="80" value=<%=cap.product.getProductContent() %>><%=cap.product.getProductContent() %></textarea></td>
				</tr>
				
				<tr>
					<th>product_price</th>
					<td><input type="text" name="productPrice" value=<%=cap.product.getProductPrice() %>></td>
				</tr>
				
				<tr>
					<th>product_soldout</th>
					<td>
						<%
							if(cap.product.getProductSoldout().equals("Y")){
							%>
								<a href="<%=request.getContextPath() %>/product/productSoldoutAction.jsp?productId=<%=cap.product.getProductId()%>&productSoldout=<%=cap.product.getProductSoldout()%>">[품절]</a>
							<% 
							}
							else{
							%>
								<a href="<%=request.getContextPath() %>/product/productSoldoutAction.jsp?productId=<%=cap.product.getProductId()%>&productSoldout=<%=cap.product.getProductSoldout()%>">[판매중]</a>
							<% 	
							}
						%>
					</td>
				</tr>
				
				<tr>
					<th>product_pic</th>
					<td>
						<img src="<%=request.getContextPath() %>/image/<%=cap.product.getProductPic() %>" width="700px">
						<a href="<%=request.getContextPath() %>/product/modifyProdcutPic.jsp?productPic=<%=cap.product.getProductPic() %>&productId=<%=cap.product.getProductId() %>">이미지 수정</a>
					</td>

				</tr>
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
























