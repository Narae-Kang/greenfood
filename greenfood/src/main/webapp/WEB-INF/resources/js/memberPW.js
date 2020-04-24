window.addEventListener("load",init,false);
function init(){
	findPWBtn.addEventListener("click",function(e){
    e.preventDefault();
    if(valChk()){
    	document.forms['findpw'].submit();
    }
  },false);
}

function valChk() {
	var idTag = document.getElementById("id");
	var idValue = idTag.value;
	var nameTag = document.getElementById("name");
	var nameValue = nameTag.value;
	var flag = true;

	// 로그인 유효성 체크
	// 1) 아이디, 비밀번호 빈문자열 체크

	if (idValue.trim().length == 0) {
		idMsg.innerHTML = "아이디를 입력해주세요";
		idMsg.classList.add("errmsg");
		idTag.focus();
		flag = flag && false;
    }else{
    	idMsg.innerHTML = "";
    }
	if (nameValue.trim().length == 0) {
		nameMsg.innerHTML = "이름을 입력해주세요";
		nameMsg.classList.add("errmsg");
		nameMsg.focus();
		flag = flag && false;
    }else{
    	nameMsg.innerHTML = "";
    }
	return flag;

}