<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
    <title>Bootstrap Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="<c:url value="/resources/css/profile_style.css" />" rel="stylesheet">
    <script src="https://kit.fontawesome.com/89f095f2b7.js" crossorigin="anonymous"></script>
</head>
<style>
    .panel-default {
        width: 600px;
        border-color: #ddd;
    }
    .btn-primary {
        background-color : blue;
        border-color: red;
    }
    .btn {
        height: 25px;
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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
    function btn(){
        alert('개인정보가 변경 되었습니다.');
        return true;
    }

    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete : function(data) {
                document.getElementById("stu_zip").value = data.zonecode;
                document.getElementById("stu_address").value = data.address;
            }
        }).open();
    }

    function inputPhoneNumber(obj) {



        var number = obj.value.replace(/[^0-9]/g, "");
        var phone = "";



        if(number.length < 4) {
            return number;
        } else if(number.length < 7) {
            phone += number.substr(0, 3);
            phone += "-";
            phone += number.substr(3);
        } else if(number.length < 11) {
            phone += number.substr(0, 3);
            phone += "-";
            phone += number.substr(3, 3);
            phone += "-";
            phone += number.substr(6);
        } else {
            phone += number.substr(0, 3);
            phone += "-";
            phone += number.substr(3, 4);
            phone += "-";
            phone += number.substr(7);
        }
        obj.value = phone;
    }
</script>
<body>
<div class="container">
<h3>개인정보 확인 및 변경</h3>
    <div class="row">
        <form action="stuInfoUpUp.do">
            <div class="col-md-7">
                <div class="panel panel-default">
                    <div class="panel-heading">  <h4>User Profile</h4></div>
                    <div class="panel-body">

                        <div class="box box-info">

                            <div class="box-body">
                                <div class="col-sm-6">
                                    <div align="center"> <img alt="User Pic" src="resources/imgFile/${login.stu_path}" id="profile-image1" class="img-circle img-responsive">
                                        <input id="profile-image-upload" class="hidden" type="file">
                                        <!--Upload Image Js And Css-->
                                    </div>
                                    <br>
                                </div>
                                <div class="col-sm-6">
                                    <h2 style="color:#00b1b1;">${login.stu_name} </h2>
                                    <span><p><h4>${login.dept_nm}<h4></h2></p></span>
                                </div>
                                <div class="clearfix"></div>
                                <hr style="margin:5px 0 5px 0;">


                                <div class="col-sm-5 col-xs-6 tital ">이름</div><div class="col-sm-7 col-xs-6 ">${login.stu_name}</div>
                                <div class="clearfix"></div>
                                <div class="bot-border"></div>

                                <div class="col-sm-5 col-xs-6 tital ">성별</div><div class="col-sm-7 col-xs-6 ">${login.stu_gen}</div>
                                <div class="clearfix"></div>
                                <div class="bot-border"></div>

                                <div class="col-sm-5 col-xs-6 tital ">학년</div><div class="col-sm-7">${login.stu_year}</div>
                                <div class="clearfix"></div>
                                <div class="bot-border"></div>

                                <div class="col-sm-5 col-xs-6 tital ">생년월일</div><div class="col-sm-7">${login.stu_birth}</div>
                                <div class="clearfix"></div>
                                <div class="bot-border"></div>

                                <div class="col-sm-5 col-xs-6 tital ">상태</div><div class="col-sm-7">${login.state}</div>

                                <div class="clearfix"></div>
                                <div class="bot-border"></div>

                                <div class="col-sm-5 col-xs-6 tital ">국적</div><div class="col-sm-7">${login.stu_coun}</div>

                                <div class="clearfix"></div>
                                <div class="bot-border"></div>

                                <div class="col-sm-5 col-xs-6 tital ">학과</div><div class="col-sm-7">${login.dept_nm}</div>

                                <div class="clearfix"></div>
                                <div class="bot-border"></div>

                                <div class="col-sm-5 col-xs-6 tital ">연락처</div><div class="col-sm-7"><input type="text"  onKeyup="inputPhoneNumber(this);" name="stu_tel" id="stu_tel" value="${login.stu_tel}"></div>

                                <div class="clearfix"></div>
                                <div class="bot-border"></div>

                                <div class="col-sm-5 col-xs-6 tital ">E-mail</div><div class="col-sm-7"><input type="text" name="stu_email" id="stu_email" value="${login.stu_email}"></div>

                                <div class="clearfix"></div>
                                <div class="bot-border"></div>

                                <div class="col-sm-5 col-xs-6 tital ">우편번호</div><div class="col-sm-7"><input type="text" name="stu_zip" id="stu_zip" value="${login.stu_zip}" readonly>
                                <br><input type="button" value="우편번호찾기" class="btn btn-dark" onClick="sample4_execDaumPostcode()"> 우편번호를 검색하세요.</td></div>

                                <div class="clearfix"></div>
                                <div class="bot-border"></div>

                                <div class="col-sm-5 col-xs-6 tital ">주소</div><div class="col-sm-7"><input type="text" name="stu_address" id="stu_address" value="${login.stu_address}"></div>


                                <!-- /.box-body -->
                            </div>
                            <!-- /.box -->

                        </div>

                        <input type="hidden" name="dept_cd" value="${login.dept_cd}">
                        <input type="hidden" name="stu_no" value="${login.stu_no}">
                    </div>
                </div>
                <div>
	                <input type="submit" value="수정" style="margin-left: 230px" class="btn btn-dark" id="buttonfunc" onclick="javascript:btn()">
					<input type="button" value="취소" class="btn btn-dark" onclick="document.location.href='stuInfoSel.do'">
            	</div>
            </div>
        </form>
    </div>
</div>
</body>
</html>