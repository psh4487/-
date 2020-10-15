<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<style>
	.replyList{margin-left:400px;
				margin-top:30px;
				height:50px;
				boder-top:1px solid;
			   }
	
	.rep{margin-left:500px;}
</style>
</head>
<body>
<form>
<div class = "form-group" align = "center">
	<label for = "title">제목</label>
	<input type = "text" class = "form-control" style = "width:500px;height:34px;" id = "exampleFormControlInput1" name = "exampleFormControlInput1" value = "${no.title }" readonly>
</div>
<div class = "form-group" align = "center">
<label for = "writer">작성자</label>
	<input type = "text" class = "form-control" style = "width:500px;height:34px;" id = "exampleFormControlInput1" name = "exampleFormControlInput2" value = "${no.writer }" readonly>
</div>
<div class = "form-group" align = "center">
<label for = "content">내용</label>
	<textarea class = "form-control" id = "exampleFormControlTextarea1" style = "width:500px;" name = "exampleFormControlTextarea1" rows = "10" readonly >${no.content }</textarea>
</div>
<div class = "input-group" style = "padding:0px 650px">
<input type = "button" value = "목록으로" class = "replyWriteBtn btn btn-primary" onclick = "location.href='qnaMain.do'">
<!-- 수정, 삭제는 글 작성에서 stu_no값을 저장, login.stu_no값이 일치하면 출력 -->

<c:if test = "${login.mem_no == 1 && login.stu_no == no.stu_no }">
<input type = "button" style="margin-left:15px; margin-right:15px;" class = "replyWriteBtn btn btn-warning" value = "수   정" onclick = "fn_update(${no.no})">
<input type = "button" class = "replyWriteBtn btn btn-danger" value = "삭   제" onclick = "fn_delete(${no.no})">
</c:if>
<c:if test = "${login.mem_no == 2 && login.prof_cd == no.prof_cd }">
<input type = "button" class = "replyWriteBtn btn btn-warning" style="margin-left:15px; margin-right:15px;" value = "수   정" onclick = "fn_update(${no.no})">
<input type = "button" class = "replyWriteBtn btn btn-danger" value = "삭   제" onclick = "fn_delete(${no.no})">
</c:if>
</div>
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
function deleteReply(no, rno){
	var chk = confirm("정말 삭제하시겠습니까?")
	if(chk){
		alert("삭제되었습니다.")
		location.href="deleteReply.do?no="+no+"&rno="+rno
		}
}
</script>
<c:if test = "${fn:length(replyList) > 0 }">
<div id = "reply">
<table class = "replyList"  >
	<tr>
	<td style='font-size:15px; border-top:1px solid' height=30>작성자</td>
	<td align="center" style='font-size:15px; border-top:1px solid'>내용</td>
	<td style='font-size:15px; border-top:1px solid'>날짜</td>
	
	</tr>
<c:forEach items = "${replyList }" var = "replyList">
	<tr>
	<td width = "80" style='font-size:15px; border-top:1px solid'>${replyList.writer }
	</td><td width = "400" height=30 style="word-break:break-all;font-size:15px; border-top:1px solid">${replyList.content }
	
	</td><td width = "200" style='font-size:15px; border-top:1px solid'>${replyList.regdate }
	</td>
	
	<c:if test = "${login.mem_no == 3 || login.mem_no == 4 }">
	<td>
	<input type = "button" class = "replyWriteBtn btn btn-danger" onclick = "deleteReply(${no.no },${replyList.rno})" value = "댓글 삭제">
	</td>
	</c:if>
	</tr>
	
	
</c:forEach>
</table>

</div>
</c:if>
<form name = "replyForm" action = '<c:url value="insertReply.do"/>' onsubmit="return writeSave()" method = "post">
<input type = "hidden" name = "no" id = "no" value = "${no.no }">
<div class = "form-group" style="margin-left:-200px;">
	<c:if test = "${login.mem_no == 3 || login.mem_no == 4}">
	<input type = "hidden" id = "writer" name = "writer" value = "${login.staff_nm }">
	</c:if>
</div>
	<c:if test = "${login.mem_no == 3 || login.mem_no == 4 }">
	<div class = "form-group">
	<label for = "content" class = "rep">댓글</label>
	
	<input type = "text" size=50 name = "content">
	
	
	
	<input type = "submit" class = "replyWriteBtn btn btn-success" style="margin:0px 0px;" value = "댓글 작성">
	
	
	
	</div>
	
	</c:if>

	
</form>

</body>
</html>