<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script type="text/javascript">

function dispList(selectList) {

var obj1 = document.getElementById("stu_list"); // 학생 리스트
var obj2 = document.getElementById("pro_list");
var obj3 = document.getElementById("staff_list");// 선생님 리스트


if( selectList == "0" ) { // 학생 리스트
obj1.style.display = "block";	
obj2.style.display = "none";
obj3.style.display = "none";
} 
if( selectList == "1" ){ // 선생님 리스트
obj1.style.display = "none";
obj2.style.display = "block";
obj3.style.display = "none";
}
if( selectList == "2" ){ // 교직원 리스트
	obj1.style.display = "none";
	obj2.style.display = "none";
	obj3.style.display = "block";

}
}
</script>
   <script>

       function begin(){
         document.myform.id.focus();
       }
       function checkIt(){
    	   
    	  
         if(!document.myform.id.value){
           alert("id를 입력하지 않으셨습니다.");
           document.myform.id.focus();
           return false;
         }
         if(!document.myform.passwd.value){
           alert("비밀번호를 입력하지 않으셨습니다.");
           document.myform.passwd.focus();
           return false;
           
         }
         
       }
    
   </script>

	<h1>00대학교 포털시스템</h1>


	<input type="radio" name="choose" id="student" onclick="dispList('0');">학생
	<input type="radio" name="choose" id="professor"
		onclick="dispList('1');">교수
	<input type="radio" name="choose" id="staff" onclick="dispList('2');">교직원

	<br />
	<br />

	<div id="stu_list" style="display: block">
		<form name="myform" action="loginCheck" method="post"
			onSubmit="return 

checkIt()">
			<TABLE cellSpacing=1 cellPadding=1 width="500" border=1
				align="center">



				<TR height="30">
					<TD width="110" align=center>학번</TD>
					<TD width="150" align=center>
					<INPUT type="text" name="stu_no" id="stu_no"
						size="15" maxlength="12"></TD>
				</TR>
				<TR height="30">
					<TD width="110" align=center>비밀번호</TD>
					<TD width="150" align=center>
					<INPUT type=password
						name="stu_pwd" id="stu_pwd" size="15" maxlength="12"></TD>
				</TR>
				<TR height="30">
					<TD colspan="2" align="middle"><INPUT type=submit id="submit" name="submit" value="로그인">
						<INPUT type=reset value="다시입력"> 
						<input type="button"
						value="비밀번호 찾기"
						onclick="javascript:window.location='passwordModifyForm.jsp'"></TD>

					</TD>
				</TR>
			</TABLE>
		</form>
	</div>

	<div id="pro_list" style="display: none">
		<form name="myform" action="loginPro.jsp" method="post"
			onSubmit="return 

checkIt()">
			<TABLE cellSpacing=1 cellPadding=1 width="500" border=1
				align="center">



				<TR height="30">
					<TD width="110" align=center>교수번호</TD>
					<TD width="150" align=center><INPUT type="text" name="id"
						size="15" maxlength="12"></TD>
				</TR>
				<TR height="30">
					<TD width="110" align=center>비밀번호</TD>
					<TD width="150" align=center>
					<INPUT type=password
						name="passwd" size="15" maxlength="12"></TD>
				</TR>
				<TR height="30">
					<TD colspan="2" align="middle"><INPUT type=submit value="로그인">
						<INPUT type=reset value="다시입력"> <input type="button"
						value="비밀번호 찾기"
						onclick="javascript:window.location='passwordModifyForm.jsp'"></TD>

					</TD>
				</TR>
			</TABLE>
		</form>
	</div>

	<div id="staff_list" style="display: none">
		<form name="myform" action="loginPro.jsp" method="post"
			onSubmit="return 

checkIt()">
			<TABLE cellSpacing=1 cellPadding=1 width="500" border=1
				align="center">



				<TR height="30">
					<TD width="110" align=center>교직원번호</TD>
					<TD width="150" align=center><INPUT type="text" name="id"
						size="15" maxlength="12"></TD>
				</TR>
				<TR height="30">
					<TD width="110" align=center>비밀번호</TD>
					<TD width="150" align=center><INPUT type=password
						name="passwd" size="15" maxlength="12"></TD>
				</TR>
				<TR height="30">
					<TD colspan="2" align="middle"><INPUT type=submit value="로그인">
						<INPUT type=reset value="다시입력"> <input type="button"
						value="비밀번호 찾기"
						onclick="javascript:window.location='passwordModifyForm.jsp'"></TD>

					</TD>
				</TR>
			</TABLE>
		</form>
	</div>
</body>
</html>