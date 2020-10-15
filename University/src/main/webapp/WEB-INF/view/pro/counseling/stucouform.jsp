<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상담상세보기</title>
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
		<div class="row col-md-6 col-md-offset-2 custyle">
			<form name="form1" method="post">

				<table class="table table-striped custab"
					style="text-align: center; width: 1000px;">
					<c:forEach var="list" items="${list}">
						<tbody>
							<tr style="text-align: center;">
								<td colspan=4>상담 신청 상세보기</td>
							</tr>
							<tr>
								<th scope="row">글 번호</th>
								<td>${list.cs_no}</td>
								<td></td>
								<td></td>
							<tr>
								<th scope="row">작성자</th>
								<td>${list.stu_name}</td>
								<th scope="row">작성시간</th>
								<td>${list.cs_date}</td>
							</tr>
							<tr>
								<td scope="row">제목</td>
								<td colspan="3" style="text-align: center;">${list.cs_nm}</td>
							</tr>
							<tr>
								<td scope="row">신청내용</td>
								<td colspan="4" style="border: 1px solid #ccc; height: 100px;">${list.cs_con}</td>
							</tr>
						</tbody>
					</c:forEach>
				</table>
				<div style="float: right;">
				<c:forEach var="list" items="${list}">
					<button type="button" class='btn btn-dark'
						id="승인"
						onclick="location.href='cs_stateok.do?cs_no=${list.cs_no}'">승인</button>
					<button type="button" class='btn btn-dark' id="미승인"
						onclick="location.href='cs_statenot.do?cs_no=${list.cs_no}'">미승인</button>
				</c:forEach>
				</div>
				<br>
				<button type="button" class='btn btn-dark' onclick="location.href='couInfo.do'">신청목록</button>
			</form>
		</div>
	</div>
</body>
</html>