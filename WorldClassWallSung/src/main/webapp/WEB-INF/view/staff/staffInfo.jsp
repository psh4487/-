<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>사원 정보</title>
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>

<script>
$(function(){
	var url="depts";
	
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

	var url="staffList";
    var params="staff_dept="+staff_dept;
	$.ajax({
				type : "post",
				url : url,
				data : "staff_dept=" + staff_dept,
				dataType : "json"
			})
			.done(
					function(args) {
						$("#listInfo table").html("");
						$("#listInfo table").append(
										"<tr><td>교직원번호</td><td>이름</td><td>연락처</td><td>이메일</td><td>부서</td></tr>");
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
			})

}







/* function selecStaff(){
	var staff_dept=$("#dept").val();

	var url="staffList";
    var params="staff_dept="+staff_dept;

	$.ajax({
		type:"post"
		,url:url	
		,data:params
		,dataType:"json"})
		.done(function(args){
		
			var staff_no = "번호 : "+args.staff_no+"<br>"; 
			var staff_nm = "이름: "+args.staff_nm+"<br>";
			var staff_tel = "연락처 : "+args.staff_tel+"<br>";
			var staff_email = "이메일 : "+args.staff_email+"<br>";
			var staff_dept = "부서 : "+args.staff_dept+"<br>";
		
			
			$("#listInfo").text("");//기존 내용 제거
			$("#listInfo").html(staff_nm+staff_tel+staff_email+staff_dept);
		})
	    .fail(function(e) {
	    	alert(e.responseText);
	    });	
} */
 

</script>

</head>
<body>

<select id="dept" onchange="selecStaff()">	
  <option value="">::부서선택::</option>
</select>

<hr>
<div id="listInfo">
<table id="table" border="1"></table>
<!-- <table border="1" id="listInfo"> -->
	
</div>
</body>
</html>

