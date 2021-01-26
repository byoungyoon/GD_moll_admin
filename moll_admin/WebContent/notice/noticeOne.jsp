<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeOne</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<%
	//사용자가 관리자 일때만 들어올수 있는 사이트 다른 이용자 일 경우 return하여 mollIndex로
	if(session.getAttribute("adminLogin") == null){
		response.sendRedirect(request.getContextPath()+"/login/login.jsp");
		return;
	}

	int noticeId = Integer.parseInt(request.getParameter("noticeId"));

	Notice paramNotice = new Notice();
	paramNotice.setNoticeId(noticeId);
	
	NoticeDao noticeDao = new NoticeDao();
	
	Notice notice = noticeDao.selectNoticeOne(paramNotice);
%>
<div class="container">
	<jsp:include page="/inc/menu.jsp"></jsp:include>
	<br>
 	<h3>공지 목록</h3>
 	<table class="table table-dark">
 		<tr>
 			<th>notice_id</th>
 			<td><%=notice.getNoticeId() %></td>
 		</tr>	
 		
 		<tr>
 			<th>notice_title</th>
 			<td><%=notice.getNoticeTitle() %></td>
 		</tr>	
 		
 		<tr>
 			<th>notice_content</th>
 			<td><%=notice.getNoticeContent() %></td>
 		</tr>	
 		
 		<tr>
 			<th>notice_date</th>
 			<td><%=notice.getNoticeDate() %></td>
 		</tr>	
 	</table>
 	<div class="row">
 		<div class="col-sm-12 text-right">
 			<a href="<%=request.getContextPath() %>/notice/updateNoticeList.jsp?noticeId=<%=noticeId %>" class="btn btn-dark">수정</a>
 			<a href="<%=request.getContextPath() %>/notice/deleteNoticeAction.jsp?noticeId=<%=noticeId %>" class="btn btn-dark">삭제</a>
 		</div>
 	</div>
 </div>
</body>
</html>