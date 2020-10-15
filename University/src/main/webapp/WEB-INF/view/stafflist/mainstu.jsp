<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
로그인되었습니다.
${login.stu_name}님 안녕하세요.<br>
<img src="/resources/imgFile/${login.stu_path}" width="300"/><br>

<a href="/stu/leaveMain"> 휴복학 </a> <br>
</body>
</html>
