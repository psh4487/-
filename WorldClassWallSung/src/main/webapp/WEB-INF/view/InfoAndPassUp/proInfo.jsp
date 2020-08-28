<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>개인정보 확인 변경</title>

</head>
<body>
<form action="stuInfoUpform.do">
	<table border="1" style="text-align: center;">
		<tr>
			<td rowspan="11"><img src="/resources/imgFile/${login.prof_path}" width="300" /></td>
			<td>교수번호</td><td colspan="3">${login.prof_cd}</td>
		</tr>
		<tr>
			<td>생년월일</td><td colspan="3">${login.prof_birth}</td>
		</tr>
		<tr>
			<td>이름</td><td>${login.prof_nm}</td>
			<td>성별</td><td>${login.prof_gen}</td>
		</tr>
		
		<tr>
			<td>국적</td><td colspan="3">${login.prof_coun}</td>
		</tr>
		<tr>
			<td>학과</td><td colspan="3">${login.dept_nm}</td>
		</tr>
		<tr>
			<td>연락처</td><td colspan="3">${login.prof_tel}</td>
		</tr><tr>
			<td>E-mail</td><td colspan="3">${login.prof_email}</td>
		</tr>
		<tr>
			<td>우편번호</td><td colspan="3">${login.prof_zip}</td>
		</tr>
		<tr>
			<td>주소</td><td colspan="3">${login.prof_address}</td>
		</tr>
	</table><br>
	
	<input type="hidden" name="prof_cd" value="${login.prof_cd}">
	<input type="submit" value="수정하기" >
</form>
</body>
</html>