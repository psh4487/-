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
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="<c:url value="/resources/css/profile_style.css" />"
    rel="stylesheet">
    <script src="https://kit.fontawesome.com/89f095f2b7.js"
            crossorigin="anonymous"></script>
</head>
<style>
    .panel-default {
        width: 600px;
        border-color: #ddd;
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

    .btn-dark:hover {
        color: #dedede;
        background-color: #1f2328;
        border-color: #1f2328;
    }
</style>
<body>
<div class="container">
    <h3>개인정보 확인 및 변경</h3>
    <div class="row">
        <form action="stuInfoUpform.do">
            <div class="col-md-7">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4>User Profile</h4>
                    </div>
                    <div class="panel-body">

                        <div class="box box-info">

                            <div class="box-body">
                                <div class="col-sm-6">
                                    <div align="center">
                                        <img alt="User Pic"
                                             src="resources/imgFileSta/${login.staff_path}"
                                             id="profile-image1" class="img-circle img-responsive">
                                        <input id="profile-image-upload" class="hidden" type="file">
                                        <!--Upload Image Js And Css-->

                                    </div>

                                    <br>

                                    <!-- /input-group -->
                                </div>
                                <div class="col-sm-6">
                                    <h2 style="color: #00b1b1;">${login.staff_nm}</h2>
                                    <span><p>
											<h4>${login.staff_dept}<h4>
													</h2>
                                        </p></span>
                                </div>
                                <div class="clearfix"></div>
                                <hr style="margin: 5px 0 5px 0;">


                                <div class="col-sm-5 col-xs-6 tital ">이름</div>
                                <div class="col-sm-7 col-xs-6 ">${login.staff_nm}</div>
                                <div class="clearfix"></div>
                                <div class="bot-border"></div>

                                <div class="col-sm-5 col-xs-6 tital ">성별</div>
                                <div class="col-sm-7 col-xs-6 ">${login.staff_gen}</div>
                                <div class="clearfix"></div>
                                <div class="bot-border"></div>

                                <div class="col-sm-5 col-xs-6 tital ">생년월일</div>
                                <div class="col-sm-7">${login.staff_birth}</div>
                                <div class="clearfix"></div>
                                <div class="bot-border"></div>

                                <div class="col-sm-5 col-xs-6 tital ">소속</div>
                                <div class="col-sm-7">${login.staff_dept}</div>
                                <div class="clearfix"></div>
                                <div class="bot-border"></div>

                                <div class="col-sm-5 col-xs-6 tital ">국적</div>
                                <div class="col-sm-7">${login.staff_coun}</div>
                                <div class="clearfix"></div>
                                <div class="bot-border"></div>

                                <div class="col-sm-5 col-xs-6 tital ">연락처</div>
                                <div class="col-sm-7">${login.staff_tel}</div>
                                <div class="clearfix"></div>
                                <div class="bot-border"></div>

                                <div class="col-sm-5 col-xs-6 tital ">E-mail</div>
                                <div class="col-sm-7">${login.staff_email}</div>
                                <div class="clearfix"></div>
                                <div class="bot-border"></div>

                                <div class="col-sm-5 col-xs-6 tital ">우편번호</div>
                                <div class="col-sm-7">${login.staff_zip}</div>
                                <div class="clearfix"></div>
                                <div class="bot-border"></div>

                                <div class="col-sm-5 col-xs-6 tital ">주소</div>
                                <div class="col-sm-7">${login.staff_address}</div>


                                <!-- /.box-body -->
                            </div>
                            <!-- /.box -->

                        </div>

                        <input type="hidden" name="staff_no" value="${login.staff_no}">
                    </div>
                </div>
                <input type="submit" style="margin-left: 250px"
                       class="btn btn-dark" value="수정하기">
            </div>
        </form>
    </div>
</div>
</body>
</html>