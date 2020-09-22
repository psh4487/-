<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>휴강 신청 내역</title>	
	<script>
	$(function(){		
		var url="viewlist.do";		
		$.ajax({
			type:"post"		
			,url:url		
			,dataType:"json" })
			.done(function(args){	
						 $("#data table").append(
							"<tr><td>번호</td><td>교수</td><td>강의명</td><td>휴강일</td><td>승인</td><td>미승인</td></tr>");
				 for(var i=0; i < args.length; i++) {							
									var c = i+1
									var str = "<tr><td>" + c
									+ "</td>" + "<td>" + args[i].prof_nm
									+ "</td>" + "<td>" + "<a href='StaRest2.do?sub_nm="+args[i].sub_cd+"'>" + args[i].sub_nm +"</a>"
									+ "</td>" + "<td>" + args[i].noclass_dt
									+ "</td>" + "<td>" + "<input type='button' value='승인' onclick = 'check1(this)' id = '"+args[i].sub_cd+"'>"
									+ "</td>" + "<td>" + "<input type='button' value='미승인' onclick = 'check2(this)'id = '"+args[i].sub_cd+"'>"
									+ "</td></tr>";
									$("#data table").append(str);	
				 }
	 			})
		    .fail(function(e) {
		    	alert("경고");
		    })
	});
function check1(e){	
	if (confirm("승인하시겠습니까?") == true){    //확인
	  /*  	$(e).hide(); */	
	    $("#content").children().remove();
	    $("#content").load("accept.do?sub_cd="+e.id);
	 }else{   //취소
	     return false;
		 }
	}	

function check2(e){		
	if (confirm("미승인하시겠습니까?") == true){    //확인
	 /*   $(e).hide(); */	 
	   $("#content").children().remove();
	    $("#content").load("naccept.do?sub_cd="+e.id);
	 }else{   //취소
	     return false;
		 }
	}
	</script>
</head>
<body>
	<div id="data">
		<table id="table" border="1"></table>
	</div>
</body>
</html>