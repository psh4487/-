<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>����öȸ</title>
<script>
   var max = 0;
   $(function() {
      var count = $(".check").length;
      console.log(count);
      for (var i = 0; i < count; i++) {
         max += parseInt($(".check").html());
         console.log(max);
      }
      $("#revokeMinu").html(max);
   });
   $(function() {
       <c:forEach var="list" items="${revklist}" varStatus="status">
         $('#subm${status.count}').click(function() {
            var confirm_test = confirm("��/���� ��û�� �Ͻðڽ��ϱ� ?");
               var data${status.count} = $('#subcd_val${status.count}').val();
                 if(data${status.count} == ${list.sub_cd}) {
                  if ( confirm_test == true ) {
                       location.href='revokeDelete.do?sub_cd=${list.sub_cd}&stu_no=${login.stu_no}' // ���⸦ �����ϸ� �˴ϴ�.
                  } else if ( confirm_test == false ) {
                      return;
                  }
               }
         });
      </c:forEach>
   });
</script>
</head>
<body>
      <div class="container" style="height: 600px; width: 700px;">
      <h2>���� öȸ</h2>
         <span style="line-height: 190%"><br></span>
         <table class="table table-striped custab">
            <tr>
               <td width="100">���� �ڵ�</td>
               <td width="300">���Ǹ�</td>
               <td width="100">�̼�����</td>
               <td width="50">����</td>
               <td width="100">������</td>
               <td width="50">öȸ</td>
            </tr>
            <c:forEach var="list" items="${revklist}" varStatus="status">
               <tr>
                  <td id="val${status.count}">${list.sub_cd}</td>
                  <td>${list.sub_nm}</td>
                  <td>${list.isu}</td>
                  <td class="check">${list.credit}</td>
                  <td>${list.prof_nm}</td>
                  <td>
                  <input class="btn btn-dark" type="button"  value="���� öȸ" id="subm${status.count}">
                  <input type="hidden" value="${list.sub_cd}" id="subcd_val${status.count}">
                  <input type="hidden" value="${login.stu_no}" name="stu_no"> <!-- ���⸦ �����ϸ� �˴ϴ�. -->
                  </td>
               </tr>
            </c:forEach>
         </table>
         <div style="line-height: 50%;">
            <br>
         </div>
         <input type="hidden" id="savaSum" value="0">
         <table style ="float:right;" class="table-striped custab ">
            <tr>
               <td width="120">���� ����</td>
               <td width="50" id="revokeMinu"></td>
            </tr>
         </table>
      </div>
</body>
</html>