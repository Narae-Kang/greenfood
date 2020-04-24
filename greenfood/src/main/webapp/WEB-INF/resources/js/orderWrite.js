window.addEventListener("load",init,false);

function init(){
	var shopping_buy_btn = window.document.getElementById("shopping_buy_btn");
	var shopping_cancle_btn = window.document.getElementById("shopping_cancle_btn");
	
	shopping_buy_btn.addEventListener("click",function(e){
    e.preventDefault();
    var sum = document.getElementById('totalprice');
    if(checkValid()){
		document.getElementById("cartForm").submit();
	 	}
	},false);
	
	shopping_cancle_btn.addEventListener("click",function(e){
		e.preventDefault();
		if(confirm('결제를 취소하시겠습니까?')){
			location.href="/greenfood";
		}		
	},false);
}

function checkValid(){
  // 사용자 입력값 읽어오기
  var tel 		= document.getElementById('ftel');
  var name 		= document.getElementById('fname');
  var address 	= document.getElementById('sample6_detailAddress');

  var flag = true; /* 회원가입 유효성 체크 유무 */


  //전화번호
    if(!isTel(tel.value)) {
      tel_errmsg.innerHTML = "전화번호가 잘못되었습니다.ex)010-1234-5678";
      flag = flag && false;
    }else{
      tel_errmsg.innerHTML = "";
    }    
    
  //이름
    if(name.value == "" ) {
    	name_errmsg.innerHTML = "이름을 입력해주세요";
        flag = flag && false;
      }else{
    	name_errmsg.innerHTML = "";
      }   
  	
    //주소를 입력하지않았을때
    if(address.value == ""){
    	address_errmsg.innerHTML = "주소를 입력해주세요";
      flag = flag && false;
    }else{
    	address_errmsg.innerHTML = "";
    }

    return flag;
}
// 이메일 체크 정규식
function isEmail(asValue) {
  var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
  return regExp.test(asValue); // 형식에 맞는 경우 true 리턴
}

// 핸드폰 번호 체크 정규식
function isTel(asValue) {
  var regExp = /^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/;
  return regExp.test(asValue); // 형식에 맞는 경우 true 리턴
}

function sample6_execDaumPostcode() {
  new daum.Postcode({
      oncomplete: function(data) {
          // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

          // 각 주소의 노출 규칙에 따라 주소를 조합한다.
          // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
          var addr = ''; // 주소 변수
          var extraAddr = ''; // 참고항목 변수

          //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
          if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
              addr = data.roadAddress;
          } else { // 사용자가 지번 주소를 선택했을 경우(J)
              addr = data.jibunAddress;
          }

          // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
          if(data.userSelectedType === 'R'){
              // 법정동명이 있을 경우 추가한다. (법정리는 제외)
              // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
              if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                  extraAddr += data.bname;
              }
              // 건물명이 있고, 공동주택일 경우 추가한다.
              if(data.buildingName !== '' && data.apartment === 'Y'){
                  extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
              }
              // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
              if(extraAddr !== ''){
                  extraAddr = ' (' + extraAddr + ')';
              }
              // 조합된 참고항목을 해당 필드에 넣는다.
              document.getElementById("sample6_detailAddress").value = extraAddr;
          
          } else {
              document.getElementById("sample6_detailAddress").value = '';
          }

          // 우편번호와 주소 정보를 해당 필드에 넣는다.
          document.getElementById('sample6_postcode').value = data.zonecode;
          document.getElementById("sample6_address").value = addr;
          // 커서를 상세주소 필드로 이동한다.
          document.getElementById("sample6_detailAddress").focus();
      }
  }).open();
}