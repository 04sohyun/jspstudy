<%@page import="mvc.member.model.MemberDTO"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
	<title>회원정보수정</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<link href="../resources/css/styles.css" rel="stylesheet" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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
	<!-- <script>
		function selectDomain(obj){
			document.newMember.email2.value=obj.value;
			if(obj.value=="") document.newMember.email2.focus();
		}
	</script>
	<script>
		function checkForm() {
			if (document.newMember.password.value !== document.newMember.password_chk.value) {
				alert("비밀번호와 비밀번호확인 값이 서로 다릅니다!");
				document.newMember.password.value = "";
				document.newMember.password_chk.value = "";
				document.newMember.password.focus();
				return false;
			}
			//validation 체크
			const regExpId = /^[a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
			const regExpName = /^[가-힣]*$/;
			const regExpPassword =/^[0-9]*$/;
			const regExpPhone = /^\d{3}-\d{3,4}-\d{4}$/;
			const regExpEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i; //akim
			const form = document.newMember;

			var id = form.id.value;
			var name = form.name.value;
			var passwd = form.password.value;
			var phone = form.phone1.value +"-" + form.phone2.value +"-" + form.phone3.value;
			var email = form.email1.value +"@"+form.email2.value;

			if(!regExpId.test(id)){
				alert("아이디는 문자로 시작해주세요");
				form.id.focus();
				form.id.value='';
				return false;
			}
			if(!regExpName.test(name)){
				alert("이름은 한글만 입력해주세요!");
				form.name.focus();
				form.name.value='';
				return false;
			}
			if(!regExpPassword.test(passwd)){
				alert("비밀번호는 숫자만 입력해주세요");
				form.password.focus();
				form.password.value='';
				form.password_chk.value='';
				return false;
			}
			if(!regExpPhone.test(phone)){
				alert("연락처 입력을 확인 해주세요");
				form.phone2.focus();
				form.phone2.value='';
				form.phone3.value='';
				return false;
			}
			if(!regExpEmail.test(email)){
				alert("이메일 입력을 확인 해주세요");
				form.email1.focus();
				form.email1.value='';
				form.email2.value='';
				return false;
			}

			return true;
		}
	</script>
	<script>
		function deleteUser() {
			location.href="${pageContext.request.contextPath}/deleteMember.do";
		}
	</script>
<style>
.ct{
	margin-top: 50px;
}
</style> -->	
</head>
<body>
${dto.id }
${dto.password}
${dto.zipcode }
<jsp:include page="/menu.jsp"/>
<header class="py-5 bg-image-full" style="background-image: url('https://source.unsplash.com/wfh8dDlNFOk/1600x900')">
     <div class="text-center my-5">
         <h1 class="text-white fs-3 fw-bolder">Update</h1>
         <p class="text-gray-50 mb-0">Personal Information</p>
     </div>
</header>
<c:set var="dto" value="${sessionScope.dto}"/>
<div class="container ct">
<form action="${pageContext.request.contextPath}/updateMember.do" method="post" 
	class="form-horizontal" name="newMember" onsubmit="return checkForm()">
	<div class="form-group row">
         <label class="col-sm-2">아이디</label>
         <div class="col-sm-3">
              <input name="id" type="text" class="form-control" placeholder="id" value="${dto.id}" readonly>
         </div>
    </div>
	<div class="form-group row">
          <label class="col-sm-2">비밀번호</label>
          <div class="col-sm-3">
               <input name="password" type="password" class="form-control" placeholder="password" value="${dto.password}" required>
          </div>
    </div>
    
    <div class="form-group row">
          <label class="col-sm-2">비밀번호확인</label>
          <div class="col-sm-3">
               <input name="password_chk" type="password" class="form-control" placeholder="password" value="${dto.password}" required>
          </div>
    </div>
	<div class="form-group row">
           <label class="col-sm-2">이름</label>
           <div class="col-sm-3">
                <input name="name" type="text" class="form-control" placeholder="name" required value="${dto.name}">
           </div>
     </div>
	<div class="form-group row">
             <label class="col-sm-2">이메일</label>
             <div class="col-sm-10">
                <input type="text" name="email1" maxlength="50" value="${fn:substring(dto.email,0,fn:indexOf(dto.email,'@')) }" required> @ 
                <input type="text" name="email2" maxlength="50" required value="${fn:substring(dto.email,fn:indexOf(dto.email,'@')+1,fn:length(dto.email)) }">
             </div>
       </div>
		<div class="form-group row">
         <label class="col-sm-2">전화번호</label>
         <div class="col-sm-5">
               <input maxlength="3" size="4" name="phone1" value="${fn:substring(dto.phone,0,3)}">
				- <input maxlength="4" size="4" name="phone2" value="${fn:substring(dto.phone,4,8)}"> -
				<input maxlength="4" size="4" name="phone3" value="${fn:substring(dto.phone,9,13)}">
         </div>
       </div>
		<div class="form-group row">
             <label class="col-sm-2">우편번호</label>
             <div class="col-sm-3">
                 <input name="zipcode" id="zipcode" type="text" class="form-control" placeholder="우편번호" value="${dto.zipcode}" required>
             </div>
             <div class="col-sm-1" >
             	 <input type="button" onclick="Postcode()" value="우편번호 찾기" class="btn btn-success"><br>
             </div>
         </div>
          <div class="form-group row">
             <label class="col-sm-2">도로명주소</label>
             <div class="col-sm-5">
                 <input name="roadAddress" id="roadAddress"  type="text" class="form-control" placeholder="도로명주소" value="${dto.roadAddress}" required>
             </div>
         </div>
         <div class="form-group row">
             <label class="col-sm-2">지번주소</label>
             <div class="col-sm-5">
                 <input name="jibunAddress" id="jibunAddress"  type="text" class="form-control" placeholder="지번주소" value="${dto.jibunAddress}" required>
             </div>
         </div>
         <span id="guide" style="color:#999;display:none"></span>
         <div class="form-group row">
             <label class="col-sm-2">상세주소</label>
             <div class="col-sm-5">
                 <input name="detailAddress"  id="detailAddress" type="text" class="form-control" placeholder="상세주소" value="${dto.detailAddress}" required>
             </div>
         </div>
         <div class="form-group row">
             <label class="col-sm-2">참고항목</label>
             <div class="col-sm-3">
                 <input name="extraAddress"id="extraAddress" type="text" class="form-control" placeholder="참고항목" value="${dto.extraAddress}" required>
             </div>
         </div>
		<div class="form-gorup row">
          <div class="col-sm-offset-2 col-sm-10">
               <input type="submit" class="btn btn-primary" value="수정">
               <input type="reset"  class="btn btn-warning" value="취소" onclick="reset()">
          </div>
       </div>
       
</form>
	<button class="btn btn-info" data-toggle="modal" data-target="#deleteModal" style="float:right">회원탈퇴</button>
</div>


	<!-- Modal -->
	<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">회원탈퇴</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        탈퇴하시겠습니까?
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	        <a type="button" class="btn btn-primary" onclick="deleteUser()">회원탈퇴</a>
	      </div>
	    </div>
	  </div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="../resources/js/scripts.js"></script>
</body>
</html>