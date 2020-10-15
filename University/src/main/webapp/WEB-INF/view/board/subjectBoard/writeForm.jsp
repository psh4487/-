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
.form-group{padding:5px 500px;}
	.input-group{padding:5px 700px;}
</style>
</head>
<body>
<form name = "form1" action = '<c:url value='writeSubjectBoardPro.do'/>' onsubmit = "return writeSave()" method = "post">
	<div align = "center" class = "form-group">
		<label for = "titleInput">제목</label>
		<input type = "text" class = "form-control" style="width:500px;height:34px;" id = "title" name = "title" placeholder = "제목을 입력해 주세요.">
		<c:if test = "${login.mem_no == 3 || login.mem_no == 4 }">
		<select id = "dept_nm" name = "dept_nm">
			<c:forEach var = "list" items = "${dept_nm }">
				<option>${list.dept_nm }</option>
			</c:forEach>
		</select>
		</c:if>
	</div>
	<div class = "form-group" align = "center">
		<label for = "writerInput">작성자</label>
		<c:if test = "${login.mem_no == 2 }">
		<input type = "text" id = "prof_cdWriter" name = "writer" value = "${login.prof_nm }" class = "form-control" style = "width:500px; height:34px;" readonly>
		<input type = "hidden" id = "prof_cd" name = "prof_cd" value = "${login.prof_cd }">
		<input type = "hidden" id = "dept_nm" name = "dept_nm" value = "${prof_dept_nm }">
		</c:if>
		<c:if test = "${login.mem_no == 3 || login.mem_no == 4 }">
		<input type = "text" id = "sta_cdWriter" name = "writer" value = "${login.staff_nm }" class = "form-control" style = "width:500px; height:34px;" readonly>
		</c:if>
	</div>
	<div class = "form-group" align = "center">
		<label for = "contentInput">내용</label>
		<textarea id = "Textarea1" class = "form-control" style = "width:500px;" name = "content" rows = "10"></textarea>
	</div>
	<div class = "input-group">
	<input type = "submit" value = "등록하기" style = "margin-right:15px;" class = "replyWriteBtn btn btn-success" id = "insert">
	<input type = "button" value = "목록으로" class = "replyWriteBtn btn btn-primary" onclick = "location.href='subjectBoardMain.do'">
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