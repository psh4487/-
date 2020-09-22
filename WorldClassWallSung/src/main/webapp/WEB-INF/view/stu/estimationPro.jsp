<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script>
$(function() {
	$('#dataSubmit').click(function() {
		var form = document.subdata;
		var no1 = $('input[name=no1]:checked').val();
		var no2 = $('input[name=no2]:checked').val();
		var no3 = $('input[name=no3]:checked').val();
		var no4 = $('input[name=no4]:checked').val();
		var no5 = $('input[name=no5]:checked').val();
		var no6 = $('input[name=no6]:checked').val();
		var no7 = $('input[name=no7]:checked').val();
		var no8 = $('input[name=no8]:checked').val();
		var no9 = $('input[name=no9]:checked').val();
		var no10 = $('input[name=no10]:checked').val();
		var prof_say = $('input[name=prof_say]').val();
		console.log(no1);
		if (no1 == null) {
			alert("1번 문항을 선택하세요.");
		} else if (no2 == null) {
			alert("2번 문항을 선택하세요.");
		} else if (no3 == null) {
			alert("3번 문항을 선택하세요.");
		} else if (no4 == null) {
			alert("4번 문항을 선택하세요.");
		} else if (no5 == null) {
			alert("5번 문항을 선택하세요.");
		} else if (no6 == null) {
			alert("6번 문항을 선택하세요.");
		} else if (no7 == null) {
			alert("7번 문항을 선택하세요.");
		} else if (no8 == null) {
			alert("8번 문항을 선택하세요.");
		} else if (no9 == null) {
			alert("9번 문항을 선택하세요.");
		} else if (no10 == null) {
			alert("10번 문항을 선택하세요.");
		} else if (prof_say == "") {
			alert("교수에게 하고싶은 말을 입력하세요.");
		} else {
			form.submit();
		}
	});
});
</script>

<body>
<span style="font-weight:bold">1. 강의계획서가 충실하게 구성되어 강좌선택에 도움이 되었다.</span><br>
			<input type="radio" name="no1" value="1">전혀아니다&nbsp;
			<input type="radio" name="no1" value="2">아니다&nbsp;
			<input type="radio" name="no1" value="3">보통이다&nbsp;
			<input type="radio" name="no1" value="4">그렇다&nbsp;
			<input type="radio" name="no1" value="5">매우그렇다&nbsp;<br><br>
		<span style="font-weight:bold">2. 강의자료가 적절히 활용되어 학습에 도움이 되었다.</span><br>
			<input type="radio" name="no2" value="1">전혀아니다&nbsp;
			<input type="radio" name="no2" value="2">아니다&nbsp;
			<input type="radio" name="no2" value="3">보통이다&nbsp;
			<input type="radio" name="no2" value="4">그렇다&nbsp;
			<input type="radio" name="no2" value="5">매우그렇다&nbsp;<br><br>
		<span style="font-weight:bold">3. 이 수업은 전반적으로 출결관리가 잘 되었다.</span><br>
			<input type="radio" name="no3" value="1">전혀아니다&nbsp;
			<input type="radio" name="no3" value="2">아니다&nbsp;
			<input type="radio" name="no3" value="3">보통이다&nbsp;
			<input type="radio" name="no3" value="4">그렇다&nbsp;
	 		<input type="radio" name="no3" value="5">매우그렇다	&nbsp;<br><br>
		<span style="font-weight:bold">4. 교수님은 학생들의 참여와 소통을 독려하였다.</span><br>
			<input type="radio" name="no4" value="1">전혀아니다&nbsp;
			<input type="radio" name="no4" value="2">아니다&nbsp;
			<input type="radio" name="no4" value="3">보통이다&nbsp;
			<input type="radio" name="no4" value="4">그렇다&nbsp;
			<input type="radio" name="no4" value="5">매우그렇다&nbsp;	<br><br>
		<span style="font-weight:bold">5. 시험, 과제 등 성적 평가의 기준이 공정하였다.</span><br>
			<input type="radio" name="no5" value="1">전혀아니다&nbsp;
			<input type="radio" name="no5" value="2">아니다&nbsp;
			<input type="radio" name="no5" value="3">보통이다&nbsp;
			<input type="radio" name="no5" value="4">그렇다&nbsp;
			<input type="radio" name="no5" value="5">매우그렇다&nbsp;	<br><br>	
		<span style="font-weight:bold">6. 강의 내용이 효과적으로 전달되어 이해하기 쉬웠다.</span><br>
			<input type="radio" name="no6" value="1">전혀아니다&nbsp;
			<input type="radio" name="no6" value="2">아니다&nbsp;
			<input type="radio" name="no6" value="3">보통이다&nbsp;
			<input type="radio" name="no6" value="4">그렇다&nbsp;
			<input type="radio" name="no6" value="5">매우그렇다	&nbsp;<br><br>	
		<span style="font-weight:bold">7. 본 강의를 통하여 해당분야에 대한 충분한 지적 자극을 받았다.</span><br>
			<input type="radio" name="no7" value="1">전혀아니다&nbsp;
			<input type="radio" name="no7" value="2">아니다&nbsp;
			<input type="radio" name="no7" value="3">보통이다&nbsp;
			<input type="radio" name="no7" value="4">그렇다&nbsp;
			<input type="radio" name="no7" value="5">매우그렇다&nbsp;<br>	<br>	
		<span style="font-weight:bold">8. 교수님은 열의를 가지고 강의를 진행하였다.</span><br>
			<input type="radio" name="no8" value="1">전혀아니다&nbsp;
			<input type="radio" name="no8" value="2">아니다&nbsp;
			<input type="radio" name="no8" value="3">보통이다&nbsp;
			<input type="radio" name="no8" value="4">그렇다&nbsp;
			<input type="radio" name="no8" value="5">매우그렇다&nbsp;	<br><br>	
		<span style="font-weight:bold">9. 본 강의를 다른 학생에게 추천하고 싶다.</span><br>
			<input type="radio" name="no9" value="1">전혀아니다&nbsp;
			<input type="radio" name="no9" value="2">아니다&nbsp;
			<input type="radio" name="no9" value="3">보통이다&nbsp;
			<input type="radio" name="no9" value="4">그렇다&nbsp;
			<input type="radio" name="no9" value="5">매우그렇다&nbsp;	<br><br>	
		<span style="font-weight:bold">10. 본 강의는 전반적으로 유익하였다. </span><br>
			<input type="radio" name="no10" value="1">전혀아니다&nbsp;
			<input type="radio" name="no10" value="2">아니다&nbsp;
			<input type="radio" name="no10" value="3">보통이다&nbsp;
			<input type="radio" name="no10" value="4">그렇다&nbsp;
			<input type="radio" name="no10" value="5">매우그렇다&nbsp;<br><br>
		<span style="font-weight:bold">교수에게 하고 싶은 말 </span><br>
		<textarea rows="10" cols="60" name="prof_say" Placeholder="교수에게 하고싶은 말을 입력하세요." style="resize:none;"></textarea><br><br>
		<input type="button" class="btn btn-dark"  value="제출" id="dataSubmit">
</body>