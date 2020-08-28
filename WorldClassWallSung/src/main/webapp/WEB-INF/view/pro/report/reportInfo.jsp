<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>과제제출 내역</title>
<script>
$(function(){
	var url="reportsub.do";
	$.ajax({
		type:"post"		
		,url:url		
		,dataType:"json" })
		.done(function(args){//응답이 성공 상태 코드를 반환하면 호출되는 함수
			 for(var i=0; i <args.length; i++) {
				 $("#sub").append("<option value='"+args[i].sub_cd+"'>"+args[i].sub_nm+"</option>");
			 }
 			})
	    .fail(function(e) {
	    	alert(e.responseText);
	    })
});//ready 끝
function selectsub(){
	var sub_cd=$("#sub").val();
	var url="reportall.do";
    var params="sub_cd="+sub_cd;
    if(sub_cd ==""){
    	$("#reportInfo").html("");
    }else{ 
    $.ajax({
				type : "post",
				url : url,
				data : "sub_cd="+sub_cd,
				dataType : "json"
			})
			.done(
					function(args) {
						$("#reportInfo").html("");
						$("#reportInfo").append(
										"<table id='table' border='1'><tr><td>번호</td><td>학번</td><td>이름</td><td>제목</td><td>상태</td><td>작성일</td></tr></table>");
						for (var i = 0; i<args.length;i++) {
							var str="<tr><td>"+(i+1)
							        + "</td>" + "<td>"+args[i].stu_no
									+ "</td>" + "<td>" +args[i].stu_name
									+ "</td>" + "<td>"+"<a href='#' onclick='clickGo1("+args[i].stu_no+")'>" +args[i].report_nm
									+ "</td>" + "<td>" +args[i].report_state
									+ "</td>" + "<td>" +args[i].report_dt
									+ "</td></tr>";
							$("#reportInfo  table").append(str);							
						}
					}).fail(function(e) {
				alert(e.responseText);
			})
	}
}
	
function clickGo1(name){
	$("#reportInfo").html("");
   $("#reportInfo").load("reportform.do?stu_no="+name+"&sub_cd="+$("#sub").val());	
}
</script>
</head>
<body>
	<select id="sub"  onchange="selectsub()" >	
		<option value="">::과목::</option>
	</select>
<hr>
<div id="reportInfo">
</div>
</body>
</html>

