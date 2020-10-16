<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>index.jsp</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- 

	로그인이 성공했을 경우 맨 처음 들어오는 페이지
	
 -->
</head>
<body>
	<%
		if(session.getAttribute("adminLogin") == null){
			response.sendRedirect("/moll_admin/login/login.jsp");
			return;
		}
	%>
	<div class="container">
		<div>
			<jsp:include page="/inc/menu.jsp"></jsp:include>
		</div>		
			<br>
			
	 	<h3>관리자 페이지</h3>
	 		
	 	<div class="row">
	 		<div class="col-sm-6">
	 			<img src="<%=request.getContextPath()%>/image/12.jfif" width="470px">
			</div>
			
			<div class="col-sm-6 text-left">
				<ul>
					<li>이 프로젝트는 한달만에 모델1 방식으로 제작한 쇼핑물 프로젝트이다. <br> 크게는 관리자와 사용자로 나눌 수 있다.</li>
					<br>
					<li>먼저 메인 홈페이지에서 사용자표시를 누를경우 관리자는 관리자페이지로 사용자는 사용자 페이지로 간다.</li>
					<br>
					<li>관리자 페이지에 대해 설명하면 관리자는 카테고리, 상품, 공지 등을 관리를 할 수 있고, 전체적인 틀을 확인 할 수 있다. 이 중 추가와 삭제 수정이 자유로운 곳은 카테고리, 상품, 공지이다. 그 이유는 
						 장바구니와 구매 목록을 관리자가 삭제하는 것은 내가 생각하기로 이상하다 생각하여 제외하였다.
					</li>
					<br>
					<li>
						다음은 사용자 페이지에 대한 특징이다. 사용자는 구디 메인 홈에서 상품에 대해 구매를 할 수 있으며, 장바구니와 마이페이지를 가진다.
						 마이페이지의 내용으로는 자신의 신상과 구매목록에 대해서 확인할 수 있으며, 장바구니는 자신의 원하는 상품을 담을 경우 확인 할 수 있다.
					</li>
				</ul>
			</div>
		</div>
	</div>
		
</body>
</html>