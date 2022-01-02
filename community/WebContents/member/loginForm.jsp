<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
		<meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>로그인</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="./resources/assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="../resources/css/styles.css" rel="stylesheet" />
        
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"/>
<link rel="stylesheet" href="../resources/css/styles.css">
<style>
.ct{
	margin-top: 50px;
}
</style>
    <title>로그인</title>
</head>
<body>
<jsp:include page="/menu.jsp"/>

<header class="py-5 bg-image-full" style="background-image: url('https://source.unsplash.com/wfh8dDlNFOk/1600x900')">
     <div class="text-center my-5">
         <h1 class="text-white fs-3 fw-bolder">Login</h1>
         <p class="text-gray-50 mb-0">Personal Information</p>
     </div>
</header>
<div class="container ct" align="center">
   <div class="col-md-4 col-md-offset-4">
        <h3 class="form-signin-heading">Please sign in</h3>
        <%
        	 String error = request.getParameter("error");
            if(error!=null){
          	  out.print("<div class='alert alert-danger'>");
          	  out.print("아이디와 비밀번호를 확인해 주세요");
          	  out.print("</div>");
            }
        %> 
 	<form action="${pageContext.request.contextPath}/login.do" method="post">
    	<div class="form-group">
            <label for="inputUserName" class="sr-only">아이디</label>
            <input type="text" class="form-control" placeholder="ID" name="id" required autofocus>
        </div>
        <div class="form-group">
            <label class="sr-only" for="inputPassword">비밀번호</label>
            <input type="password" class="form-control" placeholder="Password" name="password" required>
        </div>
        <button class="btn btn btn-lg btn-success btn-block" type="submit">로그인</button>
        <button class="btn btn btn-lg btn-secondary btn-block" type="button" 
              onclick="location.href='joinForm.jsp'">회원가입</button>
       </form>
   </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="../resources/js/scripts.js"></script>
</body>
</html>
