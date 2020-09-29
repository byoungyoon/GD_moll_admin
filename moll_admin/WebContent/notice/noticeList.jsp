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
	//사용자가 관리자 일때만 들어올수 있는 사이트 다른 이용자 일 경우 return하여 mollIndex로
	if(session.getAttribute("adminLogin") == null){
		response.sendRedirect("/moll_admin/login/login.jsp");
		return;
	}
	
	//메서드 값을 받아올 list 선언
	ArrayList<Notice> list = new ArrayList<Notice>();

	NoticeDao noticeDao = new NoticeDao();
	list = noticeDao.selectNoticeList();
%>
	<!-- 메인 폼 테이블 -->
	<div class="container">
		<jsp:include page="/inc/menu.jsp"></jsp:include>
		<br>
 		
 		<div class="row">
 		<div class="col-sm-3">
 			<h3>공지 목록</h3>
 		</div>
			<div class="col-sm-9 text-right">
				<a href="<%=request.getContextPath() %>/notice/addNoticeList.jsp" class="btn btn-dark">공지추가</a>
			</div>
		</div>
		
 		<table class="table table-dark">
 			<thead>
	 			<tr>
	 				<td>notice_id</td>
	 				<td>notice_title</td>
	 				<td>notice_date</td>
	 			</tr>
			</thead>
	 			
	 		<tbody>
	 			<%
					for(Notice n : list){
 					%>
	 					<tr>
	 						<td><a href="<%=request.getContextPath() %>/notice/noticeOne.jsp?noticeId=<%=n.getNoticeId() %>"><%=n.getNoticeId() %></a></td>
	 						<td><%=n.getNoticeTitle() %></td>
	 						<td><%=n.getNoticeDate() %></td>
	 					</tr>
	 				<%
					}
 				%>
	 		</tbody>
 		</table>
 	</div>
</body>
</html>