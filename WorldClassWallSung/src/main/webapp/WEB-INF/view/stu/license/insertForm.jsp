<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="./jquery-ui-1.12.1/datepicker-ko.js"></script>
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
<title>Insert title here</title>
<script>
 $(function() {
  $("#datepicker").datepicker();
 });
</script>
</head>
<body>
<form method = "post" action = '<c:url value='insertLicense.do'/>' enctype = "multipart/form-data" target = "list">
	<div>		
		자격증 이름<input type = "text" name = "li_nm" id = "li_nm" ><br>
		취득일<input type="text" id="datepicker" name = "li_date"/>			
		<br><br>
		자격증명서
		<input type = "file" name = "li_path"><br><br>
		<input type = "submit" value = 업로드 onClick = "window.close()" >
		<input type = "button" value = 취소 onClick = "window.close()" >
	</div>
	
</form>
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