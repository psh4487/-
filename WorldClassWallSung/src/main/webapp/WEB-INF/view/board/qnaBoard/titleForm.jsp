<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<style>
td:nth-child(3){font-size:1px; text-align:center; padding: 10px 5px;}
</style>
</head>
<body>
<form>
<div>
	<label for = "exampleFormControlInput1">제목</label>
	<input type = "text" id = "exampleFormControlInput1" name = "exampleFormControlInput1" value = "${no.title }" readonly>
</div>
<div>
<label for = "exampleFormControlInput1">작성자</label>
	<input type = "text" id = "exampleFormControlInput1" name = "exampleFormControlInput2" value = "${no.writer }" readonly>
</div>
<div>
<label for = "exampleFormControlTextarea1">내용</label>
	<textarea id = "exampleFormControlTextarea1" name = "exampleFormControlTextarea1" rows = "10" readonly >${no.content }</textarea>
</div>
<input type = "button" value = "목록으로" onclick = "location.href='qnaMain.do'">
<!-- 수정, 삭제는 글 작성에서 stu_no값을 저장, login.stu_no값이 일치하면 출력 -->
<c:if test = "${login.mem_no == 1 && login.stu_no == no.stu_no }">
<input type = "button" value = "수	정" onclick = "fn_update(${no.no})">
<input type = "button" value = "삭 	제" onclick = "fn_delete(${no.no})">
</c:if>
<c:if test = "${login.mem_no == 2 && login.prof_cd == no.prof_cd }">
<input type = "button" value = "수	정" onclick = "fn_update(${no.no})">
<input type = "button" value = "삭 	제" onclick = "fn_delete(${no.no})">
</c:if>
</form>



<script>
function fn_update(no){
	var chk = confirm("수정 페이지로 이동합니다.")
	if(chk){
		location.href='updateQnaForm.do?no='+no
		}
}
function fn_delete(no){
	var chk = confirm("정말 삭제하시겠습니까?")
	if(chk){
		alert("삭제되었습니다.");
		location.href='deleteQna.do?no='+no
			}
	
}
function writeSave(){
	if(!replyForm.content.value){
		alert("내용을 입력하십시오.")
		replyForm.content.focus();
		return false;
		}
}
</script>
<div id = "reply">
<table>
<c:forEach items = "${replyList }" var = "replyList">
	<tr>
	<td>${replyList.writer }</td>
	<td>${replyList.content }</td>
	<td>${replyList.regdate }</td>
</c:forEach>
</table>
</div>
<form name = "replyForm" action = '<c:url value='insertReply.do'/>' onsubmit="return writeSave()" method = "post">
<input type = "hidden" name = "no" id = "no" value = "${no.no }">
<div>
	<c:if test = "${login.mem_no == 3 || login.mem_no == 4}">
	<input type = "hidden" id = "writer" name = "writer" value = "${login.staff_nm }">
	</c:if>

	<c:if test = "${login.mem_no == 3 || login.mem_no == 4 }">
	<label for = "content">댓글</label>
	<input type = "text" id=  "content" name = "content">
	
	<input type = "submit" value = "댓글 작성">
	</c:if>
</div>
	
</form>

</body>
</html>