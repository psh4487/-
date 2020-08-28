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
	<h3>학적변동 내역</h3>
	<table border=1 style="text-align: center;">
		<tr>
			<td width="100">휴학 연도</td>
			<td width="100">휴학 학기</td>
			<td width="100">학적 뱐동</td>
			<td width="150">휴학 신청 날짜</td>
			<td width="100">처리 상태</td>
		</tr>
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
	<h3> 휴복학 신청 </h3>
	<form id="subm" action="leaveSave.do" method="post">
		<form:select path="leave_year" name="leave_year">
			<option value="">::연도선택::</option>
			<form:options items="${leave_year}" />
		</form:select>
		&nbsp;
		<form:select path="leave_sem" name="leave_sem">
			<option value="">::학기선택::</option>
			<form:options items="${leave_sem}" />
		</form:select>
		&nbsp;
		<form:select path="leave_change" name="leave_change">
			<option value="">::학적변동::</option>
			<form:options items="${leave_change}" />
		</form:select>
		<input type="hidden" name="stu_no" value="${login.stu_no}"> <!-- 여기를 수정하면 됩니다. -->
		&nbsp;
		<input type="button" value="신청" id="func">
	</form>
</body>
</html>