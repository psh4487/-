<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<div align = "center">
	<input type = "button" value = "자격증 추가" onClick = 'fn_insert()'>
	<form id = "license" name = "license" method = "post">
		<table border = "1">
			<thead>
				<tr>
					<th>취득 년 월 일</th>
					<th>자격증</th>
					<th>파일명</th>
					<th></th>
				</tr>
			</thead>
		<tbody>
			<c:forEach var = "list" items = "${list }">
				<tr>
					<td><!-- 2020-08-02 -->
					<c:set var = "TextValue" value = "${list.li_date }" />
					${fn:substring(TextValue,0,4) }년
					${fn:substring(TextValue,5,7) }월
					${fn:substring(TextValue,8,10) }일
					</td>
					<td>${list.li_nm }</td>
					<td>${list.li_file }</td>
					<td>
					<input type = "button" value = "삭제" onClick = 'fn_delete(${list.li_no})'>
				</tr>
			</c:forEach>
		</tbody>
		</table>
	</form>	
</div>
<br>
<br>
<br>
<div align = center>
	<input type = "button" value = "봉사활동 추가" onClick = 'fn_insertService()'>
		<form id = "service" name = "service" method = "post">
			<table border = 1>
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
					<c:forEach var = "service" items = "${service }">
						<tr>
							<td>
							<c:set var = "Start" value = "${service.ser_start }" />
							${fn:substring(Start,0,4) }년
							${fn:substring(Start,5,7) }월
							${fn:substring(Start,8,10) }일
							</td>
							<td>
							<c:set var = "Finish" value = "${service.ser_finish }" />
							${fn:substring(Finish,0,4) }년
							${fn:substring(Finish,5,7) }월
							${fn:substring(Finish,8,10) }일
							</td>
							<td>${service.ser_con }</td>
							<td>${service.ser_time }</td>
							<td>${service.ser_file }</td>
							<td>
							
							<input type = "button" value = "삭제" onClick = 'ser_delete(${service.ser_no})'>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</form>
</div>
<script>
	function ser_delete(ser_no){
		var chk = confirm("정말 삭제하시겠습니까?");
		if(chk){			
			 location.href="deleteSer.do?ser_no="+ser_no
			}
	}
	function fn_delete(li_no) {
		var chk = confirm("정말 삭제하시겠습니까?");
		if (chk) {
			location.href="deleteLicense.do?li_no="+li_no
		}
	}
	function fn_insert(){
		window.name = "list";
		window.open('insertLicenseForm.do',"insert",'location=no, directories=no,resizable=no,status=no,toolbar=no,menubar=no, width=600,height=300,left=600, top=400, scrollbars=no')
		
		}
	function fn_insertService(){
		window.name = "service"
		window.open("insertServiceForm.do","Service",'location=no, directories=no,resizable=no,status=no,toolbar=no,menubar=no, width=600,height=300,left=600, top=400, scrollbars=no')
		}
        
</script>
</body>
</html>