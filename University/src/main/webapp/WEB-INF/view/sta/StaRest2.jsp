<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>휴강 사유</title>
</head>
<body>
<c:forEach  items = "${list}" var="list">
교수 <input type="text" id = "prof" value="${list.prof_nm}">
휴강일 <input type="text" id = "date1" value="${list.can_dt}"><br>
강의명 <input type="text" id = "sub" value="${list.sub_nm}">
보강일 <input type="text" id = "date2" value="${list.sup_dt}"><br>
휴강사유 <input type="text" id = "rsn" value="${list.can_iu}"><br>
</c:forEach>
<input type="button" value = "목록으로" onclick="changeContent('StaRest1.do')">
</body>
</html>