<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>개인정보 확인 변경</title>
<style type="text/css">
 .btn {
       		height: 25px;
       		width: 80px;
       		vertical-align: bottom;
       		padding: .0rem .75rem;
       		font-size: 13px;
       	}
</style>
</head>
<body>
	<div class="container">
	<h2>비밀번호 변경</h2>
<div class="container" style="width: 437px;">
<div style="float: left; width: 50%; margin:30px;">
		<form action="pwdUpDateStu.do" method="post" id="upForm">
		<div class="form-group has-feedback">
				<label class="control-label" for="chk_stu_pwd">기존 비밀번호</label>
				<input type="text" id="chk_stu_pwd" name="chk_stu_pwd" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="new_stu_pwd">새로운 비밀번호</label>
				<input type="password" id="new_stu_pwd" name="new_stu_pwd" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="new_stu_pwd1">새로운 비밀번호(확인)</label> 
				<input type="text" id="new_stu_pwd1" name="new_stu_pwd1" />
			</div>
			
			<button class="btn btn-success" type="submit">변경</button>
	</form>
			
</div>
</div>
</div>
</body>
</html>