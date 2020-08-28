<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<form name = "form1" action = '<c:url value='writeSubjectBoardPro.do'/>' onsubmit = "return writeSave()" method = "post">
	<div>
		<label for = "titleInput">제목</label>
		<input type = "text" id = "title" name = "title" placeholder = "제목을 입력해 주세요.">
		<c:if test = "${login.mem_no == 2}">
		<input type = "hidden" id = "prof_cd" name = "prof_cd" value = "${login.prof_cd }">
		
		</c:if>
		<select id = "dept_nm" name = "dept_nm">
			<c:forEach var = "list" items = "${dept_nm }">
				<option>${list.dept_nm }</option>
			</c:forEach>
		</select>
	</div>
	<div>
		<label for = "writerInput">작성자</label>
		<c:if test = "${login.mem_no == 2 }">
		<input type = "text" id = "prof_cdWriter" name = "writer" value = "${login.prof_nm }" readonly>
		<input type = "hidden" id = "dept_nm" name = "dept_nm" value = "${login.dept_nm }">
		</c:if>
		<c:if test = "${login.mem_no == 3 || login.mem_no == 4 }">
		<input type = "text" id = "sta_cdWriter" name = "writer" value = "${login.staff_nm }" readonly>
		</c:if>
	</div>
	<div>
		<label for = "contentInput">내용</label>
		<textarea id = "Textarea1" name = "content" rows = "10"></textarea>
	</div>
	<input type = "submit" value = "등록하기" id = "insert">
	<input type = "button" value = "목록으로" onclick = "locaion.href='subjectBoardMain.do'">
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