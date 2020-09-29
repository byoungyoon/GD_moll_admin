<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%
	request.setCharacterEncoding("UTF-8");

	int noticeId = Integer.parseInt(request.getParameter("noticeId"));
	String noticeTitle = request.getParameter("noticeTitle");
	String noticeContent = request.getParameter("noticeContent");
	
	Notice paramNotice = new Notice();
	paramNotice.setNoticeId(noticeId);
	paramNotice.setNoticeContent(noticeContent);
	paramNotice.setNoticeTitle(noticeTitle);
	
	NoticeDao noticeDao = new NoticeDao();
	
	noticeDao.updateNoticeList(paramNotice);
	
	response.sendRedirect(request.getContextPath()+"/notice/noticeOne.jsp?noticeId=" +noticeId);
%>