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
            type : "post" 
            ,url : "appLineAddForm_select_one.do" 
            ,dataType : "json"
         }).done(                
               function(args) {
                  for (var i = 0; i < args.length; i++) {
                     $("#Subject_room_tb").append(
                              "<option value='"+args[i]+"'>"
                                    + args[i]+ "</option>");
                  }        
               }).fail(function(e) {
            alert(e.responseText);
         })  
});
      
function check1(){//선택된 강의실명을 가져가서 강의신청된 시간은 체크박스를 체크못하게 막고 그외부분을 선택할수있게 만든 부분
         var Subject_room_tb=$("#Subject_room_tb").val();
         var params = "Subroom_nm=" + Subject_room_tb; 
            $.ajax({
               type : "post"
               ,url : "appLineAddForm_select_two.do"
               ,data : params
               ,dataType : "json"  
            }).done(function(args) {
            $("input:checkbox[name=checkb]").prop("disabled", false);  
               for (var i = 0; i <= args.length; i++) {
                 var times = args[i];
                 for (var day in times){  	
             		$("input:checkbox[name=checkb][value='"+times[day]+"']").prop("disabled", true);
       			   }                        
               }  
           }).fail(function(e) {
               alert(e.responseText);
            });
      }
//
function click1(){ //체크로 선택한값을 배열에 담아서 부모창의 텍스트박스에 집어넣는부분
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
//체크박스를 선택시에 3개이상 선택하면 선택못하게끔 막는 펑션
function CountChecked(checkbox) {
	if (checkbox.checked)
		totalChecked += 1; // totalChecked 증가
	else 
		totalChecked -= 1; // totalChecked 감소
	if (totalChecked > maxChecked) { 
		alert ("최대 3개 까지만 가능합니다."); 
		field.checked = false;
		totalChecked -= 1;
    }    
}
</script>
<body>
	<select id="Subject_room_tb" name="Subject_room_tb" onchange="check1()">
		<option value="">::강의실선택::</option>
	</select>
	<h2><span>시간/요일 &emsp;월  화 수 목 금</span></h2>
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
         <input type="checkbox" id="checkb" name="checkb" value="<%=t%>" class="input30"
         onclick="CountChecked(this)" style="width:18px;height:18px;" >
         <%      
         }
         %>
         <br>
         <%
            }
         %>
             <input type="button" value="보내기" onclick="click1()">
</body> 
</html>
