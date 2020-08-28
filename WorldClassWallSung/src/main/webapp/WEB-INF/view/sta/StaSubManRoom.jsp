<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<style>
   .input30{width:20px; height:20px;}
</style>

<script>
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
</head>
<body>
   <form method="post" name="checkb" action="lecturecon.go">
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
      onclick="CountChecked(this)">
      <%      
      }
      %>
      <br>
      <%
         }
      %>
      <input type="submit" value="완료">
   </form>
</body>
</html>