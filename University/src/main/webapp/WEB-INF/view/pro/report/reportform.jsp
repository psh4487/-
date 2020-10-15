<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>레포트 관리</title>
<style>
.form-control {
	width: auto;;
}

.table {
	width: 700px;
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
	background-color: blue;
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
	<form name="form2" method="post">
<table class="table table-striped custab"
style="text-align: center; width: 1000px;">	
				<c:forEach var="list" items="${list}">
			<tbody>
			<tr style="text-align: center;">
				<td colspan=4>과제제출 상세보기</td>
				</tr>
<tr>
					<th >제목</th>
					<td colspan="1">${list.report_nm}</td>
					</tr>
				<tr>
					<th scope="row">학번</th>
					<td>${list.stu_no}</td>
					<th scope="row">작성시간</th>
					<td>${list.report_dt}</td>
				</tr>
				<tr>
					<th scope="row">작성자</th>
					<td colspan="1">${list.stu_name}</td>
				</tr>
				<tr>
					<td scope="row">파일</td>
					<td colspan="3">${list.report_file}
				<button type="button" class='btn btn-dark' onclick="location.href='download.do?report_file=${list.report_file}&report_path=${list.report_path}'">다운로드</button></td>
				</tr>
				</tbody>
				</c:forEach>
				</table>
				<div style="float: right;">
				<c:forEach var="list" items="${list}">
				<button type="button" class='btn btn-dark' id="확인" onclick="location.href='reportok.do?stu_no=${list.stu_no}'">확인</button>
				<button type="button" class='btn btn-dark' onclick="location.href='reportInfo.do'">목록으로</button>
		</c:forEach>
		</div>
		
	</form>	
</div>
</body>
</html>
