<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<form name = "form1" action = '<c:url value = 'updateQnaPro.do' />' onsubmit = "return writeSave()" method = "post">
<div>
	<label for = "exampleFormControlInput1">제목</label>
	<input type = "text" id = "exampleFormControlInput1" name = "title" value = "${no.title }" >
	<input type = "hidden" name = "no" value = "${no.no }">
</div>
<div>
	<label for = "exampleFormControlInput1">작성자</label>
	<input type = "text" id = "exampleFormControlInput1" name = "writer" value = "${no.writer }" readonly>
</div>
<div>
	<label for = "exampleFormControlTextarea1">내용</label>
	<textarea id = "exampleFormControlTextarea1" name = "content" rows = "10">${no.content }</textarea>
</div>
<input type = "submit" value = "수	정" id = 'update'>
<input type = "button" value = "취	소" onclick = "locaion.href='selectQnaForm.do?no=${no.no}'">
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