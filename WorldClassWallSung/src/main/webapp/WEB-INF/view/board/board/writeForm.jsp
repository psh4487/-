<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>학교 게시판 글쓰기</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
		<style>
 .form-group, .input-group{padding:5px 500px;}
</style>
</head>
<body>
	<form name = "form1" action = '<c:url value='writeboardPro.do'/>' onsubmit="return writeSave()" method = "post">
		<div class = "form-group">
			<label for = "title">제목</label>
			<input type = "text" style="width:500px;height:34px;" id = "title" name = "title" class = "form-control" placeholder = "제목을 작성해 주세요.">
			<select id = "horse" name = "horse">
				<option>일반</option>
				<option>공지</option>
			</select>
			<input type = "hidden" name = "mem_no" value = "${login.mem_no }">
		</div>
		
		<div class = "form-group">
			<label for = "writer">작성자</label>
			<input type = "text" style="width:500px;height:34px;" id = "exampleFormControlInput1" name = "writer" class="form-control" value = "${login.staff_nm }" readonly>
		</div>
		<div class = "form-group">
			<label for = "content">내용</label>
			<textarea id = "exampleFromControlTextarea1" style="width:500px;" class = "form-control" name = "content" rows = "10"></textarea>
			
		</div>
		<div class = "input-group" style = "padding:0px 650px">
		<input type = "submit" class = "replyWriteBtn btn btn-success" value = "등록하기" id = "insert" style = "margin-right:15px;">
		<input type = "button" class = "replyWriteBtn btn btn-primary" value = "목록으로" onclick = "location.href='boardMain.do'">
		</div>
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