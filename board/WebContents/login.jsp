<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"/>
</head>
<body>
<jsp:include page="menu.jsp"/>
<div class="jumbotron">
	<div class="container">
		<h1 class="display-3">로그인</h1>
	</div>
</div>
<div class="container" align="center">
	<div class="col-md-4 col-me-offset-4">
		<h3 class="form-signin-heading">Please sign in</h3>
		<%
			String error = request.getParameter("error");
			if(error!=null){
				out.print("<div class='alert alert-danger'>");
				out.print("아이디와 비밀번호를 확인해주세요.");
				out.print("</div>");
			}
		%>
		<form class="form-signin" action="processLoginMember.jsp" method="post">
			<div class="form-group">
				<label class="sr-only">User Name</label>
				<input name="id" class="form-control" placeholder="ID" required autofocus>
			</div>
			<div class="form-group">
				<label class="sr-only">Password</label>
				<input type="password" name="password" class="form-control" placeholder="Password" required>
			</div>
			<button class="btn btn-lg btn-success btn-block" type="submit">로그인</button>
			<button class="btn btn-lg btn-secondary btn-block" type="button" onclick="location.href='addMember.jsp'">회원가입</button>
		</form>
	</div>
</div>
</body>
</html>