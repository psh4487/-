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
			<td rowspan="11"><img src="/resources/imgFile/${login.stu_path}" width="300" /></td><td>학번</td><td colspan="3">${login.stu_no}</td>
		</tr>
		<tr>
			<td>생년월일</td><td colspan="3">${login.stu_birth}</td>
		</tr>
		<tr>
			<td>이름</td><td>${login.stu_name}</td><td>성별</td><td>${login.stu_gen}</td>
		</tr>
		<tr>
			<td>학년</td><td colspan="3">${login.stu_year}</td>
		</tr>
		<tr>
			<td>상태</td><td colspan="3">${login.state}</td>
		</tr>
		<tr>
			<td>국적</td><td colspan="3">${login.stu_coun}</td>
		</tr>
		<tr>
			<td>학과</td><td colspan="3">${login.dept_nm}</td>
		</tr>
		<tr>
			<td>연락처</td><td colspan="3">${login.stu_tel}</td>
		</tr><tr>
			<td>E-mail</td><td colspan="3">${login.stu_email}</td>
		</tr>
		<tr>
			<td>우편번호</td><td colspan="3">${login.stu_zip}</td>
		</tr>
		<tr>
			<td>주소</td><td colspan="3">${login.stu_address}</td>
		</tr>
	</table><br>
	<input type="hidden" name="dept_cd" value="${login.dept_cd}">
	<input type="hidden" name="stu_no" value="${login.stu_no}">
	<input type="submit" value="수정하기" >
</form>
</body>
</html>