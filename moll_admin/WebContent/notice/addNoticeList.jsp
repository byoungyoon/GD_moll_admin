<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addNoticeList</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<script>
	$(document).ready(function() {
		$("#btn").click(function() {
			if($("#noticeTitle").val().length < 1){
				$("#err").text("공지의 제목을 입력하여 주세요");
				return;
			} else if($("#noticeContent").val().length < 1){
				$("#err").text("공지의 내용을 입력하여 주세요");
				return
			}
			$("#addNoticeForm").submit();
		});
	});
</script>

	<!-- 메인 폼 테이블 -->
	<div class="container">
		<jsp:include page="/inc/menu.jsp"></jsp:include>
 		
 		<br>
 		
 		<div class="row">	
			<div class="col-sm-3">
				<h3>공지 추가</h3>
			</div>
		</div>
		
 		<form id="addNoticeForm" method="post" action="<%=request.getContextPath() %>/notice/addNoticeListAction.jsp">
 		
		 		<table class="table table-dark">
		 			<tr>
		 				<th>notice_title</th>
		 				<td><input type="text" name="noticeTitle" id="noticeTitle"></td>
		 			</tr>
		 			
		 			<tr>
		 				<th>notice_content</th>
		 				<td>
		 					<textarea cols="70" rows="5" name="noticeContent" id="noticeContent"></textarea>
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