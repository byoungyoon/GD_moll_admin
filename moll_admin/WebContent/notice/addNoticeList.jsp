<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addNoticeList</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
	<!-- 메인 폼 테이블 -->
	<div class="container">
		<jsp:include page="/inc/menu.jsp"></jsp:include>
		<br>
 		<h3>공지 목록</h3>
 		<form method="post" action="<%=request.getContextPath() %>/notice/addNoticeListAction.jsp">
 		
 		<div class="row">
 			<div class="col-sm-12">
		 		<table class="tabel table-dark">
		 			<tr>
		 				<th>notice_title</th>
		 				<td><input type="text" name="noticeTitle"></td>
		 			</tr>
		 			
		 			<tr>
		 				<th>notice_content</th>
		 				<td><textarea cols="70" rows="5" name="noticeContent"></textarea></td>
		 			</tr>
		 		</table>
	 		</div>
	 	</div>
	 	
	 	<div class="row">
 			<div class="col-sm-12 text-right">
 				<button type="submit" class="btn btn-dark">추가</button>
 			</div>
 		</div>
 		</form>
 	</div>
</body>
</html>