<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>레포트 관리</title>
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
			<thead style="background-color: #ccc">레포트 상세보기</thead>		
				<c:forEach var="list" items="${list}">
			<tbody>
				<tr>
					<th scope="row">제목</th>
					<td>${list.report_nm}</td>
				<tr>
					<th scope="row">학번</th>
					<td>${list.stu_no}</td>
					<th scope="row">작성시간</th>
					<td>${list.report_dt}</td>
				</tr>
				<tr>
					<th scope="row">작성자</th>
					<td colspan="3">${list.stu_name}</td>
				</tr>
				<tr>
					<td scope="row">파일</td>
					<td colspan="3">${list.report_file}
				<button type="button" onclick="location.href='download.do?report_file=${list.report_file}&report_path=${list.report_path}'">다운로드</button></td>
				</tr>
				<tr>
				<td>
				<button type="button"  id="$list.cs_state}" onclick="location.href='reportok.do?stu_no=${list.stu_no}'">확인</button>
				</td>
				<td>
				<button type="button" onclick="location.href='reportInfo.do'">목록으로</button>
				</td>
				</tr>
		</c:forEach>
			</tbody>
		</table>
	</form>	
</body>
</html>
