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
 	
 	<form method="post" action="<%=request.getContextPath() %>/notice/updateNoticeListAction.jsp">
	 	<table class="table table-dark">
	 		<tr>
	 			<th>notice_id</th>
	 			<td><%=notice.getNoticeId() %></td>
	 			<td><input type="hidden" name="noticeId" value=<%=notice.getNoticeId() %>></td>
	 		</tr>	
	 		
	 		<tr>
	 			<th>notice_title</th>
	 			<td><input type="text" name="noticeTitle" value=<%=notice.getNoticeTitle() %>></td>
	 		</tr>	
	 		
	 		<tr>
	 			<th>notice_content</th>
	 			<td><textarea rows="3" cols="70" name="noticeContent" value=<%=notice.getNoticeContent() %>><%=notice.getNoticeContent() %></textarea></td>
	 		</tr>	 
	 		
	 		<tr>
	 			<th>notice_date</th>
	 			<td><%=notice.getNoticeDate() %></td>
	 		</tr>	
	 	</table>
	 	<div class="row">
	 		<div class="col-sm-12 text-right">
	 			<button class="btn btn-dark">수정</button>
	 		</div>
	 	</div>
 	</form>
 </div>
</body>
</html>