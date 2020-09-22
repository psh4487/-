<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="./jquery-ui-1.12.1/datepicker-ko.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link href="<c:url value="/resources/css/menustyle.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/table_style.css" />" rel="stylesheet">
<script>
$.datepicker.setDefaults({
    dateFormat: 'yy-mm-dd',	//날짜 포맷이다. 보통 yy-mm-dd 를 많이 사용하는것 같다.
    prevText: '이전 달',	// 마우스 오버시 이전달 텍스트
    nextText: '다음 달',	// 마우스 오버시 다음달 텍스트
    closeText: '닫기', // 닫기 버튼 텍스트 변경
    currentText: '오늘', // 오늘 텍스트 변경
    maxDate: 0,
    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],	//한글 캘린더중 월 표시를 위한 부분
    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],	//한글 캘린더 중 월 표시를 위한 부분
    dayNames: ['일', '월', '화', '수', '목', '금', '토'],	//한글 캘린더 요일 표시 부분
    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],	//한글 요일 표시 부분
    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],	// 한글 요일 표시 부분
    showMonthAfterYear: true,	// true : 년 월  false : 월 년 순으로 보여줌
    yearSuffix: '년',	//
    showButtonPanel: true,	// 오늘로 가는 버튼과 달력 닫기 버튼 보기 옵션
//    buttonImageOnly: true,	// input 옆에 조그만한 아이콘으로 캘린더 선택가능하게 하기
//    buttonImage: "images/calendar.gif",	// 조그만한 아이콘 이미지
//    buttonText: "Select date"	// 조그만한 아이콘 툴팁
});
</script>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
   .btn-file {
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
	background-color : red;
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
</style>
<title>Insert title here</title>
<script>
 $(function() {
  $("#datepicker").datepicker();
 });

 function fileSplit(path){
	    console.log(path.value);
	    var Fname = path.value;
	    var i = Fname.lastIndexOf("\\");
	                   
	       var report_file = Fname.substring(i+1);
	       console.log(report_file);
	       document.getElementById('fileName').value = report_file;
	 };
</script>
</head>
<body>
	<div class="container">
	<h4 style="margin-top:15px"> 자격증 추가 </h4>
		<div class="row col-md-6 col-md-offset-2 custyle">
			<form method="post" action='<c:url value='insertLicense.do'/>'enctype="multipart/form-data" target="list">
				자격증 이름 <input type="text" name="li_nm" id="li_nm"><br>
				취득일 <input type="text" style="margin-top: 10px"  id="datepicker" name="li_date" />
				<br> 자격증명서
				<input type="text" id="fileName" name="report_path" readonly>
				<span style="margin-top: 10px" class="btn btn-dark btn-file">
					<input type="file" id="upFile" name="li_path" onchange="fileSplit(this)">파일선택
				</span> <br><br>
				<input type="submit" class="btn btn-dark" value=업로드 onClick="window.close()">
				<input type="button" class="btn btn-dark" value=취소 onClick="window.close()">
			</form>
		</div>
	</div>
	<script>
	function popupClose(form){
		form.target = opener.name;
		form.submit();

		if(opener != null){
			opener.insert = null;
			self.close();
			}
		}
</script>
</body>
</html>