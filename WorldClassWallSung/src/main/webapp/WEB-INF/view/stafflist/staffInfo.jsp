<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>사원 정보</title>
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
										"<table id='table' class='table table-striped custab' style='text-align: center; width: 1000px;'><tr><td>교직원번호</td><td>이름</td><td>연락처</td><td>이메일</td><td>부서</td></tr></table>");
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
<br> 
<br>
<div id="listInfo"></div>
</body>
</html>

