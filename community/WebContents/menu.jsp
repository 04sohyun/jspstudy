<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head><link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<nav class="navbar navbar-expand navbar-dark bg-dark">
<div class="container">
	<div class="navbar-header">
		<a class="navbar-brand" href="<c:url value='/index.jsp'/>">Home</a>
	</div>
	<div>
		<ul class="navbar-nav mr-auto">
			<c:choose>
				<c:when test="${empty dto}">
					<li class="nav-item">
						<a class="navbar-brand" href="<c:url value='/member/loginForm.jsp'/>">로그인</a>
						<a class="navbar-brand" href="<c:url value='/member/joinForm.jsp'/>">회원가입</a>
					</li>
				</c:when>
				<c:otherwise>
					<li><li style="padding-top:7px; color:black;">[${dto.name}님]</li></li>
					<a class="navbar-brand" href="<c:url value='/logout.do'/>">로그아웃</a>
					<a class="navbar-brand" href="<c:url value='/member/updateForm.jsp'/>">회원수정</a>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
</div>
</nav>
</body>
</html>