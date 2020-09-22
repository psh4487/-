<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>강의평가 내역</title>
<script>
function selectMain(){
	 var flag = $("#mainS").val();
	
	 if(flag ==""){		
		 $("#sub").hide();
		 $("#sub1").hide();
		 $("#EstimationInfo").html("");
	 }
	 if(flag =="1"){
		 $("#EstimationInfo").html("");
		 $("#sub").show();
		 $("#sub1").hide();
	 }
	if(flag == "2"){
		$("#EstimationInfo").html("");		
		 $("#sub1").show();
		 $("#sub").hide();
	}		
}

$(function(){
	var url="Estimationsub.do";
	$.ajax({
		type:"post"		
		,url:url		
		,dataType:"json" })
		.done(function(args){//응답이 성공 상태 코드를 반환하면 호출되는 함수			 
			 for(var i=0; i < args.length; i++) {			
				 $("#sub").append("<option value='"+args[i].sub_cd+"'>"+args[i].sub_nm+"</option>");
				 $("#sub1").append("<option value='"+args[i].sub_cd+"'>"+args[i].sub_nm+"</option>");
			 }
 			}).fail(function(e) {
	    	alert(e.responseText);
	    })
	   $("#sub,#sub1").hide(); 	    
});//ready 끝

function selectsub(){
	var sub_cd=$("#sub").val();
	var url="estall.do";
    var param="sub_cd="+sub_cd;
   
    if(sub_cd ==""){
    	$("#EstimationInfo").html("");
    }else{    	
    	$.ajax({
				type : "post",
				url : url,
				data : param,
				dataType : "json"
			})
			.done(
					function(args) {
						$("#EstimationInfo").html("");
						$("#EstimationInfo").append(
								"<table id='table' border='1'class='table table-striped custab' style='text-align: center; width: 1000px;'><tr><td>이름</td><td>상태</td></tr></table>");
						for (var i = 0; i<args.length;i++) {
							var str="<tr><td>"+"<a href='#' onclick='clickGo1("+args[i].stu_no+")'>" +"익명"
									+"</td>" + "<td>" +args[i].est_state	
									+ "</td></tr>";
							$("#cc").val(args[i].sub_cd);		
							$("#EstimationInfo table").append(str);
							
						}
					}).fail(function(e) {
				alert(e.responseText);
			})
    }
}
function select(){
	var sub_cd=$("#sub1").val();
	var url="Estimationsub.do"; 
    if(sub_cd ==""){
    	$("#EstimationInfo").html("");
    }else{
    	 $.ajax({ type : "post",
				url : url,				
				dataType : "json"
			})
			.done(function(args) {
						$("#EstimationInfo").html("");						
						$("#EstimationInfo").load("Estimationvalueform.do?sub_cd="+sub_cd);	
					}).fail(function(e) {
				alert(e.responseText);
			})
    }
}

function clickGo1(name){
		$("#EstimationInfo").html("");
		var sub_cd = $("#cc").val();
       $("#EstimationInfo").load("Estimationform.do?stu_no="+name+"&sub_cd="+sub_cd);	
}
</script>

</head>
<body>
<div class="container"  style="float: left; width: 50%; margin:30px;">
<h2>강의 평가</h2>
<div class="container" style="width: 437px;">
<div style="float: left; width: 50%; margin:30px;">
<select id="mainS" onchange="selectMain()">	
	<option value="">::강의평가::</option>
	<option value="1">학생별 평가 점수</option>
	<option value="2">종합 평가 점수</option>
</select>
<select id="sub" onchange="selectsub()" >	
	<option value="">::과목::</option>
</select>
<select id="sub1" onchange="select()" >	
	<option value="">::과목::</option>
</select>
<input type="text" id ="cc" hidden="">
<hr>
<div id="EstimationInfo"></div>
</div>
</div>
</div>
</body>
</html>
