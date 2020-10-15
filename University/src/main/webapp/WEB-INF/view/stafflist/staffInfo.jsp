<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>사원 정보</title>
<script>
$(function(){
	var url="depts.do";
	
	$.ajax({
		type:"post"		
		,url:url		
		,dataType:"json" })
		.done(function(args){	//응답이 성공 상태 코드를 반환하면 호출되는 함수
			 for(var i=0; i < args.length; i++) {
				 $("#dept").append("<option value='"+args[i].staff_dept+"'>"+args[i].staff_dept+"</option>");
			 }
 			})
	    .fail(function(e) {
	    	alert(e.responseText);
	    })
});//ready 끝


function selecStaff() {
	var staff_dept=$("#dept").val();

	if(staff_dept==""){	
		$("#listInfo").html("");	
		}else{
	var url="staffList.do";
    var params="staff_dept="+staff_dept;
	$.ajax({
				type : "post",
				url : url,
				data : "staff_dept=" + staff_dept,
				dataType : "json"
			})
			.done(function(args) {
						$("#listInfo").html("");
						$("#listInfo").append(
										"<table id='table' border='1'><tr><td>교직원번호</td><td>이름</td><td>연락처</td><td>이메일</td><td>부서</td></tr></table>");
						for (var i = 0; i < args.length; i++) {
							var str = "<tr><td>" + args[i].staff_no
									+ "</td>" + "<td>" + args[i].staff_nm
									+ "</td>" + "<td>" + args[i].staff_tel
									+ "</td>" + "<td>" + args[i].staff_email
									+ "</td>" + "<td>" + args[i].staff_dept
									+ "</td></tr>";
							$("#listInfo table").append(str);							
						}
					}).fail(function(e) {
				alert(e.responseText);
			});
			}
}
</script>
</head>
<body>
<select id="dept" onchange="selecStaff()">	
  <option value="">::부서선택::</option>
</select>
<div id="listInfo"></div>
</body>
</html>

