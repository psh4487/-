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
<form>
<div class = "form-group" align = "center">
	<label for = "title">제목</label><p>
	<input type = "text" style="width:500px;height:34px;" id = "exampleFormControlInput1" name = "title" value = "${no.title }" class = "form-control" readonly>
</div>
<div class = "form-group" align = "center">
	<label for = "writer">작성자</label><p>
	<input type = "text" style="width:500px;height:34px;" id = "exampleFormControlInput1" name = "writer" value = "${no.writer }" class = "form-control" readonly>
</div>
<div class = "form-group" align = "center">
	<label for = "content">내용</label><p>
	<textarea id = "exampleFormControlTextarea1" style="width:500px;" name = "content" rows = "10" class = "form-control" readonly >${no.content }</textarea>
</div>
<div class = "input-group" style = "padding:0px 650px">
<input type = "button" class = "replyWriteBtn btn btn-primary" value = "목록으로" onclick = "location.href='boardMain.do'">
<c:if test = "${login.mem_no == 3 || login.mem_no == 4 }">

<input type = "button" class = "replyWriteBtn btn btn-warning" style="margin-left:15px; margin-right:15px;" value = "수   정" onclick = "fn_update(${no.no})">
<input type = "button" class = "replyWriteBtn btn btn-danger" value = "삭   제" onclick = "fn_delete(${no.no})">	

</c:if>
</div>
</form>
<script>
function fn_update(no){
	var chk = confirm("수정 페이지로 이동합니다.")
	if(chk){
		location.href='updateboardForm.do?no='+no
		}
}
function fn_delete(no){
	var chk = confirm("정말 삭제하시겠습니까?")
	if(chk){
		alert("삭제되었습니다.");
		location.href='deleteboard.do?no='+no
			}
	
}
</script>
</body>
</html>