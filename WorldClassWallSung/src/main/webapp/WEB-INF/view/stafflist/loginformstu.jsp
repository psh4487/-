<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
          integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <link href="<c:url value="/resources/css/loginstyles.css" />" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script type="text/javascript">
        $(function() {
            $('#buttonfunc').click(function() {
                var all_cd = $('input[name=all_cd]').val();
                var all_pwd = $('input[name=all_pwd]').val();
                if (all_cd == "") {
                    alert("ID를 입력하세요.");
                    return false;

                } else if (all_pwd == "") {
                    alert("비밀번호를 입력하세요.");
                    return false;
                } else {
                    return true;
                }
            });
        });
    </script>
</head>
<body>
<div class="container">
    <div class="d-flex justify-content-center h-100">
        <div class="card">
            <div class="card-header">
                <br><h2>월성 대학교 </h2>
                <h4>포털 시스템</h4>
                <div class="d-flex justify-content-end social_icon">
                </div>
            </div>
            <div class="card-body">
                <form name="myform" id="stu_list" action="loginCheck.do" method="post">
                    <div class="input-group form-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-user"></i></span>
                        </div>
                        <input type="text" name="all_cd" id="all_cd" oninput="this.value = this.value.replace(/[^0-9]/g, '');" class="form-control" placeholder="username">
                    </div>
                    <div class="input-group form-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-key"></i></span>
                        </div>
                        <input type="password" name="all_pwd" id="all_pwd"  class="form-control" placeholder="password">
                    </div>
                    <div class="form-group">
                        <input type="submit" id="buttonfunc" name="submit"  value="로그인" class="btn float-right login_btn">
                    </div>
                </form>
            </div>
            <div class="card-footer">
                <div class="d-flex flex-end">
                    <a href='find_pass_start_all.do' onclick="window.open(this.href,'find_pass','width=430,height=430,scrollbars=no, toolbars=no, menubar=no, resizable=no'); return false;" target="_blank">비밀번호 찾기</a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>