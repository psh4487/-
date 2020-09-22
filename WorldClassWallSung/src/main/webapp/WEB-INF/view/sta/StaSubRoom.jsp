<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>강의실 관리</title>
<style>
	th{
		background-color:orange;
		}
	.he{
		height:60px;}
</style>
</head>
<body>
<div id="print_pdf" style="text-align:center; margin-left:200px;">	
	<table border="1" style="text-align:center; width:1150px; font-size:10pt;">
		<tr>
			<th width="100" height = 30>교시</th>
			<th width="100">월</th>
			<th width="100">화</th>
			<th width="100">수</th>
			<th width="100">목</th>
			<th width="100">금</th>
		</tr>
		<c:forEach var="i" begin="0" end="8">
			<tr class = "he">
				<td style = "background-color:orange;">${i+1}교시<br>(${i+8}:00~${i+9}:50)</td>
				<c:forEach begin="0" end="0">
					<td>
						<c:forEach var="list" items="${list}">
							<c:if test="${i+1 == list.lec_1 || i+1 == list.lec_2 || i+1 == list.lec_3}">
									${list.sub_nm}
							</c:if>
						</c:forEach>
					</td>
				</c:forEach>
				<c:forEach begin="0" end="0">
					<td>
						<c:forEach var="list" items="${list}">
							<c:if test="${i+11 == list.lec_1 || i+11 == list.lec_2 || i+11 == list.lec_3}">
									${list.sub_nm}
							</c:if>
						</c:forEach>
					</td>
				</c:forEach>
				<c:forEach begin="0" end="0">
					<td>
						<c:forEach var="list" items="${list}">
							<c:if test="${i+21 == list.lec_1 || i+21 == list.lec_2 || i+21 == list.lec_3}">
									${list.sub_nm}
							</c:if>
						</c:forEach>
					</td>
				</c:forEach>
				<c:forEach begin="0" end="0">
					<td>
						<c:forEach var="list" items="${list}">
							<c:if test="${i+31 == list.lec_1 || i+31 == list.lec_2 || i+31 == list.lec_3}">
									${list.sub_nm}
							</c:if>
						</c:forEach>
					</td>
				</c:forEach>
				<c:forEach begin="0" end="0">
					<td>
						<c:forEach var="list" items="${list}">
							<c:if test="${i+41 == list.lec_1 || i+41 == list.lec_2 || i+41 == list.lec_3}">
									${list.sub_nm}
							</c:if>
						</c:forEach>
					</td>
				</c:forEach>
			</tr>
		</c:forEach>
	</table>	
</div>
</body>
</html>