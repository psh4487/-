<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

</head>
<style>
	.form-group{padding:5px 500px;}
	.input-group{padding:5px 700px;}
</style>
<body>
<form name = "form1" action = '<c:url value = 'updateQnaPro.do' />' onsubmit = "return writeSave()" method = "post">
<div class = "form-group" align = "center">
	<label for = "title">제목</label><p>
	<input type = "text" style="width:500px;height:34px;" id = "exampleFormControlInput1" name = "title" value = "${no.title }" >
	<input type = "hidden" name = "no" value = "${no.no }">
</div>
<div class = "form-group" align = "center">
	<label for = "exampleFormControlInput1">작성자</label><p>
	<input type = "text" style="width:500px;height:34px;" id = "exampleFormControlInput1" name = "writer" value = "${no.writer }" readonly>
</div>
<div class = "form-group" align = "center">
	<label for = "content">내용</label><p>
	<textarea style="width:500px;" id = "exampleFormControlTextarea1" name = "content" rows = "10">${no.content }</textarea>
</div>
<div class = "input-group">
<input type = "submit" style = "margin-right:15px;" class = "replyWriteBtn btn btn-warning" value = "수   정" id = 'update'>
<input type = "button" class = "replyWriteBtn btn btn-danger" value = "취   소" onclick = "location.href='selectQnaForm.do?no=${no.no}'">
</div>
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