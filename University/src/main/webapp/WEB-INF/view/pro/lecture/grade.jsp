<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>성적 관리</title>
</head>
<style>
.swal2-popup {
	width: auto;
}
.swal2-title {
	font-size: 14px;
}

.swal2-styled.swal2-confirm {
	font-size: 10px;
}
.col-md-6 {
    width: 600px;
    max-width: 100%;
}
</style>
<script>
$(function(){
	var url="subname.do";	
	$.ajax({
		type:"post"	
		,url:url		
		,dataType:"json" })
		.done(function(args){
				//응답이 성공 상태 코드를 반환하면 호출되는 함수
			 for(var i=0; i < args.length; i++) {
				 $("#subname").append("<option value='"+args[i].sub_cd+"'>"+args[i].sub_nm+"</option>");
			 }
 			})
	    .fail(function(e) {
	    	alert(e.responseText);
	    })
});//ready 끝
$(function(){
	var url="testScore.do";	
	$.ajax({
		type:"post"	
		,url:url		
		,dataType:"json" })
		.done(function(args){
				//응답이 성공 상태 코드를 반환하면 호출되는 함수
			 $("#empInfo").append("<table class='table table-striped custab' id='emp'><tr><td>과목명</td><td>학번</td><td>학생이름</td><td>중간</td><td>기말</td><td>과제</td><td>출석</td><td>총합</td><td>등급</td><td>평균</td></tr></table>");
			 for(var i=0; i < args.length; i++) {
				 var str="<tr><td>"+args[i].sub_nm
			        + "</td>" + "<td>"+args[i].stu_no
					+ "</td>" + "<td>" +args[i].stu_name
					+ "</td>" + "<td>"+args[i].mid_score
					+ "</td>" + "<td>" +args[i].end_score
					+ "</td>" + "<td>" +args[i].report_score
					+ "</td>" + "<td>" +args[i].attend_score
					+ "</td>" + "<td>" +args[i].attend_sum
					+ "</td>" + "<td>" +args[i].attend_grade
					+ "</td>" + "<td>" +args[i].attend_rating
					+ "</td></tr>";
				 $("#emp").append(str);
			 }
 			})
	    .fail(function(e) {
	    	alert(e.responseText);
	    })
});//ready 끝
function selectPerson(){	  	    			
			var subname=$("#subname option:selected").html();
			var stuname=$("#stuname option:selected").html();
			var stuno=$("#stuname option:selected").val();
			var subcd=$("#subname option:selected").val();			
			$("#subname1").val(subname);
			$("#stuname1").val(stuname);
			$("#stu_no").val(stuno);			
			$("#sub_cd").val(subcd);
}

 function selectBuil(){
	var stuname = $("#subname :selected").val();
	var url="stuname.do";
	var params="sub_cd="+stuname;	
	console.log(params);
	$.ajax({
		type:"post"
		,url:url	
		,data:params
		,dataType:"json"})
		.done(function(args){
			$("#stuname option").each(function() {	
				$("#stuname option:eq(0)").remove();
			});
			 $("#stuname").append("<option value=''>::학생 선택::</option>");			 
			 for(var idx=0; idx<args.length; idx++) {	
				 $("#stuname").append("<option value='"+args[idx].stu_no+"'>"+args[idx].stu_name+"</option>");	
			 } 
		})
	    .fail(function(e) {
	    	alert(e.responseText);
	    });	
}

 function grade(){ 
	var mid_score = document.getElementById("mid_score").value;
	var end_score = document.getElementById("end_score").value;
	var report_score = document.getElementById("report_score").value;
	var attend_score = document.getElementById("attend_score").value;
	var params="mid_score=" + mid_score+"end_score"+end_score+"report_score"+report_score+"attend_score"+attend_score;
	var sendData = JSON.stringify({mid_score:$('#mid_score').val(), end_score:$('#end_score').val(),report_score:$('#report_score').val(),attend_score:$('#attend_score').val()});
	var arr = [mid_score,end_score,report_score,attend_score]; 
	var sum =0;	
	
	for(var i=0; i<arr.length; i++){
			sum += parseInt(arr[i]);
		}
	if(90<=sum){
		$("#gra").val("A+");		
		$("#sum").val(sum);		
		}
	else if(sum>=80&&sum<=89){	
		$("#gra").val("A");
		$("#sum").val(sum);	  
		}
	else if(sum>=70&&sum<=79){	
		$("#gra").val("B+");
		$("#sum").val(sum);   
		}
	else if(sum>=60&&sum<=69){		 
		$("#gra").val("B"); 
		$("#sum").val(sum);   
		}
	else if(sum>=50&&sum<=59){		
		$("#gra").val("C+"); 
		$("#sum").val(sum);  
		}
	if(sum>=40&&sum<=49){		 
		$("#gra").val("C");  
		$("#sum").val(sum); 
		}
	else if(sum>=30&&sum<=39){
		$("#gra").val("D+"); 
		$("#sum").val(sum);	 
		}
	else if(sum>=20&&sum<=29){		
		$("#gra").val("D");  
		$("#sum").val(sum);  
		}
	else if(sum>=0&&sum<=19){		
		$("#gra").val("F");  
		$("#sum").val(sum);
		}
};

