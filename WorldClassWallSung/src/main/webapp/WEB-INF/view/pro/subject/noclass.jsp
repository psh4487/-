<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>휴강 신청</title>
</head>
<body>
<script>
		function selectSub_tag() {
			var sub_nm = $("#sub_tag").val();			
			var url = "noclass.do";
			var params = "sub_nm=" + sub_nm;
			console.log(sub_nm);
			$.ajax({
				type : "post",
				url : url,
				data : params,
				dataType : "json"
			}).done(function(args) {
				var sub_cd = args.sub_cd;
				var sub_nm = args.sub_nm;				
				$("#sub_cd").text("");
				$("#sub_cd").val(sub_cd);			 	
				$("#sub_nm").text("");
				$("#sub_nm").val(sub_nm); 
			});
		}
		function checkIt(){		
			var a = $("#sub_nm").val()
			var b = $("#can_dt").val()
			var c = $("#can_iu").val()			
			
			if (!a){	                  
				alert("강의를 선택하세요.");		
				return false;
			}
			if (!b){	                  
				alert("날짜를 선택하세요.");		
				return false;
			}
			if (!c){	                  
				alert("휴강 사유를 입력하세요.");
				document.myForm.can_iu.focus();
				return false;
			}			
			if (confirm("휴강 신청을 하시겠습니까?") == true){    //확인	 
				  return true;
				 }else{   //취소
				     return false;
				}
		}
</script>
	<select name="sub_tag" id="sub_tag" onchange="selectSub_tag()">
			<option value="">::휴강과목::</option>
		<c:forEach var="item" items="${list}">
			<option value="${item}">${item}</option>
		</c:forEach>
	</select>
	<br>
	<form action="insert.do" onsubmit="return checkIt()" name ="myForm">
	<br>
	<div style="border: 1px solid; width: 500px;">
			강의코드  : <input type="text" name="sub_cd" id="sub_cd">
			교수명  :  <input type="text" name="prof_nm" value="${login.prof_nm}"><br>
			강의명  : <input type="text" name="sub_nm" id="sub_nm">
			날짜선택  : <input	type="date" name="can_dt" id="can_dt"><br> 
			휴강 사유  :  <textarea style="width: 350px; height: 100px;" name="can_iu" id="can_iu"></textarea>
	</div>
	<br>
	<input type="submit" value="휴강신청">
	</form>
</body>
</html>


