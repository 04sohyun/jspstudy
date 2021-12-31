<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>게시</title>
</head>
<body>
<jsp:include page="../menu.jsp"/>
<div class="jumbotron">
	<div class="container">
		<h1 class="display-3">게시판</h1>
	</div>
</div>
<div class="container">
	<form action="<c:url value='./BoardListAction.do'/>" method="post">
		<div>
			<div class="text-right">
				<span class="badge badge-success">전체 ${total_record}</span>
			</div>
		</div>
		<div style="padding-top:50px;">
			<table class="table table-hover">
				<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성일</th>
				<th>조회</th>
				<th>글쓴이</th>
				</tr>
			</table>
		</div>
	</form>
</div>
</body>
</html>