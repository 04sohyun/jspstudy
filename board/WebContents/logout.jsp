<%@ page contentType="text/html; charset=UTF-8"%>
<%
	/* 로그인 정보 삭제 */
	session.invalidate();
	/* 로그인 페이지로 이동 */
	response.sendRedirect("login.jsp");
%>