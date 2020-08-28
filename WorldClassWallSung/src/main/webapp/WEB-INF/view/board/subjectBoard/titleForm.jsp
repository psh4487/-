<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<form>
<div>
	<label for = "titleControl">제목</label>
	<input type = "text" id = "titlecontrol" name = "title" value = "${no.title }" readonly>
</div>
<div>
	<label for = "writerControl">작성자</label>
	<input type = "text" id = "writercontrol" name = "writer" value = "${no.writer }" readonly>
</div>
<div>
	<label for = "textarea">내용</label>
	<textarea id = "textarea1" name = "content" rows="10" readonly>${no.content }</textarea>
</div>
<input type = "button" value = "목록으로" onclick = "location.href='subjectBoardMain.do'">
<c:if test = "${login.mem_no == 2 && login.prof_cd == no.prof_cd }">
<input type = "button" value = "수	정" onclick = "fn_update(${no.no})">
<input type = "button" value = "삭	제" onclick = "fn_delete(${no.no})">
</c:if>
<c:if test = "${login.mem_no == 3 || login.mem_no == 4 }">
<input type = "button" value = "수	정" onclick = "fn_update(${no.no})">
<input type = "button" value = "삭	제" onclick = "fn_delete(${no.no})">
</c:if>
</form>
<script>
function fn_update(no){
	var chk = confirm("수정 페이지로 이동합니다.")
	if(chk){
		location.href='updateSubjectboardForm.do?no='+no
		}
}
function fn_delete(no){
	var chk = confirm("정말 삭제하시겠습니까?")
	if(chk){
		alert("삭제되었습니다.");
		location.href='deleteSubjectBoard.do?no='+no
			}
	
}
</script>
</body>
</html>