<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>학생등록</title>
<style>
.form-control {
   width: auto;;
}


.table {
   width:700px;
}
	html {
		background: url(images/bg.jpg) no-repeat 50% 50% fixed;
		-webkit-background-size: cover;
		-moz-background-size: cover;
		-o-background-size: cover;
		background-size: cover;
	}

	.container {
	    width: auto;
	    max-width: 1140px;
	}
	
	.table td, .table th {
	    padding: .30rem;
	}
	.btn-file {
            position: relative;
            overflow: hidden;
        }

 
        .btn-primary {
            background-color : blue;
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
</style>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
$(function() {
	$('#btn-signup').click(function() {
		var confirm_test = confirm("교수를 등록하시겠습니까?");
	    if ( confirm_test == true ) {
	    	return true;
			
	    } else if ( confirm_test == false ) {
	        return false;
	    }
	
});
});


	function sample4_execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				document.getElementById("prof_zip").value = data.zonecode;
				document.getElementById("prof_address").value = data.address;
			}
		}).open();
	}

	function checkIt() {
	 var userinput = eval("document.joinproform");
	
	 if(!userinput.prof_nm.value) {
	 alert("교수이름을 입력하세요");
	 return false;
	 }
	
	 if(!userinput.prof_birth.value ) {
	 alert("생년월일을 입력하세요");
	 return false;
	 }
	
	
	 if(!userinput.porf_gen.value) {
	 alert("성별을 입력하세요");
	 return false;
	 }
	
	 if(!userinput.prof_coun.value)
	 {
	 alert("국적을 입력하세요");
	 return false;
	 } 

	

	 if(!userinput.prof_tel.value)
	 {
	 alert("연락처를 입력하세요");
	 return false;
	 } 

	 if(!userinput.prof_email.value)
	 {
	 alert("E-Mail을 입력하세요");
	 return false;
	 } 

	 if(!userinput.prof_zip.value)
	 {
	 alert("우편번호를 입력하세요");
	 return false;
	 } 

	 if(!userinput.prof_address.value)
	 {
	 alert("주소를 입력하세요");
	 return false;
	 } 

	 if(!userinput.prof_path.value)
	    {
	        alert("업로드할 파일을 선택하세요");
	        return false;
	    } 
	
	
	
	 return true;
	 }

	 
</script>
</head>
<body>
<div style="float: left; width: 50%; margin:30px;">
	<form action="memberjoinpro.do" method="post" name="joinproform"
		onSubmit="return checkIt()" enctype="multipart/form-data">

		<table class='table table-striped custab' style='width: 1000px;'>
			<tr>
				<td colspan="2" height="39" align="center"><font size="+1"><b>교수등록</b></font></td>
			</tr>

			<tr>
				<td width="200" style='text-align: center;'>교수이름</td>
				<td width="400"><input type="text" id="prof_nm" name="prof_nm"
					size="15" maxlength="10"></td>
			</tr>
			<tr>
				<td width="200" style='text-align: center;'>생년월일</td>
				<td width="400"><input type="date" id="prof_birth"
					name="prof_birth" size="7" maxlength="6"></td>
			</tr>
			<tr>
				<td width="200" style='text-align: center;'>성별</td>
				<td width="400"><input type="text" id="porf_gen"
					name="prof_gen" size="40" maxlength="30"></td>
			</tr>
			<tr>
				<td width="200" style='text-align: center;'>국적</td>
				<td width="400"><input type="text" id="prof_coun"
					name="prof_coun" size="40" maxlength="30"></td>
			</tr>
			<tr>
				<td width="200" style='text-align: center;'>학과선택</td>
				<td width="400"><select id="dept_nm" name="dept_nm">

						<c:forEach var="result" items="${selectStuDeptList}">

							<option>${result.dept_nm}</option>

						</c:forEach>

				</select></td>
			</tr>
			<tr>
				<td width="200" style='text-align: center;'>연락처</td>
				<td width="400"><input type="text" id="prof_tel"
					name="prof_tel" size="40" maxlength="30"></td>
			</tr>
			<tr>
			<tr>
				<td width="200" style='text-align: center;'>E-Mail</td>
				<td width="400"><input type="email" id="prof_email"
					name="prof_email" size="40" maxlength="30"></td>
			</tr>
			<tr>
				<td width="200" style='text-align: center;'>우편번호</td>
				<td><input type="text" id="prof_zip" name="prof_zip" size="7"
					readonly> <input type="button" value="우편번호찾기"
					onClick="sample4_execDaumPostcode()"> 우편번호를 검색하세요.</td>
			</tr>
			<tr>
			<tr>
				<td style='text-align: center;'>주소</td>
				<td><input type="text" id="prof_address" name="prof_address"
					size="70"></td>
			</tr>
			<tr>
				<td style='text-align: center;'>업로드</td>
				<td align="left"><input type="file" id="prof_path"
					name="prof_path" /></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				<input type="submit"
					id="btn-signup" name="submit" value="등   록" class='btn btn-dark'> <input
					type="reset" name="reset" value="다시입력" class='btn btn-dark'> 
			</tr>
		</table>
	</form>
	</div>
</body>
</html>