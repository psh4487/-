<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!------ Include the above in your HEAD tag ---------->

<!DOCTYPE html>
<html>
<head>
    <title>학생 사이드 메뉴</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link href="<c:url value="/resources/css/menustyle.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/table_style.css" />" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://kit.fontawesome.com/89f095f2b7.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<body>
<div class="content">
    <div class="colors">
        <a class="default" href="javascript:void(0)"></a>
        <a class="blue" href="javascript:void(0)"></a>
        <a class="green" href="javascript:void(0)"></a>
        <a class="red" href="javascript:void(0)"></a>
        <a class="white" href="javascript:void(0)"></a>
        <a class="black" href="javascript:void(0)"></a>
    </div>
    <div id="jquery-accordion-menu" class="jquery-accordion-menu white">
        <div class="jquery-accordion-menu-header"> WallSung University </div>
        <ul>
            <li class="active"><a href="#"><i class="fa fa-user"></i> 학생메뉴 <span class="submenu-indicator">+</span></a>
                <ul class="submenu">
                    <li><a href="#"> 학생 정보 확인 <span class="submenu-indicator">+</span></a>
                        <ul class="submenu">
                            <li><a href="stuInfoSel.do"> 개인정보 확인/변경 </a></li>
                            <li><a href="passUpForm.do"> 비밀번호 변경 </a></li>
                            <li><a href="scoreMain.do"> 종합 성적 </a></li>
                            <li><a href="subjectmain.do"> 이수학점 </a></li>                          
                            <li><a href="licenseMain.do"> 자격증/봉사활동 </a></li>
                        </ul>
                    </li>
                    <li><a href="leaveMain.do"> 휴/복학 신청 </a></li>
                    <li><a href="counselingMain.do"> 상담신청 </a></li>
                </ul>
            </li>
            <li><a href="#"><i class="fas fa-address-card"></i> 수업관리 <span class="submenu-indicator">+</span></a>
                <ul class="submenu">
                    <li><a href="scheduleMain.do"> 시간표 조회 </a></li>
                    <li><a href="selScheduleMain.do"> 강의실별 시간표 조회 </a></li>
                    <li><a href="revokeMain.do"> 수강철회 </a></li>
                    <li><a href="estimationMain.do"> 강의평가 </a></li>
                    <li><a href="insertReport.do"> 레포트 제출 </a></li>
                </ul>
            </li>
            <li><a href="applyinsert.do"><i class="far fa-address-card"></i> 수강관리 </a>
            <li><a href="gradeManaMain.do"><i class="fa fa-suitcase"></i> 성적관리 </a>
            <li><a href="#"><i class="fa fa-newspaper-o"></i> 게시판 <span class="submenu-indicator">+</span></a>
                <ul class="submenu">
                    <li><a href="boardMain.do"> 학교 게시판 </a></li>
                    <li><a href="subjectBoardMain.do"> 학과 게시판 </a></li>
                    <li><a href="qnaMain.do"> 질의 게시판 </a></li>
                </ul>
            </li>
        </ul>
        <div class="jquery-accordion-menu-footer"> World Class </div>
    </div>
</div>
</body>
</html>
<script src="<c:url value="/resources/js/menujs.js"/>"></script>