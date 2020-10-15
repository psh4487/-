<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>강의 개설</title>
<style>
.container {
	    width: auto;
	    max-width: 1140px;
	}
	.btn-dark:focus {
			color: #fff;
		    background-color: #343a40;
		    border-color: #343a40;
		   
		}
	fieldset{
		border:1 solid black;
		}
</style>
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
<div id="openSub" style="padding:5px; margin-left:500px; content-box" >
<form>
	<fieldset style="border:1px solid">
	<c:forEach  items = "${list}" var="list">
		
		<legend style="font-weight:bold;">강의명 &nbsp;:&nbsp; ${list.sub_nm}</legend>
		<br>
		
		이수구분 <input type="text" id = "isu" value="${list.isu}">&nbsp;&nbsp;		
		강의코드 <input type="text" id = "sub_cd" value="${list.sub_cd}"><br><br>
		
		&nbsp;	&nbsp;	&nbsp; &nbsp;	
		시간 <input type="text" id = "lec" value="${list.lec}">&nbsp;	&nbsp;	&nbsp;	&nbsp;	
		교수&nbsp;&nbsp;				<input type="text" id = "prof_nm" value="${list.prof_nm}"><br><br>
		&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	
		학점 <input type="text" id = "credit" value="${list.credit}">&nbsp;	
		강의실 선택 <input type="text" id = "subroom"><br><br>

		강의계획서 <input width="400" type="text" id = "sub_path" value="${list.sub_path}" size=30><br>
	
	</c:forEach>
	
<input type="button" value = "개설 완료"  onclick="check1()" class="btn btn-dark" style="margin-top:30px; margin-left:20px;" >
<input type="button" value = "개설 취소" onclick="check2()"  class="btn btn-dark" style="margin-top:30px; margin-left:20px;">
<input type="button" value = "목록으로" onclick="location.href='StaSub1.do'" class="btn btn-dark" style="margin-top:30px; margin-left:20px;">
</fieldset>
</form>
</div>
</body>
</html>