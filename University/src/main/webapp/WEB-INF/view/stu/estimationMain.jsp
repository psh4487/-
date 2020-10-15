<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>교수평가</title>
</head>
<style>
.btn-dark:focus {
			color: #fff;
		    background-color: #343a40;
		    border-color: #343a40;
		}
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
</style>
<script>
function dataCheck(){
	var selData = $('#subject').val();
	<c:forEach var="list" items="${dataCheck}" varStatus="status">
	var dataList${status.count} = ${list.sub_cd};
	if(selData == dataList${status.count}) {
		alert("이미 했어");
		location.reload();
	}
	</c:forEach>
}

$(function() {
	$('#selView').click(function() {
		var sub_cd = $('#subject').val();
		var sub_nm = $('#subject option:selected').html();
		var stu_no = ${login.stu_no} // 여기를 수정하면 됩니다.
		if (sub_cd == "") {
			alert("강의를 선택하세요.");
		} else {
			var url="estimationPro.do";
			$.ajax({
				type:"post"
				,url:url	
				,dataType:"text"})
				.done(function(args){
					var top = "<form action='joinEstimation.do' method='post' name='subdata'>";
					var sub_top = "<h2>" + sub_nm + "<br>강의평가</h2>";
					var bottom = "</form>";
					var sub_cd_data = "<input type='hidden' name='sub_cd' value='" + sub_cd +"'>"
					var stu_no_data = "<input type='hidden' name='stu_no' value='" + stu_no +"'>"
					$("#estimationPro_data").html(top + sub_top + args + sub_cd_data + stu_no_data + bottom);
				})
			    .fail(function(e) {
			    	alert(e.responseText);
			    });
		}
	});
});
</script>

<body>
<div class="container">
<h2>강의 평가</h2>
	<select id="subject" onchange="dataCheck()" >
		<option value="">::강의선택::</option>
		<c:forEach var="list" items="${estimation_subject_List}">
			<option value="${list.sub_cd}">${list.sub_nm}</option>
		</c:forEach>
	</select>
	<input class="btn btn-dark" type="button" value="조회" id="selView">
	<br>
	<div id="estimationPro_data" style="margin: 10px 0px; text-align: center;">
	</div>
</div>
</body>
</html>