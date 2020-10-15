<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.btn {
	height: 25px;
	width: auto;
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
<title>Insert title here</title>
</head>
<body>
	<div class="container">
	<h2> 자격증 및 봉사활동  </h2>
		<div class="row col-md-6 col-md-offset-2 custyle">
			<input type="button" class="btn btn-dark" value="자격증 추가"
				onClick='fn_insert()'>
			<form style="margin-top: 35px; margin-left: -88px;" id="license" name="license" method="post">
				<table class="table table-striped custab">
					<thead>
						<tr>
							<th>취득 년 월 일</th>
							<th>자격증</th>
							<th>파일명</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="list" items="${list }">
							<tr>
								<td>
									<!-- 2020-08-02 --> <c:set var="TextValue"
										value="${list.li_date }" /> ${fn:substring(TextValue,0,4) }년
									${fn:substring(TextValue,5,7) }월 ${fn:substring(TextValue,8,10) }일
								</td>
								<td>${list.li_nm }</td>
								<td>${list.li_file }</td>
								<td><input type="button" class="btn btn-dark" value="삭제"
									onClick='fn_delete(${list.li_no})'>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</form>
		</div>
	</div>
	<br>
	<br>
	<br>
	<div class="container">
		<div class="row col-md-6 col-md-offset-2 custyle">
			<input type="button" class="btn btn-dark" value="봉사활동 추가"
				onClick='fn_insertService()'>
			<form id="service" name="service" method="post">
				<table class="table table-striped custab">
					<thead>
						<tr>
							<th>활동 시작일</th>
							<th>활동 종료일</th>
							<th>활동 내용</th>
							<th>봉사 시간</th>
							<th>파일명</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="service" items="${service }">
							<tr>
								<td><c:set var="Start" value="${service.ser_start }" />
									${fn:substring(Start,0,4) }년 ${fn:substring(Start,5,7) }월
									${fn:substring(Start,8,10) }일</td>
								<td><c:set var="Finish" value="${service.ser_finish }" />
									${fn:substring(Finish,0,4) }년 ${fn:substring(Finish,5,7) }월
									${fn:substring(Finish,8,10) }일</td>
								<td>${service.ser_con }</td>
								<td>${service.ser_time }</td>
								<td>${service.ser_file }</td>
								<td><input type="button" class="btn btn-dark" value="삭제"
									onClick='ser_delete(${service.ser_no})'></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</form>
		</div>
	</div>
	<script>
	function ser_delete(ser_no){
		var chk = confirm("정말 삭제하시겠습니까?");
		if(chk){
			 location.href="deleteSer.do?ser_no="+ser_no;
			}
	}
	function fn_delete(li_no) {
		var chk = confirm("정말 삭제하시겠습니까?");
		if (chk) {			
			location.href="deleteLicense.do?li_no="+li_no;
		}
	}
	function fn_insert(){
		window.name = "list";
		window.open('insertLicenseForm.do',"insert",'location=no, directories=no,resizable=no,status=no,toolbar=no,menubar=no, width=500,height=300,left=700, top=400, scrollbars=no')
		
		}
	function fn_insertService(){
		window.name = "service"
		window.open("insertServiceForm.do","Service",'location=no, directories=no,resizable=no,status=no,toolbar=no,menubar=no, width=600,height=300,left=750, top=400, scrollbars=no')
		}
        
</script>
</body>
</html>