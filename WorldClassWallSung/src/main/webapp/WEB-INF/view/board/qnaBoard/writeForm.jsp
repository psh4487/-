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
<body>
<form name = "form1" action = '<c:url value='writeQnaPro.do'/>' onsubmit="return writeSave()" method = "post">
	<div align = "center">
		<label for = "title">제목</label>
		<input type = "text" class = "form-control" style = "width:500px;height:34px;" id = "title" name = "title" placeholder = "제목을 작성해 주세요.">
		<c:if test = "${login.mem_no == 1 }">
		<input type = "hidden" id = "stu_no" name = "stu_no" value = "${login.stu_no }">
		</c:if>
		<c:if test = "${login.mem_no == 2 }">
		<input type = "hidden" id = "prof_cd" name = "prof_cd" value = "${login.prof_cd }">
		</c:if>
		<input type = "hidden" id = "mem_no" name = "mem_no" value = "${login.mem_no }">
	</div>
	<div align = "center">
		<label for = "writer">작성자</label>
		<c:if test = "${login.mem_no == 1 }">
		<input type = "text" class = "form-control" style = "width:500px;height:34px;" id = "exampleFormControlInput1" name = "writer" value = "${login.stu_name }" readonly>
		</c:if>
		<c:if test = "${login.mem_no == 2 }">
		<input type = "text" class = "form-control" style = "width:500px;height:34px;" id = "exampleFormControlInput1" name = "writer" value = "${login.prof_nm }" readonly>
		</c:if>
	</div>
	<div align = "center">
		<label for = "content">내용</label>
		<textarea style = "width:500px;" class = "form-control" id = "exampleFromControlTextarea1" name = "content" rows = "10"></textarea>
	</div>
	<div class = "input-group" style = "padding:0px 650px;">
	<input type = "submit" style = "margin-right:15px;" class = "replyWriteBtn btn btn-success"  value = "등록하기" id = "insert">
	<input type = "button" class = "replyWriteBtn btn btn-primary" value = "목록으로" onclick = "location.href='qnaMain.do'">
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