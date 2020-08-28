<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>강의 개설</title>
<script>
function check1(){	
	if (confirm("승인하시겠습니까?") == true){    //확인
		var sub_cd = $("#sub_cd").val();
	    location.href="acceptSub.do?sub_cd="+sub_cd;	   	
	 }else{   //취소
	     return false;
		 }
	}	

function check2(){		
	if (confirm("미승인하시겠습니까?") == true){    //확인
		var sub_cd = $("#sub_cd").val();
	   location.href="nacceptSub.do?sub_cd="+sub_cd;
	 }else{   //취소
	     return false;
		 }
	}
	</script>
</head>
<body>
<div id="openSub">
	<c:forEach  items = "${list}" var="list">
		강의명 &nbsp;:&nbsp; ${list.sub_nm} <br>
		이수구분 <input type="text" id = "isu" value="${list.isu}">
		강의코드 <input type="text" id = "sub_cd" value="${list.sub_cd}">
		시간 <input type="text" id = "lec" value="${list.lec}"><br>
		교수 <input type="text" id = "prof_nm" value="${list.prof_nm}">
		학점 <input type="text" id = "credit" value="${list.credit}">
		강의실 선택 <input type="text" id = "subroom"><br>
		강의계획서 <input type="text" id = "sub_path" value="${list.sub_path}"><br>
	</c:forEach>
<input type="button" value = "개설 완료"  onclick="check1()" >
<input type="button" value = "개설 취소" onclick="check2()">
<input type="button" value = "목록으로" onclick="changeContent('StaSub1.do')">
</div>
</body>
</html>