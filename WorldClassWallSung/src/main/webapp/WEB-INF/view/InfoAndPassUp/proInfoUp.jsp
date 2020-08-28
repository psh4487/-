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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript">
	function btn(){ 
		alert('개인정보가 변경 되었습니다.'); 
		return true;
		}

	function sample4_execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				document.getElementById("prof_zip").value = data.zonecode;
				document.getElementById("prof_address").value = data.address;
			}
		}).open();
	}


</script>

</head>
<body>
<form action="stuInfoUpUp.do">
	<table border="1" style="text-align: center;">
		<tr>
			<td rowspan="11">
			<img src="/resources/imgFile/${login.prof_path}" width="300"/><br>
			</td>
			<td>학번</td><td colspan="3">${login.prof_cd}</td>
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
			<td>연락처</td><td colspan="3"><input type="text" name="prof_tel" id="prof_tel" value="${login.prof_tel}"></td>
		</tr><tr>
			<td>E-mail</td><td colspan="3"><input type="text" name="prof_email" id="prof_email" value="${login.prof_email}"></td>
		</tr>
		<tr>
			<td>우편번호</td><td colspan="3"><input type="text" name="prof_zip" id="prof_zip" value="${login.prof_zip}" readonly>
			<input type="button" value="우편번호찾기"
					onClick="sample4_execDaumPostcode()"> 우편번호를 검색하세요.</td>
		</tr>
		<tr>
			<td>주소</td><td colspan="3"><input type="text" name="prof_address" id="prof_address" value="${login.prof_address}"></td>
		</tr>
	</table><br>
	
	<input type="hidden" name="prof_cd" value="${login.prof_cd}">
 	<input type="submit" value="수정" id="buttonfunc" onclick="javascript:btn()">
	<input type="button" value="취소" onclick="document.location.href='stuInfoSel.do'">
</form>

</body>
</html>