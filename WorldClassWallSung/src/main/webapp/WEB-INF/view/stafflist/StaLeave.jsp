<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>휴복학리스트</title>
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

<script>
function ok_btn(e){   
   if (confirm("승인하시겠습니까?") == true){    //확인
      location.href='StaLeavechaUpdate.do?no='+e;         
    }else{   //취소
        return false;
       }
   }   

function no_btn(e){   
   if (confirm("미승인하시겠습니까?") == true){    //확인
      location.href='StaLeavechaUpdate.do?no='+e;         
    }else{   //취소
        return false;
       }
   }   
</script>




</head>
<body>

<div class="container">
<h2>휴/복학 관리</h2>
<div class="container" style="width: 437px;">
<div style="float: left; width: 50%; margin:30px;">
   <form name="leaveForm" method="post">
      <table id="leavetable"  class='table table-striped custab' style='text-align: center; width: 900px;'>
         <tr>
            <td>학번</td>
            <td>이름</td>
            <td>연도</td>
            <td>학기</td>
            <td>학적변동</td>
            <td>신청일</td>
            <td>승인</td>
            <td>미승인</td>
         </tr>

         <c:forEach items="${selectLeaveList}" var="list">
            <tr>
               <td align="center">${list.stu_no}</td>
               <td align="center">${list.stu_name}</td>
               <td align="center">${list.leave_year}</td>
               <td align="center">${list.leave_sem}</td>
               <td align="center">${list.leave_change}</td>
               <td align="center">${list.leave_dt}</td>
               <td align="center">
               <button type="button" id="${list.no}" class='btn btn-dark'
                  onclick="ok_btn('${list.no}')">승인</button></td>
               <td align="center">
               <button type="button" id="${list.no}" class='btn btn-dark'
                  onclick="no_btn('${list.no}')">미승인</button></td>
            </tr>

         </c:forEach>


      </table>
   </form>


</div>
</div>
</div>
</body>
</html>
