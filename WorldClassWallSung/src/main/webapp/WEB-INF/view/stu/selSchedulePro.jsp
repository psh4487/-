<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<body>
	<table border="1" style="text-align: center; width: 1280px;">
		<tr>
			<td width="150">교시</td>
			<td width="200">월</td>
			<td width="200">화</td>
			<td width="200">수</td>
			<td width="200">목</td>
			<td width="200">금</td>
		</tr>
		<c:forEach var="i" begin="0" end="8">
			<tr>
				<td>${i+1}교시<br>(${i+8}:00~${i+9}:50)
				</td>
				<c:forEach begin="0" end="0">
					<td>
					<c:forEach  var="list" items="${selSchedulePro}">
					<c:if test="${i+1 == list.lec_1 || i+1 == list.lec_2 || i+1 == list.lec_3}">
									${list.sub_nm}<br>${list.subroom_nm}
							</c:if>
							</c:forEach>
							</td>
				</c:forEach>
				<c:forEach begin="0" end="0">
				<td>
				<c:forEach  var="list" items="${selSchedulePro}">
					<c:if test="${i+11 == list.lec_1 || i+11 == list.lec_2 || i+11 == list.lec_3}">
									${list.sub_nm}<br>${list.subroom_nm}
							</c:if>
							</c:forEach>
							</td>
				</c:forEach>
				<c:forEach begin="0" end="0">
					<td>
					<c:forEach  var="list" items="${selSchedulePro}">
					<c:if test="${i+21 == list.lec_1 || i+21 == list.lec_2 || i+21 == list.lec_3}">
									${list.sub_nm}<br>${list.subroom_nm}
							</c:if>
							</c:forEach>
							</td>
				</c:forEach>
				<c:forEach begin="0" end="0">
					<td>
					<c:forEach  var="list" items="${selSchedulePro}">
					<c:if test="${i+31 == list.lec_1 || i+31 == list.lec_2 || i+31 == list.lec_3}">
									${list.sub_nm}<br>${list.subroom_nm}
							</c:if>
							</c:forEach>
							</td>
				</c:forEach>
				<c:forEach begin="0" end="0">
					<td>
					<c:forEach  var="list" items="${selSchedulePro}">
					<c:if test="${i+41 == list.lec_1 || i+41 == list.lec_2 || i+41 == list.lec_3}">
									${list.sub_nm}<br>${list.subroom_nm}
							</c:if>
							</c:forEach>
							</td>
				</c:forEach>
			</tr>
		</c:forEach>
	</table>
</body>