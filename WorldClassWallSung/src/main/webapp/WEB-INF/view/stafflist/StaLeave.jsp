<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>휴복학리스트</title>
</head>
<body>
		<table id="leavetable" border="1">
			<tr>
				<td>학번</td>
				<td>이름</td>
				<td>연도</td>
				<td>학기</td>
				<td>학적변동</td>
				<td>신청일</td>
				<td>승인</td>
				<td>미승인</td>
			</tr>
	
			<c:forEach items="${selectLeaveList}" var="list">
				<tr>	<td align="center">${list.stu_no}</td>
				<td align="center">${list.stu_name}</td>
				<td align="center">${list.leave_year}</td>
				<td align="center">${list.leave_sem}</td>
				<td align="center">${list.leave_change}</td>
				<td align="center">${list.leave_dt}</td>
				<td align="center"><button type="button" id="${list.no}" onclick="location.href='StaLeavechaUpdate.go?no=${list.no}'">승인</button></td>
				<td align="center"><button type="button" id="${list.no}" onclick="location.href='StaLeavechaNo.go?no=${list.no}'">미승인</button></td>
				</tr>
			</c:forEach>	
		</table>
</body>
</html>

