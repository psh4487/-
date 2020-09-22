<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>상담 정보</title>
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
					"<table id='t' class='table table-striped custab' style='text-align: center; width: 1000px;'><tr><td>번호</td><td>작성자</td><td>제목</td><td>신청일</td><td>상태</td><td>삭제</td></tr></table>");
				for (var i = 0; i < args.length; i++) {
					var str = "<tr><td>" + args[i].cs_no
								+ "</td>" + "<td>" +args[i].stu_name
								+ "</td>" + "<td>" +"<a href='#' onclick='clickGo1("+args[i].cs_no+")'>" +args[i].cs_nm+"</a>"  
								+ "</td>"+"</a>" + "<td>" + args[i].cs_date
								+ "</td>" + "<td>" +args[i].cs_state
								+ "</td>" + "<td>" +"<input type='button' class='btn btn-dark' value='삭제' onclick=location.href='deletecou.do?cs_no="+args[i].cs_no+"'>"+"</input>"
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
<div class="container">
<div class="container" style="width: 437px;">
<div style="float: left; width: 50%; margin:30px;">

	<select id="sub" onchange="selectsub()">	
	  <option value="">::과목::</option>
	</select>
	
<hr>
	<div id="couInfo"></div>


</div>
</div>
</div>
</body>

</html>

