<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>����</title>
<style>
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
		.btn-dark:hover {
			color: #dedede;
		    background-color: #1f2328;
		    border-color: #1f2328;
		}
</style>
<script>
	$(function() {
		var url = "sj_years.do";
		$.ajax({
			type : "post",
			url : url,
			dataType : "json"
		}).done(
				function(args) {
					for (var i = 0; i < args.length; i++) {
						$("#years").append(
								"<option value='"+args[i].years+"'>"
										+ args[i].years + "</option>");
					}
				}).fail(function(e) {
			alert(e.responseText);
		})
	});//ready ��

	$(function() {
		var url = "sj_sem.do";
		$.ajax({
			type : "post",
			url : url,
			dataType : "json"
		}).done(
				function(args) {
					for (var i = 0; i < args.length; i++) {
						$("#sem").append(
								"<option value='"+args[i].sem+"'>"
										+ args[i].sem + "�б�" + "</option>");
					}
				}).fail(function(e) {
			alert(e.responseText);
		})
	});//ready ��

	function selecEmp() {
		var url = "sj_listAll.do";
		var years = $("#years").val();
		var sem = $("#sem").val();
		var params = "years=" + years + "&sem=" + sem + "&stu_no="+${login.stu_no};
		$.ajax({
			type : "post",
			url : url,
			data : params,
			dataType : "json"
		}).done(function(args) {
			$("#listInfo").html("");
			$("#sumInfo").html("");
			var main = "<tr><th>�̼�����</th><th>���Ǹ�</th><th>�����ڵ�</th><td>����</th><th>���</th><th>����</th></tr>";
			$("#listInfo").append(main);
			var sum = 0;
			var avg = 0;
			var i = 0;
			for(i=0; i<args.length; i++) {
				console.log(args[i].attend_grade);
				if(args[i].attend_grade == null) {
					var isu = "<tr><td width=100>" + args[i].isu + "</td>";
					var sub_nm = "<td width=300>" + args[i].sub_nm + "</td>";
					var sub_cd = "<td width=100>" + args[i].sub_cd + "</td>";
					var credit = "<td width=50>" + args[i].credit + "</td>";
					var attend_grade = "<td width=50>" + "-" + "</td>";
					var attend_rating = "<td width=50>" + "-" + "</td></tr>";	
					$("#listInfo").append(isu + sub_nm + sub_cd + credit + attend_grade + attend_rating);
				} else {
					var isu = "<tr><td width=100>" + args[i].isu + "</td>";
					var sub_nm = "<td width=300>" + args[i].sub_nm + "</td>";
					var sub_cd = "<td width=100>" + args[i].sub_cd + "</td>";
					var credit = "<td width=50>" + args[i].credit + "</td>";
					var attend_grade = "<td width=50>" + args[i].attend_grade + "</td>";
					var attend_rating = "<td width=50>" + args[i].attend_rating + "</td></tr>";	
					var credit_sum = args[i].credit;
					var attend_rating_avg = args[i].attend_rating;
					sum += credit_sum;
					avg = Math.round(avg + (attend_rating_avg * 100));
					$("#listInfo").append(isu + sub_nm + sub_cd + credit + attend_grade + attend_rating);
				}
			}
			var data = "<tr><th>���� �հ�</th><th>���� ���</th></tr>";
			sum = "<tr><td width=100>" + sum + "</td>";
			avg = "<td width=100>" + ((avg / i) / 100).toFixed(2) + "</td></tr>";
			$("#sumInfo").append(data);
			$("#sumInfo").append(sum + avg);
		})
	}
</script>

</head>
<body>
	<div class="container">
	<h2> ���� Ȯ��  </h2>
		<select id="years">
			<option value="">::��������::</option>
		</select>
		<select id="sem">
			<option value="">::�б⼱��::</option>
		</select>
		<input type="button" value="��ȸ" class="btn btn-dark btn-file" onclick="selecEmp()">
		<hr>
		<div id="start" style="width:650px;">
				<table style='text-align: center;' class='table table-striped custab' id='listInfo'>
				</table>
				<table style='text-align:center; float:right; width:300px' class='table table-striped custab' id='sumInfo'>
				</table>
		</div>
	</div>
</body>
</html>