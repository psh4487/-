<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>학생등록</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
function sample4_execDaumPostcode() {
   new daum.Postcode({
	    oncomplete: function(data) {
	    	 document.getElementById("prof_zip").value = data.zonecode;
	         document.getElementById("prof_address").value = data.address;
	    }
	}).open();
}

function goLayout(){
	var mem_no = ${login.mem_no};

	if(mem_no == 3){
		location.href="Go3.do";
	}else{
		location.href="Go4.do";
	}
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
    
    
    	
    return true;
}


</script> 
</head>
<body>

<form action="memberjoinpro" method="post" name="joinproform" onSubmit="return checkIt()" enctype="multipart/form-data">

  <table width="700" border="1" cellspacing="0" cellpadding="3" align="center" >
    <tr>
    <td colspan="2" height="39" align="center"  >
       <font size="+1" ><b>교수등록</b></font></td>
    </tr>
   
    <tr>
      <td width="200">교수이름</td>
      <td width="400">
        <input type="text" id="prof_nm" name="prof_nm" size="15" maxlength="10">
      </td>
    </tr>
    <tr>
      <td width="200">생년월일</td>
      <td width="400">
        <input type="date" id="prof_birth" name="prof_birth" size="7" maxlength="6">
      </td>
    </tr>
    <tr>
      <td width="200">성별</td>
      <td width="400">
        <input type="text" id="porf_gen" name="prof_gen" size="40" maxlength="30">
      </td>
      </tr>
      <tr>
      <td width="200">국적</td>
      <td width="400">
        <input type="text" id="prof_coun" name="prof_coun" size="40" maxlength="30">
      </td>
    </tr>
    <tr>
      <td width="200">학과선택</td>
      <td width="400">
       <select id="dept_nm" name="dept_nm">

		<c:forEach var="result" items="${selectStuDeptList}">

			<option>${result.dept_nm}</option>

		</c:forEach>
  
	</select>
	</td>
    </tr>
     <tr>
      <td width="200">연락처</td>
      <td width="400">
        <input type="text" id="prof_tel" name="prof_tel" size="40" maxlength="30">
      </td>
    </tr>
    <tr> 
    
    <tr>
      <td width="200">E-Mail</td>
      <td width="400">
        <input type="email" id="prof_email" name="prof_email" size="40" maxlength="30">
      </td>
    </tr>
    <tr> 
       <td width="200">우편번호</td>
       <td> <input type="text" id="prof_zip" name="prof_zip" size="7" readonly>
               <input type="button" value="우편번호찾기" onClick="sample4_execDaumPostcode()">
               우편번호를 검색하세요.</td>
          </tr>
    <tr>
    <tr> 
       <td>주소</td>
       <td><input type="text" id="prof_address" name="prof_address" size="70">
       </td>
    </tr>
    <tr>
				<td bgcolor="orange" width="70">업로드</td><td align="left">
				<input type="file" id="prof_path" name="prof_path"/></td>
			</tr>
    <tr>
      <td colspan="2" align="center" >
          <input type="submit" id="submit" name="submit" value="등   록" >
          <input type="reset" name="reset" value="다시입력">
          <input type="button" value="취소" onClick="goLayout()">
      </td>
    </tr>
  </table>
</form>
</body>
</html>