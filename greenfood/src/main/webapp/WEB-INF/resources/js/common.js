/**	javsScript Source File 로 만들어진 페이지
 * 공용 자바 스크립트
 */

//컨텍스트 루트 경로 읽어오기`
var g_contextPath = true;
function getContextPath() {
	if(g_contextPath) {
		let idx = location.href.indexOf(location.host)+location.host.length;
		return location.href.substring(idx, location.href.indexOf('/', idx+1));
	}	else {
		return "";
	}
}