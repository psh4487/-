<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
<title>비밀번호찾기1</title>
</head>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(function() {
			$('#btn-signup').click(function() {
				var all_cd = $('input[name=all_cd]').val();
				var all_email = $('input[name=all_email]').val();
				if (all_cd == "") {
					alert("ID를 입력하세요.");
					return false;

				} else if (all_email == "") {
					alert("E-Mail을 입력하세요.");
					return false;
				} else {
					return true;
				}
			});
		});
</script>

<body>
	<form:form id="signupform" class="form-horizontal" role="form"
		action="find_pass_all.do" method="post">
		<div class="form-group">
			<label for="all_cd">ID</label>
		</div>
		<div class="col-md-10">
			<input type="text" name="all_cd" placeholder="ID를 입력해주세요">
		</div>
		<br>
		<label for="all_email">E-Mail</label>
		<div class="col-md-10">
			<input type="text" name="all_email" placeholder="E-Mail을 입력해주세요">


		</div>


		<div style="margin-left: 82%">
			<!-- Button -->

			<div>
				<button id="btn-signup" type="submit">확인</button>
			</div>
		</div>

		<div class="form-group">
			<div>
				<div
					style="border-top: 1px solid #888; padding-top: 15px; font-size: 85%">
					가입하신 이메일로 인증번호를 전송해드리겠습니다.</div>
			</div>
		</div>

	</form:form>



</body>

</html>