<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<title>레포트</title>
</head>
<body>
<div>
<form method = "post" action = "insertReport_tb.do" enctype = "multipart/form-data">
<select name = "sub_cd">
	<option value = "">::강의 선택::</option>
	<c:forEach var = "list" items = "${list}" >
		<option value = "${list.sub_cd }" >${list.sub_nm }</option>
	</c:forEach>
</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type = "file" name = "report_path"><br><p /><p /><p /><p />

제목<input type = "text" name = "report_nm"><br><p/><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type = "submit" value = "업로드">
</form>
</div>
<div>
	<form>
	<table border = "1">
		<thead>
			<tr>
				<th>제출일자</th>
				<th>강의명</th>
				<th>파일명</th>
				<th>열람 상태</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var = "reportlist" items = "${reportlist }">
				<tr>
					<td>
					<c:set var = "TextValue" value = "${reportlist.report_dt }" />
					${fn:substring(TextValue,0,4) }년
					${fn:substring(TextValue,5,7) }월
					${fn:substring(TextValue,8,10) }일
					</td>
					<td>${reportlist.sub_nm}</td>
					<td>${reportlist.report_file}</td>
					<td>${reportlist.report_state }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</form>
</div>
</body>
</html>