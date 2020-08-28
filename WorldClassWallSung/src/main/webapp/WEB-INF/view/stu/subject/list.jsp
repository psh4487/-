<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>이수 학점</title>
</head>
<body>
<div align = "center">
	<form id = "isu" name = "isu" method = "post">
		<table border = "1" >
			<thead>
				<tr>
					<th>이수구분</th>
					<th>강의명</th>
					<th>강의코드</th>
					<th>학점</th>
					<th>연도</th>
					<th>학기</th>
				</tr>
			</thead>
		<tbody>
			<c:forEach var = "result" items = "${list}">
				<tr>
					<td>${result.isu }</td>
					<td>${result.sub_nm }</td>
					<td>${result.sub_cd }</td>
					<td>${result.credit }</td>
					<td>${result.years }</td>
					<td>${result.sem }</td>
				</tr>
			</c:forEach>
		</tbody>
		</table>
	<table border = 1>
		<tr>
		<td colspan = 6 align = center>이수학점</td>
		</tr>
		<tr>
			<td>전공</td>
			<td>${count}</td>
			<td>교양</td>
			<td>${count1}</td>
			<td>총합</td>
			<td>${count2}</td>
	</table>
	
	</form>
</div>

</body>
</html>