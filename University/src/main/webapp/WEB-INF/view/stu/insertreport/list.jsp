<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
   function fileSplit(path){
      console.log(path.value);
      var Fname = path.value;
      var i = Fname.lastIndexOf("\\");
                     
         var report_file = Fname.substring(i+1);
         console.log(report_file);
         document.getElementById('fileName').value = report_file;
   };
</script>

<style>
<
style type ="text /css ">.btn-file {
	position: relative;
	overflow: hidden;
}

.btn-file input[type=file] {
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
}

.btn-primary {
	background-color: red;
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

.col-md-6 {
	margin-top: 20px;
}

.filebox_bs3-primary label {
	display: inline-block;
	padding: .5em .75em;
	color: #fff;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: black;
	cursor: pointer;
	border: 1px solid black;
	border-radius: .25em;
	-webkit-transition: background-color 0.2s;
	transition: background-color 0.2s;
}

.filebox_bs3-primary label:hover {
	background-color: black;
}

.filebox_bs3-primary label:active {
	background-color: black;
}

.filebox_bs3-primary input[type="file"] {
	position: absolute;
	width: 100px;
	height: 100px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

/* input#ex_filename{
   width: 80px;
   color: #fff;
   background-color: #343a40;
   border-color: #343a40;
} */
</style>
<title>레포트</title>
</head>
<body>
	<div class="container">
	<h2>레포트 제출</h2>
		<form name = form1 method="post" action='<c:url value='insertReport_tb.do'/>'
			enctype="multipart/form-data" onsubmit="return writeSave()">
			<select name="sub_cd" id = "selectDept">
				<option value="">::강의 선택::</option>
				<c:forEach var="list" items="${list}">
					<option value="${list.sub_cd }">${list.sub_nm }</option>
				</c:forEach>
			</select> <br>
			<br>
			<br> 파일명&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="text" id="fileName" name="report_path" readonly>
			<span style="margin-top: 10px" class="btn btn-dark btn-file">
			<input type="file" id="upFile" name="report_path" onchange="fileSplit(this)" onClick = "fileUpload()">&nbsp;파일선택

			</span><br>
			<br> 레포트 제목 <input type="text" name="report_nm"><br>
			<br> <input class="btn btn-dark" type="submit" value="업로드"><br>
			<br>
			<br>
		</form>
		<div>
			<form>
				<table class="table table-striped custab">
					<thead>
						<tr>
							<th>제출일자</th>
							<th>강의명</th>
							<th>레포트 제목</th>
							<th>파일명</th>
							<th>열람 상태</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="reportlist" items="${reportlist }">
							<tr>
								<td><c:set var="TextValue" value="${reportlist.report_dt }" />
									${fn:substring(TextValue,0,4) }년 ${fn:substring(TextValue,5,7) }월
									${fn:substring(TextValue,8,10) }일</td>
								<td>${reportlist.sub_nm}</td>
								<td>${reportlist.report_nm }</td>
								<td>${reportlist.report_file}</td>
								<td>${reportlist.report_state }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</form>
		</div>
	</div>
</body>
<script>
function writeSave(){
	var index = $("#selectDept option").index($("#selectDept option:selected"));

	if(index == 0){
		alert("강의를 선택해 주세요.")
		return false;
		}
	else if(!form1.fileName.value){
		alert("파일을 업로드 해주세요.")
		form1.fileName.focus();
		return false;
		}
	else if(!form1.report_nm.value){
		alert("제목을 입력하십시오.")
		form1.report_nm.focus();
		return false;
		}
}
</script>
</html>