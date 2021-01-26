<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addProduct.jsp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<%
	if(session.getAttribute("adminLogin") == null){
		response.sendRedirect(request.getContextPath()+"/login/login.jsp");
		return;
	}
		
	CategoryDao categoryDao = new CategoryDao();
	ArrayList<Category> categoryList = categoryDao.selectCategoryList();
%>
<script>
	$(document).ready(function() {
		$("#btn").click(function() {
			if($("#categoryId").val() == ""){
				$("#err").text("카테고리 이름을 선택하여 주세요");
				return;
			} else if($("#productName").val().length < 1){
				$("#err").text("상품의 이름을 입력하여 주세요");
				return;
			}
			$("#addProductForm").submit();
		});
	});
</script>

	<div class="container">
		<jsp:include page="/inc/menu.jsp"></jsp:include>
		<br>
		<form id="addProductForm" method="post" action="<%=request.getContextPath() %>/product/addProductAction.jsp">
			<div class="row">	
				<div class="col-sm-3">
					<h3>상품 추가</h3>
				</div>
			</div>
			
			<br>
			
			<table class="table table-dark">
				<tr>
					<td>category_name</td>
					<td>
						<select name="categoryId" id="categoryId">
							<option value="">선택없음</option>
						<%
							for(Category c : categoryList){
							%>
								<option value=<%=c.getCategoryId() %>><%=c.getCategoryName() %></option>
							<%
							}
						%>
						</select>
					</td>			
				</tr>
				
				<tr>
					<td>product_name</td>
					<td><input type="text" name= "productName" id="productName"></td>			
				</tr>
				
				<tr>
					<td>product_content</td>
					<td>
						<textarea rows="5" cols="80" name="productContent"></textarea>
					</td>			
				</tr>
				
				<tr>
					<td>product_price</td>
					<td><input type="text" name= "productPrice" value="0"></td>			
				</tr>
				
				<tr>
					<td>product_soldout</td>
					<td>
						품절<input type="radio" name="productSoldout" value="Y" checked="checked"> &nbsp;&nbsp;&nbsp;
						품절아님<input type="radio" name="productSoldout" value="N">
					</td>			
				</tr>
			</table>
			<div class="row">
				<div class="col-sm-12 text-right">
					<button type="button" id="btn" class="btn btn-dark">추가</button>
				</div>
			</div>
			
			<div class="row">
				<div id="err" class="col-sm-12 text-right text-danger">
				</div>
			</div>
		</form>
	</div>
</body>
</html>










