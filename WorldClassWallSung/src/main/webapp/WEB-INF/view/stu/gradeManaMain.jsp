<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>성적관리</title>
<script>
	$(function() {
		var url = "gm_years.do";
		$.ajax({
			type : "post",
			url : url,
			dataType : "json"
		}).done(
				function(args) {
					for (var i = 0; i < args.length; i++) {
						$("#gm_years").append(
								"<option value='"+args[i].years+"'>"
										+ args[i].years + "</option>");
					}
				}).fail(function(e) {
			alert(e.responseText);
		})
	});//ready 끝

	$(function() {
		var url = "gm_sem.do";
		$.ajax({
			type : "post",
			url : url,
			dataType : "json"
		}).done(
				function(args) {
					for (var i = 0; i < args.length; i++) {
						$("#gm_sem").append(
								"<option value='"+args[i].sem+"'>"
										+ args[i].sem + "학기" + "</option>");
					}
				}).fail(function(e) {
			alert(e.responseText);
		})
	});//ready 끝

	function seletGradeM() {
		var url = "gm_listAll.do";
		var years = $("#gm_years").val();
		var sem = $("#gm_sem").val();
		var params = "gm_years=" + years + "&gm_sem=" + sem + "&stu_no=2020101"; // 여기를 수정하면 됩니다.
		$.ajax({
			type : "post",
			url : url,
			data : params,
			dataType : "json"
		}).done(function(args) {
			$("#ee").html("");			
			var main = "<table border='1' id='listInfo' style='text-align: center;'><tr><td>이수구분</td><td>강의명</td><td>강의코드</td><td>중간</td><td>기말</td><td>과제</td><td>출결</td><td>총점</td><td>평점</td><td>등급</td></tr></table>";
			$("#ee").append(main);
			var sum = 0;
			var avg = 0;
			var i = 0;
			for(i=0; i<args.length; i++) {
				var isu = "<tr><td width='100'>" + args[i].isu + "</td>";
				var sub_nm = "<td width='250'>" + args[i].sub_nm + "</td>";
				var sub_cd = "<td width='100'>" + args[i].sub_cd + "</td>";
				var mid_score = "<td width='50'>" + args[i].mid_score + "</td>";
				var end_score = "<td width='50'>" + args[i].end_score + "</td>";
				var report_score = "<td width='50'>" + args[i].report_score + "</td>";
				var attend_score = "<td width='50'>" + args[i].attend_score + "</td>";
				var attend_sum = "<td width='50'>" + args[i].attend_sum + "</td>";
				var attend_rating = "<td width='50'>" + args[i].attend_rating + "</td>";
				var attend_grade = "<td width='50'>" + args[i].attend_grade + "</td></tr>";
				$("#listInfo").append(isu + sub_nm + sub_cd + mid_score + end_score + report_score + attend_score + attend_sum + attend_rating + attend_grade);
			}
		})
	}
</script>

</head>
<body>
<div>
	<select id="gm_years" name="gm_years">
		<option value="">::연도선택::</option>
	</select>
	<select id="gm_sem" name="gm_sem">
		<option value="">::학기선택::</option>
	</select>
	<input type="button" value="조회" onclick="seletGradeM()">
	<hr>
	<div style="width:auto;" id = "ee"></div>
</div>
</body>
</html>