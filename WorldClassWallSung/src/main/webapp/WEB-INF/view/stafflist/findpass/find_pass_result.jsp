<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<SCRIPT>
function mclose(){
window.opener=window.location.href;
self.close();
}
setTimeout('mclose()',5000);

</SCRIPT>


<BODY>




<body>
<form cellSpacing=1 cellPadding=1 width="500" border=1 align="center">
비밀번호가 변경되었습니다.<br>
5초 후 자동으로 종료됩니다.<br>
새로운 비밀번호로 로그인해주세요.
</form>
</body>
</html>
