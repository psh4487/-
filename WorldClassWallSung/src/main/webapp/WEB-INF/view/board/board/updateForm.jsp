<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<style>
 .form-group, .input-group{padding:5px 500px;}
</style>
</head>
<body>
<form name = "form1" action = '<c:url value='updateboardPro.do'/>' onsubmit = "return writeSave()" method = "post">
<div class = "form-group">

	<label for = "title">제목</label>
	
	<input type = "text" id = "title" name = "title" value = "${no.title }" style="width:500px;height:34px;" class = "form-control" >
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
<div class = "form-group">
	<label for = "writer">작성자</label>
	<input type = "text" style="width:500px;height:34px;" id = "exampleFormControlInput1" name = "writer" class = "form-control" value = "${no.writer }" >
</div>
<div class = "form-group">
	<label for = "content">내용</label>
	<textarea id = "exampleFormControlTextarea1"  style="width:500px;" name = "content" class = "form-control" rows = "10">${no.content }</textarea>
</div>
<div class = "input-group" style = "padding:0px 650px;">
<input type = "submit" class = "replyWriteBtn btn btn-warning" value = "수   정" id = 'update' style = "margin-right:15px;">
<input type = "button" class = "replyWriteBtn btn btn-danger" value = "취   소" onclick = "location.href='selectboardForm.do?no=${no.no}'">	
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