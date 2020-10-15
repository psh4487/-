<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>휴복학</title>
<style>
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
	$(function() {
		$('#func').click(function() {
			var leave_year = $('select[name=leave_year]').val();
			var leave_sem = $('select[name=leave_sem]').val();
			var leave_change = $('select[name=leave_change]').val();
			if (leave_year == "") {
				alert("연도를 선택하세요.");
			} else if (leave_sem == "") {
				alert("학기를 선택하세요.");
			} else if (leave_change == "") {
				alert("학적을 선택하세요.");
			} else {
				var confirm_test = confirm("휴/복학 신청을 하시겠습니까 ?");
			    if ( confirm_test == true ) {
					$('#subm').submit();
			    } else if ( confirm_test == false ) {
			        return;
			    }
			}
		});
	});
</script>
</head>
<body>
	<div class="container" style="align-content: center;">
		<h2> 휴복학 신청 </h2>
		<form id="subm" action="leaveSave.do" method="post">
			<form:select class="container" path="leave_year" name="leave_year">
				<option value="">::연도선택::</option>
				<form:options items="${leave_year}" />
			</form:select>
			&nbsp;
			<form:select class="container" path="leave_sem" name="leave_sem">
				<option value="">::학기선택::</option>
				<form:options items="${leave_sem}" />
			</form:select>
			&nbsp;
			<form:select class="container" path="leave_change" name="leave_change">
				<option value="">::학적변동::</option>
				<form:options items="${leave_change}" />
			</form:select>
			&nbsp;&nbsp;
			<input type="hidden" name="stu_no" value="${login.stu_no}">
	        <input type="button" class="btn btn-dark btn-file" id="func" value="신청">
		</form><br>
		<hr>
		<div class="row col-md-6 col-md-offset-2 custyle">
		<h2>학적변동 내역</h2>
			<table style="text-align: center;" class="table table-striped custab">
			<thead>
				<tr>
					<th>휴학 연도</th>
					<th>휴학 학기</th>
					<th>학적 뱐동</th>
					<th>휴학 신청 날짜</th>
					<th>처리 상태</th>
				</tr>
			</thead>
				<c:forEach items="${allData}" var="leaveD">
					<tr>
						<td>${leaveD.leave_year}</td>
						<td>${leaveD.leave_sem}</td>
						<td>${leaveD.leave_change}</td>
						<td>${leaveD.leave_dt}</td>
						<td>${leaveD.leave_state}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>