$(document).on("keyup", "input[name=mid_score]", function() {
    var val= $(this).val();

    if(val.replace(/[0-9]/g, "").length > 0) {
        alert("숫자만 입력해 주십시오.");
        $(this).val('');
    }
    if(val < 1 || val > 35) {
        alert("1~35 범위로 입력해 주십시오.");
        $(this).val('');
    }
});

$(document).on("keyup", "input[name=end_score]", function() {
    var val= $(this).val();

    if(val.replace(/[0-9]/g, "").length > 0) {
        alert("숫자만 입력해 주십시오.");
        $(this).val('');
    }
    if(val < 1 || val > 40) {
        alert("1~40 범위로 입력해 주십시오.");
        $(this).val('');
    }
});

$(document).on("keyup", "input[name=report_score]", function() {
    var val= $(this).val();

    if(val.replace(/[0-9]/g, "").length > 0) {
        alert("숫자만 입력해 주십시오.");
        $(this).val('');
    }
    if(val < 1 || val > 15) {
        alert("1~15 범위로 입력해 주십시오.");
        $(this).val('');
    }
});

$(document).on("keyup", "input[name=attend_score]", function() {
    var val= $(this).val();

    if(val.replace(/[0-9]/g, "").length > 0) {
        alert("숫자만 입력해 주십시오.");
        $(this).val('');
    }
    if(val < 1 || val > 10) {
        alert("1~10 범위로 입력해 주십시오.");
        $(this).val('');
    }
});
function checkIt(){
	var a = $("#subname1").val()
	var b = $("#stuname1").val()
	var c = $("#mid_score").val()
	var d = $("#report_score").val()
	var e = $("#end_score").val()
	var f = $("#attend_score").val()	
	
	if (!a){	                  
		alert("강의를 선택하세요.");		
		return false;
	}
	if (!b){	                  
		alert("학생을 선택하세요.");		
		return false;
	}
	if (!c){	                  
		alert("중간 점수를 입력하세요.");
		document.myForm.mid_score.focus();
		return false;
	}
	if (!d){	                  
		alert("과제 점수를 입력하세요.");
		document.myForm.report_score.focus();
		return false;
	}
	if (!e){	                  
		alert("기말 점수를 입력하세요.");
		document.myForm.end_score.focus();
		return false;
	}
	if (!f){	                  
		alert("출석 점수를 입력하세요.");
		document.myForm.attend_score.focus();
		return false;
	}	
	if (confirm("성적을 입력하시겠습니까?") == true){    //확인	 
		  return true;
		 }else{   //취소
		     return false;
		}
}
</script>
<body>
	<select id="subname" onchange="selectBuil()">
		<option value="">::강의 선택::</option>
	</select>
	<select id="stuname" onchange="selectPerson()" >
		<option value="">::학생 선택::</option>
	</select>
	<br>	
	&nbsp;&nbsp;강의명 : <input type="text" style="margin-left: 1.81px;" id="subname1" name="subname1" readonly="readonly">&nbsp;
	&nbsp;&nbsp;&nbsp;학생명 : <input type="text" id="stuname1" name="stuname1" readonly="readonly"> <br>
<form action="test.do" onsubmit="return checkIt()" name="myForm">
	<input type="hidden" id="sub_cd" name="sub_cd"> 
	<input type="hidden" id="stu_no" name="stu_no">
	<br>
	중간(35) : <input type="text" id="mid_score" name="mid_score">&nbsp;	
	과제(15) : <input type="text" id="report_score" name="report_score"> <br>
	기말(40) : <input type="text" id="end_score" name="end_score">&nbsp;
	출석(10) : <input type="text" id="attend_score" name="attend_score"> <br>
	&nbsp;&nbsp;&nbsp;&nbsp;합계 :&nbsp;&nbsp; <input type="text" style="margin-left: 0.5px;" id="sum" readonly="readonly">&nbsp;&nbsp;&nbsp;&nbsp;등급 : &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" style="margin-left: 1.4px;" id="gra" readonly="readonly"><br>
	<input class="btn btn-dark" type="submit" value="성적 입력">
	<input class="btn btn-dark" type="button" id="save" value="계산" onclick="grade()"> <br>
</form>
<br>
	<div id="empInfo" class="row col-md-6 col-md-offset-2 custyle"></div>
</body>
</html>