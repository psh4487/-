<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<form name = "form1" action = '<c:url value='writeQnaPro.do'/>' onsubmit="return writeSave()" method = "post">
	<div>
		<label for = "exampleFormControlInput1">제목</label>
		<input type = "text" id = "title" name = "title" placeholder = "제목을 작성해 주세요.">
		<c:if test = "${login.mem_no == 1 }">
		<input type = "hidden" id = "stu_no" name = "stu_no" value = "${login.stu_no }">
		</c:if>
		<c:if test = "${login.mem_no == 2 }">
		<input type = "hidden" id = "prof_cd" name = "prof_cd" value = "${login.prof_cd }">
		</c:if>
		<input type = "hidden" id = "mem_no" name = "mem_no" value = "${login.mem_no }">
	</div>
	<div>
		<label for = "exampleFormControlInput1">작성자</label>
		<c:if test = "${login.mem_no == 1 }">
		<input type = "text" id = "exampleFormControlInput1" name = "writer" value = "${login.stu_name }" readonly>
		</c:if>
		<c:if test = "${login.mem_no == 2 }">
		<input type = "text" id = "exampleFormControlInput1" name = "writer" value = "${login.prof_nm }" readonly>
		</c:if>
	</div>
	<div>
		<label for = "exampleFormControlTextarea1">내용</label>
		<textarea id = "exampleFromControlTextarea1" name = "content" rows = "10"></textarea>
	</div>
	<input type = "submit" value = "등록하기" id = "insert">
	<input type = "button" value = "목록으로" onclick = "location.href='qnaMain.do'">
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