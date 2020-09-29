<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%
	request.setCharacterEncoding("UTF-8");

	String noticeTitle = request.getParameter("noticeTitle");
	String noticeContent = request.getParameter("noticeContent");
	
	Notice paramNotice = new Notice();
	paramNotice.setNoticeTitle(noticeTitle);
	paramNotice.setNoticeContent(noticeContent);
	
	NoticeDao noticeDao = new NoticeDao();
	noticeDao.insertNoticeList(paramNotice);
	
	response.sendRedirect(request.getContextPath()+"/notice/noticeList.jsp");
%>