<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Welcome</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="menu.jsp"/>
<%
	String greeting = "Welcome to my Site";
	String tagline = "Good to see you!";
%>
<div class="jumbotron">
	<div class="container">
		<h1 class="display-3"><%=greeting %></h1>
	</div>
</div>
<div class="container">
	<div class="text-center">
		<h3><%=tagline %></h3>
		<%= new java.util.Date().toLocaleString() %>
	</div>
	<div class="text-center">
	<jsp:include page="visitCount.jsp"/>
	</div>
</div>
<hr>
<jsp:include page="footer.jsp"/>
</body>
</html>