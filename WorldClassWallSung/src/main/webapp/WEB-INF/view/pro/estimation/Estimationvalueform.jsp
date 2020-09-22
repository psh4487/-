<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>과목평가상세보기</title>
</head>
<body>
<form name="form1" method="post" >

	<table class="cou_view" class='table table-striped custab' style='text-align: center; width: 600px;'>
		<colgroup>
			<col width="15%" />
			<col width="35%" />
			<col width="15%" />
			<col width="35%" />
		</colgroup>
		<c:forEach var="list" items="${list}">
		<tr>
		<td> 평가한 학생/총 학생</td><td>${list.num}/${list.ATTEND_MEM}</td>
		</tr>

		
		
			
		<tr>
		<th scope="row">과목명: &nbsp; </th>
		<td>${list.sub_nm}</td>
		<tr>
		<tbody>
		<tr>
		<th>1</th><th>${list.s1}</th><th>${list.a1}</th>
		
	</tr>
		<tr>
		<th>2</th><th>${list.s2}</th><th>${list.a2}</th>
		
	</tr>
		<tr>
		<th>3</th><th>${list.s3}</th><th>${list.a3}</th>
		
	</tr>
		<tr>
		<th>4</th><th>${list.s4}</th><th>${list.a4}</th>
		
	</tr>
		<tr>
		<th>5</th><th>${list.s5}</th><th>${list.a5}</th>
		
	</tr>
		<tr>
		<th>6</th><th>${list.s6}</th><th>${list.a6}</th>
		
	</tr>
		<tr>
		<th>7</th><th>${list.s7}</th><th>${list.a7}</th>
		
	</tr>
		<tr>
		<th>8</th><th>${list.s8}</th><th>${list.a8}</th>
		
	</tr>
		<tr>
		<th>9</th><th>${list.s9}</th><th>${list.a9}</th>
		
	</tr>
		<tr>
		<th>10</th><th>${list.s10}</th><th>${list.a10}</th>
		
	</tr>
	</c:forEach>
		</tbody>
	
	</table>
	<br>
	<button type="button" onclick="location.href='EstimationinfoPro.do'">목록으로</button>
</form>	
</body>
</html>