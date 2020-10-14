<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<meta charset="utf-8">
<head>
    <title>Bootstrap Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="<c:url value="/resources/css/passSearch.css" />" rel="stylesheet">
</head>
<SCRIPT>
	function mclose() {
		window.opener = window.location.href;
		self.close();
	}
	setTimeout('mclose()', 5000);
</SCRIPT>
<BODY>
<body>
	<div class="container">
	    <div class="row">
	        <form cellSpacing=1 cellPadding=1 width="500" border=1 align="center">
	            <div class="col-lg-6">
	                <div class="form-group">
	                    <div class="input-group" style="width: 100%;"><br><br><br><br><br><br><br><br>
	                       	 비밀번호가 변경되었습니다.<br> 5초 후 자동으로 종료됩니다.<br> 새로운 비밀번호로 로그인해주세요.
	                    </div>
	                </div>
	            </div>
	        </form>
	    </div>
	</div>
</body>
</html>