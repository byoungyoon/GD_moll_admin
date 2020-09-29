<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login.jsp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<!-- 
	로그인 시작 페이지
	
	로그인이 맞을 경우 index.jsp로 틀릴경우 이 페이지로 돌아온다.
 -->
</head>
<body>
<%
	// 세션 입력이 되어있다면 login.jsp는 생략된다
	if(session.getAttribute("adminLogin") != null || session.getAttribute("memberLogin") != null){
		System.out.println("이미 로그인이 되어 있습니다");
		response.sendRedirect("/moll/mollIndex.jsp");
		return;
	}
	
	// 인코딩 형식
	request.setCharacterEncoding("UTF-8");
	
	// 에러 값이 있을경우 err에 데이터가 받아짐
	String err = request.getParameter("err");
	if(err == null){
		err = "";
	}
%>
	<div class="container">
		<br><br><br>
		<!-- 사이트 이름 -->
		<a href="/moll/mollIndex.jsp" class="text-dark"><h1 class="font-weight-bold & text-center">Goodee Shop</h1></a>
		<br><br><br><br><br>
		<!-- 한 줄을 12개로 나누는 클래스를 사용 -->
		<!-- 나누기 시작   -->
		<div class="row">
			<!-- 12개 나누었을때 3개를 생략 -->
			<div class="col-sm-3"></div>
			
			<!-- 12개 나누었을때 4~10 -->
			<div class="col-sm-6 text-center">
			<form method="post" action="<%=request.getContextPath() %>/login/loginAction.jsp">
				<!-- 로그인 text를 그룹으로 지정하는 클래스 -->
				<div class="input-group mb-3 input-group-lg">
					<div class="input-group-prepend">
						<span class="input-group-text"><i class="fa fa-user" style="font-size:30px"></i></span>
					</div>
					<input type="text" class="form-control" placeholder="UserEmail" name="loginEmail" value="admin@google.com" style="font-size:30px">
				</div>
			
				<!-- 비닐번호 text를 그룹으로 지정하는 클래스 -->
				<div class="input-group mb-3 input-group-lg">
					<div class="input-group-append">
						<span class="input-group-text"><i class='fas fa-key' style='font-size:30px'></i></span>
					</div>
					<input type="password" class="form-control" placeholder="******" name="loginPw" value="1234" style='font-size:30px'>
				</div>
				
			<div class="text-right">
				<a href="<%=request.getContextPath() %>/login/createLogin.jsp" class="btn btn-outline-secondary" style='font-size:25px'>회원가입</a>
				<button type="submit" class="btn btn-outline-secondary" style='font-size:25px'>로그인</button>
			</div>
				<!-- 색깔 발깐색  에러 출력-->
				<div class="text-danger text-right">
					<%=err %>
				</div>
			</form>
			</div>
			
			<div class="col-sm-3"></div>
		</div>
	</div>
</body>							
</html>











