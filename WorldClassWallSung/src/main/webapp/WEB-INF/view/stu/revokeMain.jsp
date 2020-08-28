<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>수강철회</title>
<script>
	var max = 0;
	$(function() {
		var count = $(".check").length;
		console.log(count);
		for (var i = 0; i < count; i++) {
			max += parseInt($(".check").html());
			console.log(max);
		}
		$("#revokeMinu").html(max);
	});
	$(function() {
	    <c:forEach var="list" items="${revklist}" varStatus="status">
			$('#subm${status.count}').click(function() {
				var confirm_test = confirm("휴/복학 신청을 하시겠습니까 ?");
					var data${status.count} = $('#subcd_val${status.count}').val();
				  	if(data${status.count} == ${list.sub_cd}) {
						if ( confirm_test == true ) {
				  			location.href='revokeDelete.do?sub_cd=${list.sub_cd}&stu_no=${login.stu_no}' // 여기를 수정하면 됩니다.
						} else if ( confirm_test == false ) {
						    return;
						}
					}
			});
		</c:forEach>
	});
</script>
</head>
<body>
		<div style="height: 600px; width: 700px;">
			<span style="line-height: 190%"><br></span>
			<table border=1 style="text-align: center;">
				<tr>
					<td width="100">강의 코드</td>
					<td width="300">강의명</td>
					<td width="100">이수구분</td>
					<td width="50">학점</td>
					<td width="100">교수명</td>
					<td width="50">철회</td>
				</tr>
				<c:forEach var="list" items="${revklist}" varStatus="status">
					<tr>
						<td id="val${status.count}">${list.sub_cd}</td>
						<td>${list.sub_nm}</td>
						<td>${list.isu}</td>
						<td class="check">${list.credit}</td>
						<td>${list.prof_nm}</td>
						<td>
						<input type="button" value="수강 철회" id="subm${status.count}">
						<input type="hidden" value="${list.sub_cd}" id="subcd_val${status.count}">
						<input type="hidden" value="${login.stu_no}" name="stu_no"> <!-- 여기를 수정하면 됩니다. -->
						</td>
					</tr>
				</c:forEach>
			</table>
			<div style="line-height: 50%;">
				<br>
			</div>
			<input type="hidden" id="savaSum" value="0">
			<table border=1 style="text-align: center; float: right;">
				<tr>
					<td width="120">현재 학점</td>
					<td width="50" id="revokeMinu"></td>
				</tr>
			</table>
		</div>
</body>
</html>