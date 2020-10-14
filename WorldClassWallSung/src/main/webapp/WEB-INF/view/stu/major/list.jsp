<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>수강관리</title>
<style>
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
	<h2> 수강 신청 관리  </h2>
		<div align="center" style="overflow: auto; height: 400px;">
			<form action="majorMain.do" method="get">
				<input type="radio" id="major" name="subject" value="전공" checked>전공
				<input type="radio" id="culture" name="subject" value="교양">교양
			</form>
			<form method="post" name="major">
				<input type="button" class="btn-dark" value="조회" onclick="selectList()">
			</form>
			<br>
			<div id="console"></div>
		</div>

		<div align="center">
			<p>수강신청 목록</p>
			<form id="apply" name="apply" method="post">
				<table class="table table-striped custab">
					<thead>
						<tr>
							<td>강의코드</td>
							<td>강의명</td>
							<td>이수구분</td>
							<td>학점</td>
							<td>교수</td>
							<td>강의시간</td>
							<td>인원제한</td>
							<td>수강인원</td>
							<td>강의 계획서</td>
							<td>삭제</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="list" items="${list}">
							<tr>
								<td>${list.sub_cd }</td>
								<td>${list.sub_nm }</td>
								<td>${list.isu }</td>
								<td>${list.credit }</td>
								<td>${list.prof_nm }</td>
								<td>${list.lec_1 },${list.lec_2 },${list.lec_3 }교시</td>
								<td>${list.max_mem}</td>
								<td>${list.attend_mem }</td>
								<td><input type="button" class="btn-dark"
									onclick="changeContent('downApply.do?sub_path=${list.sub_path}')"
									value="${list.sub_file}"></td>
								<td><input type="button" value="수강 취소" class="btn-dark"
									onclick='fn_delete(${list.sub_cd})'></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</form>
		</div>
		<br>
		<br>
		<div align="center">
			<form>
				<table style='text-align:center; float:right; width:400px' class="table table-striped custab">
					<tr>
						<td>수강가능학점</td>
						<td>18</td>
						<td>신청 학점</td>
						<td>${score}</td>
						<td>잔여 학점</td>
						<td>${18 - score}</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<script>
function selectList(){
	var url = "culture.do"
	var params = "";
	var dept_nm = $("#dept").val();
	if(document.getElementById('major').checked == true){
		params = "isu="+$("#major").val();
		}
	if(document.getElementById('culture').checked == true){
		params = "isu="+$("#culture").val();
	}
	
	$.ajax({
		type:"post",
		url : url,
		data : params,
		dataType : "json"})
		.done(
				function(args){
					$("#console").html("");
					var main = "<table class='table table-striped custab' id='cultureInfo' style='text-align:center'><tr><td>강의코드</td><td>강의명</td><td>이수구분</td><td>학점</td><td>학과</td><td>교수</td><td>강의시간</td><td>인원제한</td><td>수강인원</td><td>강의 계획서</td></tr></table>";
					$("#console").append(main);					
						for(i = 0; i < args.length; i++){
						var sub_cd = "<tr><td>"+args[i].sub_cd+"</td>";
						var sub_nm = "<td>"+args[i].sub_nm+"</td>";
						var isu = "<td>"+args[i].isu+"</td>";
						var credit = "<td>"+args[i].credit+"</td>";
						var dept_nm = "<td>"+args[i].dept_nm+"</td>";
						var prof_nm = "<td>"+args[i].prof_nm+"</td>";
						var lec = "<td>"+args[i].lec_1+","+args[i].lec_2+","+args[i].lec_3+"교시</td>";
						var max_mem = "<td>"+args[i].max_mem+"</td>";
						var attend_mem = "<td>"+args[i].attend_mem+"</td>"
						
						var apply = "<td><input type = 'button' class='btn-dark' value = '수강 신청' onClick = 'fn_apply("+args[i].sub_cd+","+args[i].max_mem+","+args[i].attend_mem+",${score})'></td></tr>";
						
						$("#cultureInfo").append(sub_cd+sub_nm+isu+credit+dept_nm+prof_nm+lec+max_mem+attend_mem+apply);						
							}	
						}				
				)	
}

function fn_apply(sub_cd,max_mem,attend_mem,score){
	var chk = confirm("신청하시겠습니까?");
	if((18-score) <= 0){
		alert("수강 가능한 학점을 초과하였습니다.")
		return false;
	}
	if(attend_mem >= max_mem){
			alert("수강인원을 초과하였습니다.")
			return false;
		}
	if(chk){			
			location.href='apply.do?sub_cd='+sub_cd;
		}else{
		return false;
			}
}

function fn_delete(sub_cd, score){
	var chk = confirm("정말 취소하시겠습니까?");
	if(chk){			
		 location.href='deleteApply.do?sub_cd='+sub_cd;
	}else{
		return false;
		}
}
</script>
</body>
</html>