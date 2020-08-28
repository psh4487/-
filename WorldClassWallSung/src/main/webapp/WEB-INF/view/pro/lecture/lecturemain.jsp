<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>강의 개설 신청</title>
</head>
<body>	
	<div style="padding: 5px"></div>
	<table border="1" style="text-align: center;">
		<tr>
			<td width="100">번호</td>
			<td width="100">이수구분</td>
			<td width="100">강의명</td>
			<td width="50">학점</td>
			<td width="150">시간</td>
			<td width="50">상태</td>
		</tr>
		<c:forEach var="val" begin="0" end="9" items="${sublist}"
			varStatus="status">
			<tr>
				<td width="100">${status.count}</td>
				<td width="100">${val.isu}</td>
				<td width="100">${val.sub_nm}</td>
				<td width="50">${val.credit}</td>
				<td width="100">${val.lec_1},${val.lec_2},${val.lec_3}</td>
				<td width="100">${val.sub_state}</td>
			</tr>
		</c:forEach>
	</table>
	<br>
	<input type="button"
		onclick="changeContent('codenum.do')" value="개설신청" /> <c:if
			test="${count > 0}">
			<c:set var="pageCount"
				value="${count / pageSize + ( count % pageSize == 0 ? 0 : 1)}" />
			<c:set var="pageBlock" value="${10}" />
			<fmt:parseNumber var="result" value="${currentPage / 10}"
				integerOnly="true" />
			<c:set var="startPage" value="${result * 10 + 1}" />
			<c:set var="endPage" value="${startPage + pageBlock-1}" />
			<c:if test="${endPage > pageCount}">
				<c:set var="endPage" value="${pageCount}" />
			</c:if>
			<c:if test="${startPage > 10}">
				<a href="/MVC_board/MVC/list.do?pageNum=${startPage - 10 }">[이전]</a>
			</c:if>

			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<a href="/MVC_board/MVC/list.do?pageNum=${i}">[${i}]</a>
			</c:forEach>

			<c:if test="${endPage < pageCount}">
				<a href="/MVC_board/MVC/list.do?pageNum=${startPage + 10}">[다음]</a>
			</c:if>
		</c:if>
</body>
</html>