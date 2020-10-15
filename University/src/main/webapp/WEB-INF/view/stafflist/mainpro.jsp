<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
로그인되었습니다.
${login.prof_nm}님 안녕하세요.
<img src="/resources/imgFilePro/${login.prof_path}" width="300"/><br>
</body>
</html>