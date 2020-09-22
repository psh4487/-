<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>강의 개설 신청</title>
</head>
<body>	
	<div style="padding: 5px"></div>
	<table border="1" class="table table-striped custab">
		<tr>
			<td width="100">번호</td>
			<td width="100">이수구분</td>
			<td width="130">강의명</td>
			<td width="50">강의실</td>
			<td width="50">학점</td>
			<td width="150">시간</td>
			<td width="50">상태</td>
		</tr>
		<c:forEach var="val" items="${sublist}"
			varStatus="status">
			<tr>
				<td width="100">${status.count}</td>
				<td width="100">${val.isu}</td>
				<td width="100">${val.sub_nm}</td>
				<td width="100">${val.subroom_nm}</td>
				<td width="50">${val.credit}</td>
				<td width="100"><c:choose>
				<c:when test="${ val.lec_1 < 10}">월${ val.lec_1%10}</c:when>
				<c:when test="${ val.lec_1 < 20}">화${ val.lec_1%10}</c:when>
				<c:when test="${ val.lec_1 < 30}">수${ val.lec_1%10}</c:when>
				<c:when test="${ val.lec_1 < 40}">목${ val.lec_1%10}</c:when>
				<c:when test="${ val.lec_1 < 50}">금${ val.lec_1%10}</c:when>
				</c:choose> ,
				<c:choose>
				<c:when test="${ val.lec_2 < 10}">월${val.lec_2%10}</c:when>
				<c:when test="${ val.lec_1 < 20}">화${ val.lec_2%10}</c:when>
				<c:when test="${ val.lec_1 < 30}">수${ val.lec_2%10}</c:when>
				<c:when test="${ val.lec_1 < 40}">목${ val.lec_2%10}</c:when>
				<c:when test="${ val.lec_1 < 50}">금${ val.lec_2%10}</c:when>
				</c:choose>,
				<c:choose>
				<c:when test="${ val.lec_3 < 10}">월${val.lec_3%10}</c:when>
				<c:when test="${ val.lec_3 < 20}">화${ val.lec_3%10}</c:when>
				<c:when test="${ val.lec_3 < 30}">수${ val.lec_3%10}</c:when>
				<c:when test="${ val.lec_3 < 40}">목${ val.lec_3%10}</c:when>
				<c:when test="${ val.lec_3 < 50}">금${ val.lec_3%10}</c:when>
				</c:choose></td>
				<td width="100">${val.sub_state}</td>
			</tr>
		</c:forEach>
	</table>
	<br>
	<input type="button"
		onclick="changeContent('codenum.do')" value="개설신청" class='btn btn-dark' />
</body>
</html>