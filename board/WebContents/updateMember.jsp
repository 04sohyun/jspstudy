<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>회원 수정</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<%
	String sessionId=(String)session.getAttribute("sessionId");
%>
<sql:setDataSource var="dataSource"
	url="jdbc:mysql://localhost:3306/board"
	driver="com.mysql.jdbc.Driver" user="root" password="1234"/>

<sql:query dataSource="${dataSource}" var="resultSet">
select * from member where id=?
<sql:param value="<%=sessionId %>"/>
</sql:query>	
	
</head>
<body>
<jsp:include page="menu.jsp"/>
<div class="jumbotron">
	<div class="container">
    	<h1 class="display-3">회원 수정</h1>
    </div>
</div>
<c:forEach var="row" items="${resultSet.rows}">
<%-- 생일나누기 --%>
<c:set var="birth" value="${row.birth}"/>
<c:set var="birthyy" value="${birth.split('/')[0]}"/>
<c:set var="birthmm" value="${birth.split('/')[1]}"/>
<c:set var="birthdd" value="${birth.split('/')[2]}"/>
<%-- 메일나누기 --%>
<c:set var="mail" value="${row.mail}"/>
<c:set var="mail1" value="${mail.split('@')[0]}"/>
<c:set var="mail2" value="${mail.split('@')[1]}"/>
<%-- 전화번호나누기 --%>
<c:set var="phone" value="${row.phone}"/>
<c:set var="phone1" value="${phone.split('-')[0]}"/>
<c:set var="phone2" value="${phone.split('-')[1]}"/>
<c:set var="phone3" value="${phone.split('-')[2]}"/>

<div class="container">
	<form action="processUpdateMember.jsp" class="form-horizontal" method="post">
		<div class="form-group row">
			<label class="col-sm-2">아이디</label>
			<div class="col-sm-3">
				<input name="id" class="form-group" placeholder="ID" value="${row.id}" required>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">비밀번호</label>
			<div class="col-sm-3">
				<input type="password" name="password" class="form-group" placeholder="PASSWORD" value="${row.password}" required>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">이름</label>
			<div class="col-sm-3">
				<input name="name" class="form-group" placeholder="NAME" value="${row.name}" required>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">성별</label>
			<div class="form-check form-check-inline">
				<c:set var="gender" value="${row.gender}"/>
				<input type="radio" value="남자" name="gender" class="form-check-input" 
				<c:if test="${gender.equals('남자')}"><c:out value="checked"/></c:if>>
				<label class="from-check-label">남자</label>
			</div>
			<div class="form-check form-check-inline">
				<input type="radio" value="여자" name="gender" class="form-check-input"
				<c:if test="${gender.equals('여자')}"><c:out value="checked"/></c:if>>
				<label class="from-check-label">여자</label>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">생일</label>
			<div class="col-sm-3">
				<input name="birthhyy" maxlength="4" size="6" class="form-group" placeholder="년(4자)" value="${birthyy}" required>
				<input name="birthhmm" maxlength="2" size="4" class="form-group" placeholder="월" value="${birthmm}" required>
				<input name="birthhdd" maxlength="2" size="4" class="form-group" placeholder="일" value="${birthdd}" required>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">이메일</label>
			<div class="col-sm-10">
				<input name="mail1" maxlength="50" value="${mail1}" required>@
				<select name="mail2">
					<option value="naver.com" <c:if test="${mail2.equals('naver.com')}"><c:out value="selected"/></c:if>>naver.com</option>
					<option value="daum.net" <c:if test="${mail2.equals('daum.net')}"><c:out value="selected"/></c:if>>daum.net</option>
					<option value="gmail.com" <c:if test="${mail2.equals('gamil.com')}"><c:out value="selected"/></c:if>>gmail.com</option>
					<option value="nate.com" <c:if test="${mail2.equals('nate.com')}"><c:out value="selected"/></c:if>>nate.com</option>
				</select>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">전화번호</label>
			<div class="col-sm-5">
				<select name="phone1" required>
					<option value="010" <c:if test="${mail2.equals('010')}"><c:out value="selected"/></c:if>>010</option>
					<option value="011" <c:if test="${mail2.equals('011')}"><c:out value="selected"/></c:if>>011</option>
					<option value="016" <c:if test="${mail2.equals('016')}"><c:out value="selected"/></c:if>>016</option>
					<option value="017" <c:if test="${mail2.equals('017')}"><c:out value="selected"/></c:if>>017</option>
					<option value="019" <c:if test="${mail2.equals('019')}"><c:out value="selected"/></c:if>>019</option>
				</select>
				-<input name="phone2" maxlength="4" size="4" value="${phone2}" required>
				-<input name="phone3" maxlength="4" size="4" value="${phone3}" required>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">우편번호</label>
			<div class="col-sm-3">
				<input name="zipcode" class="from-control" placeholder="우편번호" value="${row.zipcode}">
				<input type="button" onclick="Postcode()" value="우편번호 찾기"><br>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">도로명주소</label>
			<div class="col-sm-3">
				<input name="roadAddress" class="from-control" placeholder="도로명주소" value="${row.roadAddress}">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">지번주소</label>
			<div class="col-sm-3">
				<input name="jibunAddress" class="from-control" placeholder="지번주소" value="${row.jibunAddress}">
			</div>
		</div>
		<span id="guide" style="color:#999;display:none"></span>
		<div class="form-group row">
			<label class="col-sm-2">상세주소</label>
			<div class="col-sm-3">
				<input name="detailAddress" class="from-control" placeholder="상세주소" value="${row.detailAddress}">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">참고항목</label>
			<div class="col-sm-3">
				<input name="extraAddress" class="from-control" placeholder="참고항목" value="${row.extraAddress}">
			</div>
		</div>
		<div class="form-group row">
			<div class="col-sm-offset-2 col-sm-10">
				<input type="submit" class="btn btn-primary" value="수정">
				<input type="reset" class="btn btn-warning" value="취소">
				<a href="deleteMember.jsp" class="btn btn-secondary" role="button">회원삭제</a>
			</div>
		</div>
	</form>
</div>
</c:forEach>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function Postcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode;
                document.getElementById("roadAddress").value = roadAddr;
                document.getElementById("jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>

</body>
</html>