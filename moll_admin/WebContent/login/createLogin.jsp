<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>createLogin.jsp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<!--
	 회원가입하는 페이지입니다
 -->
</head>
<body>
<%
	// 만약 로그인을 성공했을시 생기는 세션이 있을 경우 mollIndex로 보낸다.
	if(session.getAttribute("adminLogin") != null || session.getAttribute("memeberLogin") != null){
		response.sendRedirect("/moll/mollIndex.jsp");
		return;
	}
	
	String ck = request.getParameter("ck");
	if(ck == null){
		ck = "";
	}
%>
	
	<div class="container">
		<br><br><br>
		<!-- 사이트 이름 -->
		<a href="/moll/mollIndex.jsp" class="text-dark"><h1 class="font-weight-bold & text-center">Goodee Shop</h1></a>
		<br><br><br><br><br>
		<!-- 한 줄을 12개로 나누는 클래스를 사용 -->
		<form method="post" action="<%=request.getContextPath()%>/login/loginEmailCk.jsp">
			<div class="row">
				<!-- 12개 나누었을때 3개를 생략 -->
				<div class="col-sm-3"></div>
				<div class="col-sm-6">
					<div class="input-group mb-3 input-group-lg">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fa fa-user" style="font-size:30px"></i></span>
						</div>
						<input type="text" class="form-control" placeholder="Create Email" name="createEmail" value="" style="font-size:30px">
					</div>
				</div>
			</div>
			
		<!--아이디가 중복이나 "" 값일 경우 출력 -->
		<div class="row">
			<div class="col-sm-3"></div>
			<%
				if(ck.equals("idFalse")){
				%>
					<div class="col-sm-6 text-right text-danger">
						This email cannot be used
					</div>
				<%
				}
			%>
		</div>
		
		<!-- 비닐번호 입력란 -->
		<div class="row">
			<!-- 12개 나누었을때 3개를 생략 -->
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<div class="input-group mb-3 input-group-lg">
					<div class="input-group-append">
						<span class="input-group-text"><i class='fas fa-key' style='font-size:30px'></i></span>
					</div>
					<input type="password" class="form-control" placeholder="******" name="createPw" value="" style='font-size:30px'>
				</div>
			</div>
		</div>
		
		<!-- 비닐번호가 ""값일 경우 출력 -->
		<div class="row">
			<div class="col-sm-3"></div>
			<%
				if(ck.equals("pwFalse")){
				%>
					<div class="col-sm-6 text-right text-danger">
						Password is empty
					</div>
				<%
				}
			%>
		</div>
		
		<!-- 이름 입력란 -->
		<div class="row">
			<!-- 12개 나누었을때 3개를 생략 -->
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<div class="input-group mb-3 input-group-lg">
					<div class="input-group-append">
						<span class="input-group-text"><i class='fas fa-key' style='font-size:30px'></i></span>
					</div>
					<input type="text" class="form-control" placeholder="Create Name" name="createName" value="" style='font-size:30px'>
				</div>
			</div>
		</div>
		
		<!-- 이름이 ""값일 경우 출력 -->
		<div class="row">
			<div class="col-sm-3"></div>
			<%
				if(ck.equals("nameFalse")){
				%>
					<div class="col-sm-6 text-right text-danger">
						Name is empty
					</div>
				<%
				}
			%>
		</div>
		
		<!-- 로그인 폼으로 돌아가는것과 회원가입 -->
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6 text-right">
				<a href="<%=request.getContextPath() %>/login/login.jsp" class="btn btn-outline-secondary">이전</a>
				<button type="submit" class="btn btn-outline-secondary">회원가입</button>
			</div>
			<div class="col-sm-3"></div>
		</div>
		
		</form>
	</div>

</body>
</html>
























