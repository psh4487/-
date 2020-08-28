<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<form name = "form1" action = '<c:url value='writeboardPro.do'/>' onsubmit="return writeSave()" method = "post">
		<div>
			<label for = "exampleFormControlInput1">제목</label>
			<input type = "text" id = "title" name = "title" placeholder = "제목을 작성해 주세요.">
			<select id = "horse" name = "horse">
				<option>일반</option>
				<option>공지</option>
			</select>
			<input type = "hidden" name = "mem_no" value = "${login.mem_no }">
		</div>
		
		<div>
			<label for = "exampleFormControlInput1">작성자</label>
			<input type = "text" id = "exampleFormControlInput1" name = "writer"  value = "${login.staff_nm }" readonly>
		</div>
		<div>
			<label for = "exampleFormControlTextarea1">내용</label>
			<textarea id = "exampleFromControlTextarea1" name = "content" rows = "10"></textarea>
			
		</div>
		<input type = "submit" value = "등록하기" id = "insert">
		<input type = "button" value = "목록으로" onclick = "location.href='boardMain.do'">
	</form>
</body>
<script>
function writeSave(){
	if(!form1.title.value){
		alert("제목을 입력하십시오.")
		form1.title.focus();
		return false;
		}
}
</script>
</html>