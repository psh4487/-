<%@ page contentType="text/html; charset=utf-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.btn-file {
	position: relative;
	overflow: hidden;
}

.btn-file input[type=file] {
	position: absolute;
	top: 0;
	right: 0;
	min-width: 100%;
	min-height: 100%;
	font-size: 100px;
	text-align: right;
	filter: alpha(opacity = 0);
	opacity: 0;
	outline: none;
	background: white;
	cursor: inherit;
	display: block;
}
.btn-primary {
	background-color : red;
	border-color: red; 
}
</style>
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
<script type="text/javascript">
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#blah').attr('src', e.target.result);
			};

			reader.readAsDataURL(input.files[0]);			
		}
	}
</script>
<title>상단</title>
</head>
<body>
	<div>
		<div style="float: left; width: 50%;">
			<image src="<c:url value="/resources/image/top_logo.png" />">
		</div>
		<div style="float: right; width: 50%; text-align: right; padding-right: 15px; padding-top: 13px;">
			<span style="color: white; padding-top: 5px;"> <b>${login.stu_name}</b> 님
				안녕하세요.&nbsp;&nbsp;&nbsp;
			</span> 
			<span class="btn btn-warning btn-file">
				<input type="file" onchange="readURL(this);" onclick="location.href='logout.do'"> 로그아웃
			</span>
		</div>
		
	</div>
</body>
</html>