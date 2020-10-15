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
<style>
.form-control {
   width: auto;;
}


.table {
   width:700px;
}
	html {
		background: url(images/bg.jpg) no-repeat 50% 50% fixed;
		-webkit-background-size: cover;
		-moz-background-size: cover;
		-o-background-size: cover;
		background-size: cover;
	}

	.container {
	    width: auto;
	    max-width: 1140px;
	}
	
	.table td, .table th {
	    padding: .30rem;
	}
	.btn-file {
            position: relative;
            overflow: hidden;
        }

    /*     .btn-file input[type=file] {
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
        } */
        .btn-primary {
            background-color : blue;
            border-color: red;
        }
        .btn {
       		height: 25px;
       		width: 80px;
       		vertical-align: bottom;
       		padding: .0rem .75rem;
       		font-size: 13px;
       	}
       	.col-md-6 {
		    max-width: none;
		}
		.btn-dark:focus {
			color: #fff;
		    background-color: #343a40;
		    border-color: #343a40;
		}
</style>

</head>
<body>

	<div class="container">
	<h2>비밀번호 변경</h2>
<div class="container" style="width: 437px;">
<div style="float: left; width: 50%; margin:30px;">
		<form action="pwdUpDateMan.do" method="post" id="upForm">
		<div class="form-group has-feedback">
				<label class="control-label" for="chk_sta_pwd">기존 비밀번호</label> <input
					type="text" id="chk_sta_pwd" name="chk_sta_pwd" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="new_sta_pwd">새로운 비밀번호</label> <input
					type="password" id="new_sta_pwd" name="new_sta_pwd" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="new_sta_pwd1">새로운 비밀번호(확인)</label> <input
					type="text" id="new_sta_pwd1" name="new_sta_pwd1" />
			</div>

	
			<button class="btn btn-success" type="submit">변경</button>
				</form>
	
		
</div>
</div>
</div>

</body>

</html>