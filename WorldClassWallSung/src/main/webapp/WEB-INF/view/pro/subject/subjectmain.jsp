<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>Insert title here</title>
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
	<div class="container" style="padding: 5px">
	현재 강의목록
	<div class="row col-md-6 custyle">
	<table class="table table-striped custab">
		<tr style="text-align: center;">
		<td width="100">강의코드</td>
			<td width="150">강의명</td>
			<td width="100">이수구분</td>
			<td width="50">학점</td>
			<td width="150">강의시간</td>
			<td width="100">강의실</td>
			<td width="100">인원제한</td>
			<td width="100">수강인원</td>
		</tr>
		<c:forEach var="val" items="${sublist}">
			<tr>
				<td width="100"> ${val.sub_cd}</td>
				<td width="150"> ${val.sub_nm}</td>
				<td width="100">${val.isu}</td>
				<td width="50">${val.credit}</td>
		<td width="150"><c:choose>
				<c:when test="${ val.lec_1 < 10}">월${ val.lec_1%10}</c:when>
				<c:when test="${ val.lec_1 < 20}">화${ val.lec_1%10}</c:when>
				<c:when test="${ val.lec_1 < 30}">수${ val.lec_1%10}</c:when>
				<c:when test="${ val.lec_1 < 40}">목${ val.lec_1%10}</c:when>
				<c:when test="${ val.lec_1 < 50}">금${ val.lec_1%10}</c:when>
				</c:choose> ,
				<c:choose>
				<c:when test="${ val.lec_2 < 10}">월${val.lec_2%10}</c:when>
				<c:when test="${ val.lec_1 < 20}">화${ val.lec_2%10}</c:when>
				<c:when test="${ val.lec_1 < 30}">수${ val.lec_2%10}</c:when>
				<c:when test="${ val.lec_1 < 40}">목${ val.lec_2%10}</c:when>
				<c:when test="${ val.lec_1 < 50}">금${ val.lec_2%10}</c:when>
				</c:choose>,
				<c:choose>
				<c:when test="${ val.lec_3 < 10}">월${val.lec_3%10}</c:when>
				<c:when test="${ val.lec_3 < 20}">화${ val.lec_3%10}</c:when>
				<c:when test="${ val.lec_3 < 30}">수${ val.lec_3%10}</c:when>
				<c:when test="${ val.lec_3 < 40}">목${ val.lec_3%10}</c:when>
				<c:when test="${ val.lec_3 < 50}">금${ val.lec_3%10}</c:when>
				</c:choose></td>
				<td width="100">${val.subroom_nm}</td>
				<td width="100">${val.max_mem}
				<td width="100">${val.attend_mem}</td>
			</tr>
		</c:forEach>
	</table><br>
	</div>
	</div>
	<div style="float: left;">
	<input type="button"  class='btn btn-dark'  onclick="changeContent('calendar.do')" value="휴강신청"/>
	</div>
	<br><br><br><br>
	


	휴강신청 목록	
	<table class="table table-striped custab">
		<tr>
			<td width="100">강의코드</td>
			<td width="100">강의명</td>
			<td width="100">이수구분</td>
			<td width="120">휴강신청 날짜</td>
			<td width="100">상태</td>
		</tr>
		<c:forEach var="val" items="${sublist1}">
			<tr>
				<td width="100"> ${val.sub_cd}</td>
				<td width="100"> ${val.sub_nm}</td>
				<td width="100">${val.isu}</td>
				<td width="50">${val.can_dt}</td>
				<td width="100">${val.can_state}</td>				
			</tr>
		</c:forEach>
	</table> 
</body>
</html>