<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%
	/* 파라미터로 넘어온 값 얻기, 문자셋 설정 */
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
%>

<%-- 데이터 셋 설정 --%>
<sql:setDataSource var="dataSource"
	url="jdbc:mysql://localhost:3306/board"
	driver="com.mysql.jdbc.Driver" user="root" password="1234"/>
	
<%-- id, password에 맞는 회원정보를 DB에서 추출 --%>	
<sql:query dataSource="${dataSource }" var="resultSet">
select * from member where id =? and password=?
<sql:param value="<%=id %>"/>
<sql:param value="<%=password %>"/>
</sql:query>

<%-- 출력 결과 처리, session에 id 정보 저장 후 결과 페이지로 이동(get 방식) --%>
<c:forEach var="row" items="${resultSet.rows }">
	<%
		session.setAttribute("sessionId", id);
	%>
	<c:redirect url="resultMember.jsp?msg=2"/>
</c:forEach>

<%-- 조회 결과 데이터가 없으면 다시 로그인 페이지로 이동, 이동시 error의 파라미터값을 1로 전달 --%>
<c:redirect url="login.jsp?error=1"/>