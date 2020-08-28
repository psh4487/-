<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	요청을 처리하는 도중에 예외가 발생하였습니다.
	${exception.message }
<%
	Throwable e = (Throwable)request.getAttribute("exception");
	e.printStackTrace();%>
</body>
</html>