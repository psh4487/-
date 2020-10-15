<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>과제제출 내역</title>
<style>
.form-control {
   width: auto;;
}


.table {
   width:700px;
}
	html {
		background: url(images/bg.jpg) no-repeat 50% 50% fixed;
		-webkit-background-size: cover;
		-moz-background-size: cover;
		-o-background-size: cover;
		background-size: cover;
	}

	.container {
	    width: auto;
	    max-width: 1140px;
	}
	
	.table td, .table th {
	    padding: .30rem;
	}
	.btn-file {
            position: relative;
            overflow: hidden;
        }

    /*     .btn-file input[type=file] {
            position: absolute;
            top: 0;
            right: 0;
            min-width: 100%;
            min-height: 100%;
            font-size: 100px;
            text-align: right;
            filter: alpha(opacity = 0);
            opacity: 0;
            outline: none;
            background: white;
            cursor: inherit;
            display: block;
        } */
        .btn-primary {
            background-color : blue;
            border-color: red;
        }
        .btn {
       		height: 25px;
       		width: 80px;
       		vertical-align: bottom;
       		padding: .0rem .75rem;
       		font-size: 13px;
       	}
       	.col-md-6 {
		    max-width: none;
		}
		.btn-dark:focus {
			color: #fff;
		    background-color: #343a40;
		    border-color: #343a40;
		}
</style>

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
										"<table id='table'border='1' style= 'text-align: center; width: 1000px;'><tr><td>번호</td><td>학번</td><td>이름</td><td>제목</td><td>상태</td><td>작성일</td></tr></table>");
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
<div class="container">
<div class="container" style="width: 437px;">
<div style="float: left; width: 50%; margin:30px;">
	<select id="sub"  onchange="selectsub()" >	
		<option value="">::과목::</option>
	</select>
<hr>
<div id="reportInfo">
</div>
</div>
</div>
</div>
</body>
</html>

