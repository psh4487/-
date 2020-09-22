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
<form>
<div class = "form-group" align = "center">
	<label for = "title">제목</label>
	<input type = "text" class = "form-control"  style = "width:500px;height:34px;"id = "titlecontrol" name = "title" value = "${no.title }" readonly>
</div>
<div class = "form-group" align = "center">
	<label for = "writerControl">작성자</label>
	<input type = "text" style = "width:500px; height:34px;" class = "form-control" id = "writercontrol" name = "writer" value = "${no.writer }" readonly>
</div>
<div class = "form-group" align = "center">
	<label for = "textarea">내용</label>
	<textarea id = "textarea1" style = "width:500px" class = "form-control" name = "content" rows="10" readonly>${no.content }</textarea>
</div>
<div class = "input-group" style = "padding:0px 650px">
<input type = "button" value = "목록으로" class = "replyWriteBtn btn btn-primary" onclick = "location.href='subjectBoardMain.do'">
<c:if test = "${login.mem_no == 2 && login.prof_cd == no.prof_cd }">

<input type = "button" style = "margin:15px 15px" value = "수	정" class = "replyWriteBtn btn btn-warning" onclick = "fn_update(${no.no})">
<input type = "button" value = "삭	제" class = "replyWriteBtn btn btn-danger" onclick = "fn_delete(${no.no})">
</c:if>
<c:if test = "${login.mem_no == 3 || login.mem_no == 4 }">
<input type = "button" style = "margin:15px 15px;" value = "수	정" class = "replyWriteBtn btn btn-warning" onclick = "fn_update(${no.no})">
<input type = "button" value = "삭	제" class = "replyWriteBtn btn btn-danger" onclick = "fn_delete(${no.no})">
</c:if>
</div>
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