<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	/* 로그인시 저장했던 sessionId 가져오기 로그인 안한 상태면 sessionId==null */
	String sessionId = (String)session.getAttribute("sessionId");
%>
<nav class="navbar navbar-expand navbar-dark bg-dark">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="./welcome.jsp">Home</a>
		</div>
		<div>
		<div class="navbar-nav mr-auto">
			<c:choose>
				<c:when test="${empty sessionId }"> <%-- ${sessionId==null} --%>
					<li class="nav-item"><a class="nav-link" href="<c:url value='login.jsp'/>">로그인</a></li>
					<li class="nav-item"><a class="nav-link" href="<c:url value='addMember.jsp'/>">회원가입</a></li>
				</c:when>
				<c:otherwise>
					<li style="padding-top:7px; color:white;">[<%=sessionId %>님]</li>
					<li class="nav-item"><a class="nav-link" href="<c:url value='logout.jsp'/>">로그아웃</a></li>
					<li class="nav-item"><a class="nav-link" href="<c:url value='updateMember.jsp'/>">회원 수정</a></li>
				</c:otherwise>
			</c:choose>
			<li class="nav-item"><a class="nav-link" href="<c:url value="BoardListAction.do?pageNum=1"/>">게시판</a>
		</div>
		</div>
	</div>
</nav>
