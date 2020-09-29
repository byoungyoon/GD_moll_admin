<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeList</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<%
	// 사용자가 관리자 일때만 들어올수 있는 사이트 다른 이용자 일 경우 return하여 mollIndex로
	if(session.getAttribute("adminLogin") == null){
		response.sendRedirect("/moll_admin/login/login.jsp");
		return;
	}

	// 메서드 값을 받아올 list 선언
	ArrayList<Member> list = new ArrayList<Member>();
	
	MemberDao memberDao = new MemberDao();
	list = memberDao.selectMemberList();
%>
	<!-- 메인 폼 테이블 -->
	<div class="container">
		<jsp:include page="/inc/menu.jsp"></jsp:include>
		<br>
 		<h3>가입자 목록</h3>
 		
 		<table class="table table-dark">
 			<thead>
	 			<tr>
	 				<th>member_email</th>
	 				<th>member_name</th>
	 				<th>member_date</th>
	 			</tr>
			</thead>
	 			
	 		<tbody>
	 			<%
					for(Member m : list){
 					%>
	 					<tr>
	 						<td><%=m.getMemberEmail() %></td>
	 						<td><%=m.getMemberName() %></td>
	 						<td><%=m.getMemberDate() %></td>
	 					</tr>
	 				<%
					}
 				%>
	 		</tbody>
 		</table>
 	</div>
</body>
</html>