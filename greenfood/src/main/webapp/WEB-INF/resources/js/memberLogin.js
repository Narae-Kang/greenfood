window.addEventListener("load", init, false);

function init() {
	var id = document.getElementById("id");
	var pw = document.getElementById("pw");

	var loginBtn = window.document.getElementById("loginBtn");
	loginBtn.addEventListener("click", function(e) {
		e.preventDefault();
		var result = checkLogin();
		if (result) {
			document.getElementById("login").submit();
		}
	}, false);
}
//이메일 체크 정규식
function isEmail(asValue) {
  var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
  return regExp.test(asValue); // 형식에 맞는 경우 true 리턴
}
//비밀번호 체크 정규식
function isPassword(asValue) {
  var regExp = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,10}$/; // 8 ~ 10자 영문, 숫자 조합
  return regExp.test(asValue); // 형식에 맞는 경우 true 리턴
}

function checkLogin() {
	var idTag = document.getElementById("id");
	var id = idTag.value;
	var pwTag = document.getElementById("pw");
	var pw = pwTag.value;
	var flag = true;

	// 로그인 유효성 체크
	// 1) 아이디, 비밀번호 빈문자열 체크
//1) 이메일 주소 체크
  if(id.trim().length == 0) {
		idMsg.innerHTML = "아이디를 입력하세요";
		idMsg.classList.add("errmsg");
		idTag.focus();
		flag = false;
		return flag;
	}

	if(!isEmail(idTag.value)) {
  	idMsg.innerHTML = "아이디 정보를 잘못 입력하였습니다.";
		idMsg.classList.add("errmsg");
		idTag.focus();
		flag = false;
		return flag;
  }
	
	if (pw.trim().length == 0) {
		idMsg.innerHTML = "";
		pwMsg.innerHTML = "비밀번호를 입력하세요";
		pwMsg.classList.add("errmsg");
		pwTag.focus();
		flag = false;
		return flag;
	}
//	else if(!isPassword(pwTag.value)) {
//		idMsg.innerHTML = "";
//		pwMsg.innerHTML = "비밀번호 형식이 잘못되었습니다";
//		pwMsg.classList.add("errmsg");
//		pwTag.focus();
//		flag = false;
//		return flag;
//		}
	return flag;
}