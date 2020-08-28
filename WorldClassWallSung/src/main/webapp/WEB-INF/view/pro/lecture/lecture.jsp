<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>강의개설</title>
<style>
   #upFile{width:0; height:0; position:absolute; top:0; left:0;}
   .file_upload_btn{cursor:pointer; display: inline-block; background: #000; line-height: 30px; color: #fff; padding: 0px 10px;}
   .code_num{width:40px; display:inline-block;}
</style>
</head>
<body>
<form action="subjecttb.do"  method="post" name="form" enctype="multipart/form-data">
	강의코드 : <input type="text" name="sub_cd" id="sub_cd" value="${sub_cd}" readonly="readonly">
	교수명 : <input type="text" name="교수명" value="${login.prof_nm}">
	<input type="hidden" name="prof_cd" value="${login.prof_cd}">
	<br>
	이수구분 : <select name="isu" onchange="isuNum(this)">
	<option value="">::선택::</option>
	<option>전공필수</option>
	<option>전공선택</option>
	<option>교양필수</option>
	<option>교양선택</option>
	</select>
	학점<input type="text" name="credit" id="credit" readonly="readonly">
	<div class="filewrap">
	강의계획서<input type="text" id="fileName"  name="fileName" readonly="readonly">
	<label for="upFile" class="file_upload_btn">파일 업로드</label>
	<input type="file" id="upFile" name="upFile">
	</div>
	강의명 <input type="text" name="sub_nm" id="sub_nm">
	<input type="hidden" name="dept_cd" id="dept_cd" value="${login.dept_cd}">
	최대 강의 인원(60) : <input type="text" name="max_mem" id="max_mem">	
	<br>
	<input type="button" value="강의실/시간선택" onclick="window.open('lectureroom.do','window팝업','width=600, height=600, menubar=no, status=no, toolbar=no');">
	<input type="text" name="subroom_nm" id="subroom_nm" />
	<input type="hidden" name="check" id="check"/><!-- 보낼값(찐) -->
	<input type="text" name="check1" id="check1"/><!-- 보일값 (짭)-->
	<br>	
	<input type="submit" value="강의신청">
	<input type="button" value="취소" onclick="location.href='main.do'">
</form>
<script>
$(document).ready(function(){
    $('#upFile').change(function(e){
        var fileName = e.target.files[0].name; //getting the file name 
        $('#fileName').val(fileName);
    });
});

function isuNum(e){
	var isu = e.value;
	if(isu.indexOf("전공") != -1){
		$("#credit").val(3)
	}
	if(isu.indexOf("교양") != -1){
		$("#credit").val(2)
	}
}
$(document).on("keyup", "input[name=max_mem]", function() {
    var val= $(this).val();

    if(val.replace(/[0-9]/g, "").length > 0) {
        alert("숫자만 입력해 주십시오.");
        $(this).val('');
    }
    if(val < 1 || val > 60) {
        alert("1~60 범위로 입력해 주십시오.");
        $(this).val('');
    }
});
</script>
</body>
</html>
