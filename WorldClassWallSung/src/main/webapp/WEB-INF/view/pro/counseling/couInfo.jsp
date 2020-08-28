<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>상담 정보</title>
<script>
	$(function(){
		var url="sub.do";
		$.ajax({
			type:"post"		
			,url:url		
			,dataType:"json" })
			.done(function(args){//응답이 성공 상태 코드를 반환하면 호출되는 함수
				 for(var i=0; i < args.length; i++) {
					 $("#sub").append("<option value='"+args[i].sub_cd+"'>"+args[i].sub_nm+"</option>");
				 }
	 			})
		    .fail(function(e) {
		    	alert(e.responseText);
		    })
	});//ready 끝

function selectsub() {
	var sub_cd=$("#sub").val();
	var url="couList.do";
    var params="sub_cd="+sub_cd;
    if(sub_cd ==""){
    	$("#couInfo").html("");
    }else{ 
    
    $.ajax({
			type : "post",
			url : url,
			data : "sub_cd="+sub_cd,
			dataType : "json"
			})
			.done(function(args) {
				$("#couInfo").html("");
				$("#couInfo").append(
					"<table id='t' border='1'><tr><td>번호</td><td>작성자</td><td>제목</td><td>신청일</td><td>상태</td><td>삭제</td></tr></table>");
				for (var i = 0; i < args.length; i++) {
					var str = "<tr><td>" + args[i].cs_no
								+ "</td>" + "<td>" +args[i].stu_name
								+ "</td>" + "<td>" +"<a href='#' onclick='clickGo1("+args[i].cs_no+")'>" +args[i].cs_nm+"</a>"  
								+ "</td>"+"</a>" + "<td>" + args[i].cs_date
								+ "</td>" + "<td>" +args[i].cs_state
								+ "</td>" + "<td>" +"<input type='button' value='삭제' onclick=location.href='deletecou.do?cs_no="+args[i].cs_no+"'>"+"</input>"
								+ "</td>"+"</tr>";
					$("#couInfo table").append(str);
							
				}
			}).fail(function(e) {
				alert(e.responseText);
			})
	}
}
	function clickGo1(name){
		$("#couInfo").html("");
		$("#couInfo").load("stucouform.do?cs_no="+name);	
	}
</script>
</head>
<body>
	<select id="sub" onchange="selectsub()">	
	  <option value="">::과목::</option>
	</select>
<hr>
	<div id="couInfo"></div>
</body>
</html>

