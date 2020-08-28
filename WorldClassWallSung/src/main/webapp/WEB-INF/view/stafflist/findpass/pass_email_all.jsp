<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(function() {
			$('#btn-signup').click(function() {
				var inputCode = $('input[name=inputCode]').val();
				if (inputCode == "") {
					alert("인증번호를 입력하세요.");
					return false;
					} else {
					return true;
				}
			});
		});
</script>
</head>
<body>
	<table border="1" width="300" height="300" align="center">
		<center>
			<span style="color: green; font-weight: bold;">입력한 이메일로 받은
				인증번호를 입력하세요. (인증번호가 맞아야 비밀번호를 변경하실 수 있습니다.)</span> <br> <br> <br>
			<br>


			<div style="text-align: center;">
				<tr>
					<td>
						<center>
							<form action="pass_injeung_all" method="post">

								<center>
									<br>
									<div>
										인증번호 입력 : <input type="text"  name="inputCode"
											placeholder="  인증번호를 입력하세요. ">
									</div>

									<br> <br>
									<button type="submit" id="btn-signup" name="submit">인증번호 전송</button>
			</div>
			</td>
			</tr>
		</center>
	</table>
	</form>
	</center>


</body>
</html>
