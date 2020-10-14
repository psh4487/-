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
<body>
<div class="container">
    <p class="well"># 변경할 비밀번호를 입력해주세요.</p>
    <h3>비밀번호 찾기</h3>
    <hr>
    <div class="row">
        <form action="pass_change.do" method="post">
            <div class="col-lg-6">
                <div class="form-group">
                    <label>변경 할 비밀번호 입력</label>
                    <div class="input-group" style="width: 100%;">
                        <input type="text" class="form-control" name="all_pwd" placeholder="변경 할 비밀번호를 입력하세요.">
                    </div><br>
               		<input type="submit" name="submit" id="btn-signup" value="비밀번호 변경" class="btn btn-primary pull-right">
                </div>
               
            </div>
        </form>
    </div>
</div>
</body>
</html>