<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

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
	    	 document.getElementById("staff_zip").value = data.zonecode;
	         document.getElementById("staff_address").value = data.address;
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
    var userinput = eval("document.joinstaform");
    
    if(!userinput.staff_nm.value) {
        alert("교직원 이름을 입력하세요");
        return false;
    }
   
    if(!userinput.staff_birth.value ) {
        alert("생년월일을 입력하세요");
        return false;
    }
   
  
    if(!userinput.staff_gen.value) {
        alert("성별을 입력하세요");
        return false;
    }
    
    if(!userinput.staff_coun.value)
    {
        alert("국적을 입력하세요");
        return false;
    } 

    if(!userinput.staff_dept.value)
    {
        alert("부서를 입력하세요");
        return false;
    } 

    if(!userinput.staff_tel.value)
    {
        alert("연락처를 입력하세요");
        return false;
    } 

    if(!userinput.staff_email.value)
    {
        alert("E-Mail을 입력하세요");
        return false;
    } 

    if(!userinput.staff_zip.value)
    {
        alert("우편번호를 입력하세요");
        return false;
    } 

    if(!userinput.staff_address.value)
    {
        alert("주소를 입력하세요");
        return false;
    } 
    
    
    	
    return true;
} 
</script> 

</head>
<body>

<form action="memberjoinsta" method="post" name="joinstaform" onSubmit="return checkIt()" enctype="multipart/form-data">

  <table width="700" border="1" cellspacing="0" cellpadding="3" align="center" >
    <tr>
    <td colspan="2" height="39" align="center"  >
       <font size="+1" ><b>교직원등록</b></font></td>
    </tr>
    <tr>
      <td width="200">교직원이름</td>
      <td width="400">
        <input type="text" id="staff_nm" name="staff_nm" size="15" maxlength="10">
      </td>
    </tr>
    <tr>
      <td width="200">생년월일</td>
      <td width="400">
        <input type="date" id="staff_birth" name="staff_birth" size="7" maxlength="6">
      </td>
    </tr>
    <tr>
      <td width="200">성별</td>
      <td width="400">
        <input type="text" id="staff_gen" name="staff_gen" size="40" maxlength="30">
      </td>
      </tr>
      <tr>
      <td width="200">국적</td>
      <td width="400">
        <input type="text" id="staff_coun" name="staff_coun" size="40" maxlength="30">
      </td>
    </tr>
    <tr>
      <td width="200">부서</td>
      <td width="400">
        <input type="text" id="staff_dept" name="staff_dept" size="40" maxlength="30">
      </td>
    </tr>
     <tr>
      <td width="200">연락처</td>
      <td width="400">
        <input type="text" id="staff_tel" name="staff_tel" size="40" maxlength="30">
      </td>
    </tr>
    <tr>
      <td width="200">E-Mail</td>
      <td width="400">
        <input type="email" id="staff_email" name="staff_email" size="40" maxlength="30">
      </td>
    </tr>
    <tr> 
       <td width="200">우편번호</td>
       <td> <input type="text" id="staff_zip" name="staff_zip" size="7" readonly>
               <input type="button" value="우편번호찾기" onClick="sample4_execDaumPostcode()">
               우편번호를 검색하세요.</td>
          </tr>
    <tr>
    <tr> 
       <td>주소</td>
       <td><input type="text" id="staff_address" name="staff_address" size="70"></td>
    </tr>
    <tr>
		<td bgcolor="orange" width="70">업로드</td><td align="left">
		<input type="file" id="staff_path" name="staff_path"/></td>
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