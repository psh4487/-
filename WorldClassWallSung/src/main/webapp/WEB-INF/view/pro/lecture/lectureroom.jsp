<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>강의시간 선택</title>
<style>
#upFile {
   width: 0;
   height: 0;
   position: absolute;
   top: 0;
   left: 0;
}
.file_upload_btn {
   cursor: pointer;
   display: inline-block;
   background: #000;
   line-height: 30px;
   color: #fff;
   padding: 0px 10px;
}
.code_num {
   width: 40px;
   display: inline-block;
}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
$(document).ready(function() {
         $.ajax({
            type : "post" // 포스트방식
            ,url : "appLineAddForm_select_one.do" // url 주소
            ,dataType : "json"
         }).done(                
               function(args) { //응답이 성공 상태 코드를 반환하면 호출되는 함수
                  for (var i = 0; i < args.length; i++) {
                     //console.log(args); 
                     $("#Subject_room_tb").append(
                              "<option value='"+args[i]+"'>"
                                    + args[i]+ "</option>");
                  }        
               }).fail(function(e) {
            alert(e.responseText);
         })  
});//ready 끝
      
function check1(){   	
  $("input:checkbox[name=checkb]").prop("disabled", false);
         var Subject_room_tb=$("#Subject_room_tb").val();
         var params = "Subroom_nm=" + Subject_room_tb; 
            $.ajax({
               type : "post"
               ,url : "appLineAddForm_select_two.do"
               ,data : params
               ,dataType : "json"
               ,contentType: "application/x-www-form-urlencoded; charset=UTF-8"
            }).done(function(args) {   
           	var splitDATA;            
               $("input:checkbox[name='checkb']").attr("checked", false);      	  
               for (var idx = 0; idx <= args.length; idx++) {
                  var times = args[idx];
                  var DATA="";	
                 for (var name in times){
                 //alert(times[name]);              	
             		$("input:checkbox[name=checkb][value='"+times[name]+"']").prop("disabled", true);
       			   }               
               //console.log(checkBoxArr);             
               }  
           }).fail(function(e) {
               alert(e.responseText);
            });
      }

function click1(){
 		var checkBoxArr = []; 		
 		var checkBoxArr2 = []; 		
        $("input[name=checkb]:checked").each(function() {
        	checkBoxArr.push($(this).val());
                opener.document.form.check.value = checkBoxArr;
            	});
        for(var i=0;i<checkBoxArr.length;i++){ 
        	if(Math.floor(checkBoxArr[i]/10)==0){				
			 	checkBoxArr2.push("월"+checkBoxArr[i]%10);
			 	}
			if(Math.floor(checkBoxArr[i]/10)==1){				
				checkBoxArr2.push("화"+checkBoxArr[i]%10);				
				}
			if(Math.floor(checkBoxArr[i]/10)==2){
				checkBoxArr2.push("수"+checkBoxArr[i]%10);
				}
			if(Math.floor(checkBoxArr[i]/10)==3){
				checkBoxArr2.push("목"+checkBoxArr[i]%10);
				}
			if(Math.floor(checkBoxArr[i]/10)==4){
				checkBoxArr2.push("금"+checkBoxArr[i]%10);
				}	
			console.log(checkBoxArr2[i]);
        		opener.document.form.check1.value = checkBoxArr2;
       	 	}
        opener.document.form.subroom_nm.value = $("#Subject_room_tb").val();
         self.close(); 
         }

var maxChecked = 3;   //선택가능한 체크박스 갯수
var totalChecked = 0; // 설정 끝
function CountChecked(field) {
	if (field.checked) // input check 박스가 체크되면 
		totalChecked += 1; // totalChecked 증가
	else // 체크가 아니면
		totalChecked -= 1; // totalChecked 감소
	if (totalChecked > maxChecked) { // totalchecked 수가 maxchecked수보다 크다면
		alert ("최대 3개 까지만 가능합니다."); // 팝업창 띄움
		field.checked = false;
		totalChecked -= 1;
    }    
}
</script>
<body>
	<h1>강의실 선택</h1>
<!-- 	<select id="build" name="build" onchange="check123()">
		<option value="">::건물선택::</option>
	</select> -->
	<select id="Subject_room_tb" name="Subject_room_tb" onchange="check1()">
		<option value="">::강의실선택::</option>
	</select>
	<h2><span>시간/요일 월 화 수 목 금</span></h2>
     <%
            for (int i = 1; i <= 9; i++) {
               
               if(i<2){%>
               <%=i%>교시(0<%=(i+8)%>:00~<%=(i+9)%>:00)
               <%}else{%>
               <%=i%>교시(<%=(i+8)%>:00~<%=(i+9)%>:00)
                     <%}%>   
                     
         <%
            for (int t = i; t <= 49; t = t + 10) {   
               
         %>
         <input type="checkbox" id="dd" name="checkb" value="<%=t%>" class="input30"
         onclick="CountChecked(this)" >
         <%      
         }
         %>
         <br>
         <%
            }
         %>
             <input type="button" value="보내기" onclick="click1()">
         </form>
</body> 
</html>
