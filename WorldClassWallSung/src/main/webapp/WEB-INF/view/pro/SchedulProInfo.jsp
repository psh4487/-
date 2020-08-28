<%@ page language="java" contentType="text/html; charset=Utf-8"
	pageEncoding="Utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="Utf-8">
<title>교수 시간표</title>
</head>
<script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.debug.js"></script>
<script>
      function fnSaveAsPdf() {
        html2canvas(document.getElementById('print_pdf')).then(function(canvas) {
          var imgData = canvas.toDataURL('image/png');
          var imgWidth = 210;
          var pageHeight = imgWidth * 1.414;
          var imgHeight = canvas.height * imgWidth / canvas.width;
          var doc = new jsPDF({
            'orientation': 'p',
            'unit': 'mm',
            'format': 'a4'
          });

          doc.addImage(imgData, 'PNG', 0, 0, imgWidth, imgHeight);
          doc.save('sample_A4.pdf');        
        });
      }

    </script>
<body>
<div style="text-align:center; width:1220px;">
<input type="button" value="시간표 출력" style="float:right; font-size:15pt" onclick="fnSaveAsPdf()">
</div><br>
<div id="print_pdf" style="text-align:center; width:1280px;">
<div style="text-align:center; width:1150px; margin:auto;">
	<h1>시간표 </h1>
	<c:forEach var="item" items="${proname}">
		<h3 style="float:right;">${item.dept_nm} ${item.prof_nm}</h3>
	</c:forEach>
	<table border="1" style="text-align:center; width:1150px; font-size:8pt;">
		<tr>
			<td width="150">교시</td>
			<td width="200">월</td>
			<td width="200">화</td>
			<td width="200">수</td>
			<td width="200">목</td>
			<td width="200">금</td>
		</tr>
		<c:forEach var="i" begin="0" end="8">
			<tr>
				<td>${i+1}교시<br>(${i+8}:00~${i+9}:50)</td>
				<c:forEach begin="0" end="0">
					<td>
					<c:forEach var="list" items="${list}">
							<c:if test="${i+1 == list.lec_1 || i+1 == list.lec_2 || i+1 == list.lec_3}">
									${list.sub_nm}<br>${list.prof_nm}<br>${list.subroom_nm}
							</c:if>
					</c:forEach>
					</td>
				</c:forEach>
				<c:forEach begin="0" end="0">
					<td>
							<c:forEach var="list" items="${list}">
							<c:if test="${i+11 == list.lec_1 || i+11 == list.lec_2 || i+11 == list.lec_3}">
									${list.sub_nm}<br>${list.prof_nm}<br>${list.subroom_nm}
							</c:if>
							</c:forEach>
					</td>
				</c:forEach>
				<c:forEach begin="0" end="0">
					<td>
					<c:forEach var="list" items="${list}">
							<c:if test="${i+21 == list.lec_1 || i+21 == list.lec_2 || i+21 == list.lec_3}">
									${list.sub_nm}<br>${list.prof_nm}<br>${list.subroom_nm}
							</c:if>
							</c:forEach>
					</td>
				</c:forEach>
				<c:forEach begin="0" end="0">
					<td>
						<c:forEach var="list" items="${list}">
							<c:if test="${i+31 == list.lec_1 || i+31 == list.lec_2 || i+31 == list.lec_3}">
									${list.sub_nm}<br>${list.prof_nm}<br>${list.subroom_nm}
							</c:if>
						</c:forEach>
					</td>
				</c:forEach>
				<c:forEach begin="0" end="0">
					<td>
					<c:forEach var="list" items="${list}">
							<c:if test="${i+41 == list.lec_1 || i+41 == list.lec_2 || i+41 == list.lec_3}">
									${list.sub_nm}<br>${list.prof_nm}<br>${list.subroom_nm}
							</c:if>
							</c:forEach>
							</td>
						</c:forEach>
						</tr>					
				</c:forEach>			
	</table>
	<br>
</div>
</div>
</body>
</html>