<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.debug.js"></script>
<style>
.form-control {
	width: auto;;
}

.table {
	width: 700px;
}
th{
background-color:orange;
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
<script>
	function fnSaveAsPdf() {
		html2canvas(document.getElementById('print_pdf')).then(
				function(canvas) {
					var imgData = canvas.toDataURL('image/png');
					var imgWidth = 210;
					var pageHeight = imgWidth * 1.414;
					var imgHeight = canvas.height * imgWidth / canvas.width;

					var doc = new jsPDF({
						'orientation' : 'p',
						'unit' : 'mm',
						'format' : 'a4'
					});

					doc.addImage(imgData, 'PNG', 0, 0, imgWidth, imgHeight);
					doc.save('sample_A4.pdf');
					console.log('Reached here?');
				});
	}
</script>
<body>
	<div class="container">
		<div style="text-align: center; width: 1220px;">
			<input type="button" value="시간표 출력" class="btn-dark"
				style="float: right; font-size: 15pt" onclick="fnSaveAsPdf()">
		</div>
		<br>
		<div id="print_pdf" style="text-align: center; width: 1280px;">
			<div style="text-align: center; width: 1150px; margin: auto;">
				<br>
				<br>
				<h1>시간표</h1>
				<h3 style="float: right;">${schedulename.dept_nm}
					${schedulename.stu_name}</h3>
				<table border="1"
					style="text-align: center; width: 1150px; font-size: 10pt;">
					<tr>
						<th width="150" height=30>교시</th>
						<th width="200">월</th>
						<th width="200">화</th>
						<th width="200">수</th>
						<th width="200">목</th>
						<th width="200">금</th>
					</tr>
					<c:forEach var="i" begin="0" end="8">
						<tr>
							<td style = "background-color:orange; height:60px;">${i+1}교시<br>(${i+8}:00~${i+9}:50)
							</td>
							<c:forEach begin="0" end="0">
								<td><c:forEach var="list" items="${schedulelist}">
										<c:if
											test="${i+1 == list.lec_1 || i+1 == list.lec_2 || i+1 == list.lec_3}">
									${list.sub_nm}<br>${list.prof_nm}<br>${list.subroom_nm}
							</c:if>
									</c:forEach></td>
							</c:forEach>
							<c:forEach begin="0" end="0">
								<td><c:forEach var="list" items="${schedulelist}">
										<c:if
											test="${i+11 == list.lec_1 || i+11 == list.lec_2 || i+11 == list.lec_3}">
									${list.sub_nm}<br>${list.prof_nm}<br>${list.subroom_nm}
							</c:if>
									</c:forEach></td>
							</c:forEach>
							<c:forEach begin="0" end="0">
								<td><c:forEach var="list" items="${schedulelist}">
										<c:if
											test="${i+21 == list.lec_1 || i+21 == list.lec_2 || i+21 == list.lec_3}">
									${list.sub_nm}<br>${list.prof_nm}<br>${list.subroom_nm}
							</c:if>
									</c:forEach></td>
							</c:forEach>
							<c:forEach begin="0" end="0">
								<td><c:forEach var="list" items="${schedulelist}">
										<c:if
											test="${i+31 == list.lec_1 || i+31 == list.lec_2 || i+31 == list.lec_3}">
									${list.sub_nm}<br>${list.prof_nm}<br>${list.subroom_nm}
							</c:if>
									</c:forEach></td>
							</c:forEach>
							<c:forEach begin="0" end="0">
								<td><c:forEach var="list" items="${schedulelist}">
										<c:if
											test="${i+41 == list.lec_1 || i+41 == list.lec_2 || i+41 == list.lec_3}">
									${list.sub_nm}<br>${list.prof_nm}<br>${list.subroom_nm}
							</c:if>
									</c:forEach></td>
							</c:forEach>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</body>
</html>