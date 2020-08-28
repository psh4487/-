<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>강의실 시간표 조회</title>
</head>
<script>
$(function(){
	var url="builName.do";
	$.ajax({
		type:"post"		
		,url:url		
		,dataType:"json" })
		.done(function(args){	//응답이 성공 상태 코드를 반환하면 호출되는 함수
			 for(var i=0; i < args.length; i++) {
				 $("#builName").append("<option value='"+args[i].buil_no+"'>"+args[i].buil_no+"</option>");
			 }
 			})
	    .fail(function(e) {
	    	alert(e.responseText);
	    })
});//ready 끝

function selectBuil(){
	var buil_no=$("#builName").val();
	
	if(buil_no=="") {	                
		$("#subroomName option").each(function() {	
			$("#subroomName option:eq(1)").remove();	
		});
		return;
	}
	
	var url="subroomName.do";
	var params="buil_no="+buil_no;
	
	$.ajax({
		type:"post"
		,url:url	
		,data:params
		,dataType:"json"})
		.done(function(args){
			$("#subroomName option").each(function() {	
				$("#subroomName option:eq(0)").remove();
			});

			 $("#subroomName").append("<option value=''>::강의실 선택::</option>");
			 
			 for(var idx=0; idx<args.length; idx++) {	
				 $("#subroomName").append("<option value='"+args[idx].subroom_nm+"'>"+args[idx].subroom_nm+"</option>");	
			 } 
		})
	    .fail(function(e) {

	    	alert(e.responseText);
	    });	
}

$(function() {
	$('#selCheck').click(function() {
		var builName = $('#builName').val();
		var subroomName = $('#subroomName').val();
		if (builName == "") {
			alert("건물을 선택하세요.");
		} else if (subroomName == "") {
			alert("강의실을 선택하세요.");
		} else {
			var subroom_nm=$("#subroomName").val();
			var url="selSchedulePro.do";
			var params="subroom_nm="+subroom_nm;
			$.ajax({
				type:"post"
				,url:url	
				,data:params
				,dataType:"html"})
				.done(function(args){
					var top = "<h1>" +builName+"  "+subroom_nm + " 시간표 </h1>"
					$("#print_pdf").text("");//기존 내용 제거
					$("#print_pdf").html(top + args);
				})
			    .fail(function(e) {
			    	alert(e.responseText);
			    });
		}
	});
});
</script>

<body>
<div style="text-align:left; width:1280px;">
	<select id="builName" onchange="selectBuil()">
		<option value="">::건물 선택::</option>
	</select>
	<select id="subroomName" >
		<option value="">::강의실 선택::</option>
	</select>
	<input type="button" id="selCheck" value="조회" >
</div>
<div id="print_pdf" style="text-align:center; width:1280px;" >
</div>
</body>
</html>