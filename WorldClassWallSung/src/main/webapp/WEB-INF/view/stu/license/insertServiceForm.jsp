<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
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
    fn_default_datepicker();
});
function fn_default_datepicker()
{
    var start = $( "#datepicker_start" ).datepicker({
        dateFormat: 'yy-mm-dd' //Input Display Format 변경
        ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
        ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
        ,changeYear: true //콤보박스에서 년 선택 가능
        ,changeMonth: true //콤보박스에서 월 선택 가능                
        //,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시
        //,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
        //,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
        ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
        ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
        ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
        ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
        ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
        ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
        				 //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
        ,maxDate: "0" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
    });
    var end = $( "#datepicker_end" ).datepicker({
        dateFormat: 'yy-mm-dd' //Input Display Format 변경
        ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
        ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
        ,changeYear: true //콤보박스에서 년 선택 가능
        ,changeMonth: true //콤보박스에서 월 선택 가능                
        //,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
        //,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
        //,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
        ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
        ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
        ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
        ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
        ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
        ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
        ,maxDate: "0" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)
         ,defaultDate: "+1w"
      });
   
}
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
	<h4 style="margin-top:15px"> 봉사활동 추가 </h4>
		<div class="row col-md-6 col-md-offset-2 custyle">
		<form method = "post" action = '<c:url value = 'insertService.do'/>' enctype = "multipart/form-data" target = "service">
			시작일 <input type="text" id="datepicker_start" name = "ser_date" readonly/><br>
			종료일 <input type="text" id="datepicker_end" name = "fin_date" readonly/><br>
			
			활동내용 <input type="text" style="margin-top: 10px" name = "ser_con" id = "ser_con"><br>
			봉사시간 <input type = "text"  style="margin-top: 10px" name = "ser_time" id = "ser_time"><br>
			<input type="text" id="fileName" name="report_path" readonly>
			<span style="margin-top: 10px" class="btn btn-dark btn-file">
				<input type="file" id="upFile" name="ser_path" onchange="fileSplit(this)">파일선택
			</span> 파일을 선택하세요. <br><br>
			<input type = "submit" class="btn btn-dark"  value = "업로드" onClick = "window.close()">
			<input type = "button" class="btn btn-dark"  value = "취소" onClick = "window.close()">
	
</form>
	</div>
	</div>
<script>
	function popupClose(form){
		form.target = opener.name;
		form.submit();
		if(opener != null){
			opener.Service = null;
			self.close();
			}
		}	
</script>
</body>
</html>