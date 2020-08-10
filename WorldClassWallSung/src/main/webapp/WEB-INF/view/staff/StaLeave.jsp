<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>휴복학리스트</title>
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>


</head>
<body>

<!-- <hr>
<div id="leaveList">
<table id="table" border="1"></table> -->

<form name="leaveForm" method="post" action="">
<table id="leavetable" border="1">
<tr>
<td>학번</td><td>이름</td><td>연도</td><td>학기</td>
<td>학적변동</td><td>신청일</td><td>승인</td>
</tr>
<tr>
<c:forEach items="${selectLeaveList}" var="list">
<td align="center">${list.stu_no}</td>
			<td align="center">${list.stu_name}</td>
			<td align="center">${list.leave_year}</td>
			<td align="center">${list.leave_sem}</td>
			<td align="center">${list.leave_state}</td>
			<td align="center">${list.leave_dt}</td>
			<td align="center"><button type="submit" width="70" id="${list.no}">승인</button></td>
			

</tr>
		</c:forEach>
	</table>
	</form>	


</body>
</html>

