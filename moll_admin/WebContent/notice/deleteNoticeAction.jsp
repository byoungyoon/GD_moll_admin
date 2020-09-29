<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%
	//사용자가 관리자 일때만 들어올수 있는 사이트 다른 이용자 일 경우 return하여 mollIndex로
	if(session.getAttribute("adminLogin") == null){
		response.sendRedirect("/moll_admin/login/login.jsp");
		return;
	}

	int noticeId = Integer.parseInt(request.getParameter("noticeId"));

	Notice paramNotice = new Notice();
	paramNotice.setNoticeId(noticeId);
	
	NoticeDao noticeDao = new NoticeDao();
	noticeDao.deleteNoticeList(paramNotice);
	
	response.sendRedirect(request.getContextPath()+"/notice/noticeList.jsp");
%>