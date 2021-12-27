function checkForm(){
	//validation 체크 
	var regExpId = /^[a-z|A-z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
	var regExpPassword = /^[0-9]+$/;
	var regExpName = /^[가-힣]+$/;
	var regExpBirth = /^\d{4}-\d{1,2}-\d{1,2}$/;
	var regExpEmail = /^[a-zA-Z0-9]([-_\.]?[0-9a-zA-Z])*@[a-zA-Z0-9]([-_\.]?[a-zA-Z0-9])*\.[a-zA-Z]{2,3}$/i;
	var regExpPhone = /^\d{3}-\d{3,4}-\d{4}$/;
	
	var id = document.newMember.id.value;
	var password = document.newMember.password.value;
	var name = document.newMember.name.value;
	var birth = document.newMember.birthyy.value+document.newMember.birthmm.value+document.newMember.birthdd.value;
	var email = document.newMember.mail1.value+"@"+document.newMember.mail2.value;
	var phone = document.newMember.phone1.value+document.newMember.phone2.value+document.newMember.phone3.value;
	
	if(!regExpId.test(id)){
		alert("아이디는 문자로 시작해주세요.");
		document.newMember.id.focus();
		id="";
		return false;
	}
	
	if(!regExpPassword.test(password)){
		alert("비밀번호는 숫자만 입력해주세요.");
		document.newMember.password.focus();
		password="";
		return false;
	}
	
	if(!regExpName.test(name)){
		alert("이름은 한글만 입력해주세요.");
		document.newMember.name.focus();
		name="";
		return false;
	}
	
	if(!regExpBirth.test(birth)){
		alert("생일 입력을 확인해주세요.");
		document.newMember.birthyy.focus();
		document.newMember.birthyy.value="";
		document.newMember.birthyy.value="";
		document.newMember.birthyy.value="";
		return false;
	}
	
	if(!regExpEmail.test(email)){
		alert("이메일 입력을 확인해주세요.");
		document.newMember.email1.focus();
		document.newMember.email1.value="";
		document.newMember.email2.value="";
		return false;
	}
	
	if(!regExpPhone.test(phone)){
		alert("연락처 입력을 확인해주세요.");
		document.newMember.phone2.focus();
		document.newMember.phone2.value="";
		document.newMember.phone3.value="";
		return false;
	}
	return true;
}