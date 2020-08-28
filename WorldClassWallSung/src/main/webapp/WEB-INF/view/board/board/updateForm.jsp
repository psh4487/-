<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<form name = "form1" action = '<c:url value='updateboardPro.do'/>' onsubmit = "return writeSave()" method = "post">
<div>

	<label for = "exampleFormControlInput1">제목</label>
	
	<input type = "text" id = "exampleFormControlInput1" name = "title" value = "${no.title }" >
	<input type = "hidden" name = "no" value = "${no.no }">
	<select name = "horse" id = "horse">
		<c:if test = "${no.horse == '공지' }">
		<option>공지</option>
		<option>일반</option>
		</c:if>
		<c:if test = "${no.horse == '일반' }">
		<option>일반</option>
		<option>공지</option>
		</c:if>
	</select>
</div>
<div>
	<label for = "exampleFormControlInput1">작성자</label>
	<input type = "text" id = "exampleFormControlInput1" name = "writer" value = "${no.writer }" >
</div>
<div>
	<label for = "exampleFormControlTextarea1">내용</label>
	<textarea id = "exampleFormControlTextarea1" name = "content" rows = "10">${no.content }</textarea>
</div>

<input type = "submit" value = "수	정" id = 'update'>
<input type = "button" value = "취	소" onclick = "location.href='selectboardForm.do?no=${no.no}'">	

</form>
<script>
function writeSave(){
	if(!form1.title.value){
		alert("제목을 입력하십시오.")
		form1.title.focus();
		return false;
		}
}
</script>
</body>
</html>