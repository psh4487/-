<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<div style="padding: 5px"></div>
	현재 강의목록
	<table border="1" style="text-align: center;">
		<tr>
		<td width="100">강의코드</td>
			<td width="100">강의명</td>
			<td width="100">이수구분</td>
			<td width="50">학점</td>
			<td width="100">강의시간</td>
			<td width="100">강의실</td>
			<td width="100">인원제한</td>
			<td width="100">수강인원</td>
		</tr>
		<c:forEach var="val" begin="0" end="9" items="${sublist}">
			<tr>
				<td width="100"> ${val.sub_cd}</td>
				<td width="100"> ${val.sub_nm}</td>
				<td width="100">${val.isu}</td>
				<td width="50">${val.credit}</td>
				<td width="100">${val.lec_1},${val.lec_2},${val.lec_3}</td>
				<td width="100">${val.subroom_nm}</td>
				<td width="100">${val.max_mem}
				<td width="100">${val.attend_mem}</td>
			</tr>
		</c:forEach>	
	</table><br>
	<input type="button" onclick="changeContent('calendar.do')" value="휴강신청"/>
	<br>
	<hr>
		휴강신청 목록	
	<div style="padding: 5px"></div>
	<table border="1" style="text-align: center;">
		<tr>
			<td width="100">강의코드</td>
			<td width="100">강의명</td>
			<td width="100">이수구분</td>
			<td width="50">휴강신청 날짜</td>
			<td width="100">상태</td>
		</tr>
		<c:forEach var="val" begin="0" end="9" items="${sublist1}">
			<tr>
				<td width="100"> ${val.sub_cd}</td>
				<td width="100"> ${val.sub_nm}</td>
				<td width="100">${val.isu}</td>
				<td width="50">${val.can_dt}</td>
				<td width="100">${val.can_state}</td>				
			</tr>
		</c:forEach>	
	</table> 
</body>
</html>