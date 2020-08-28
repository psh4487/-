<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상담상세보기</title>
</head>
<body>
	<form name="form1" method="post">
		<table class="cou_view">
			<colgroup>
				<col width="15%" />
				<col width="35%" />
				<col width="15%" />
				<col width="35%" />
			</colgroup>
			<caption style="background-color: #ccc">상담신청상세보기</caption>			
				<c:forEach var="list" items="${list}">
			<tbody>
				<tr>
					<th scope="row">글 번호</th>
					<td>${list.cs_no}</td>
				<tr>
					<th scope="row">작성자</th>
					<td>${list.stu_name}</td>
					<th scope="row">작성시간</th>
					<td>${list.cs_date}</td>
				</tr>
				<tr>
					<th scope="row">제목</th>
					<td colspan="3">${list.cs_nm}</td>
				</tr>
				<tr>
					<td colspan="4" style="border: 1px solid #ccc; height: 100px;">${list.cs_con}</td>
				</tr>
				<tr>	
				<td><button type="button"  id="승인" onclick="location.href='cs_stateok.do?cs_no=${list.cs_no}'">승인</button></td>
				<td><button type="button" id="미승인" onclick="location.href='cs_statenot.do?cs_no=${list.cs_no}'">미승인</button></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<br>
		<button type="button" onclick="location.href='couInfo.do' ">신청목록</button>
	</form>	
</body>
</html>
