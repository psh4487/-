<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>성적관리</title>
<style>
.container {
    width: auto;
}
 .btn {
        height: 23px;
        width: 80px;
        vertical-align: bottom;
        padding: .0rem .75rem;
        font-size: 13px;
    }
    
    .col-md-6 {
    width: 700px;
    max-width: 100%;
}
.btn-dark:focus {
         color: #fff;
          background-color: #343a40;
          border-color: #343a40;
      }
</style>
<script>
   $(function() {
      var url = "gm_years.do";
      $.ajax({
         type : "post",
         url : url,
         dataType : "json"
      }).done(
            function(args) {
               for (var i = 0; i < args.length; i++) {
                  $("#gm_years").append(
                        "<option value='"+args[i].years+"'>"
                              + args[i].years + "</option>");
               }
            }).fail(function(e) {
         alert(e.responseText);
      })
   });//ready 끝

   $(function() {
      var url = "gm_sem.do";
      $.ajax({
         type : "post",
         url : url,
         dataType : "json"
      }).done(
            function(args) {
               for (var i = 0; i < args.length; i++) {
                  $("#gm_sem").append(
                        "<option value='"+args[i].sem+"'>"
                              + args[i].sem + "학기" + "</option>");
               }
            }).fail(function(e) {
         alert(e.responseText);
      })
   });//ready 끝

   function seletGradeM() {
      var url = "gm_listAll.do";
      var years = $("#gm_years").val();
      var sem = $("#gm_sem").val();
      var stu_no = ${login.stu_no}
      var params = "gm_years=" + years + "&gm_sem=" + sem + "&stu_no=" + stu_no; // 여기를 수정하면 됩니다.
      $.ajax({
         type : "post",
         url : url,
         data : params,
         dataType : "json"
      }).done(function(args) {
         $("#ee").html("");         
         var main = "<table class='table table-striped custab' id='listInfo' style='text-align: center;'><tr><th>이수구분</th><th>강의명</th><th>강의코드</th><th>중간</th><th>기말</th><th>과제</th><th>출결</th><th>총점</th><th>평점</th><th>등급</th></tr></table>";
         $("#ee").append(main);
         var sum = 0;
         var avg = 0;
         var i = 0;
         for(i=0; i<args.length; i++) {
            var isu = "<tr><td>" + args[i].isu + "</td>";
            var sub_nm = "<td>" + args[i].sub_nm + "</td>";
            var sub_cd = "<td>" + args[i].sub_cd + "</td>";
            var mid_score = "<td>" + args[i].mid_score + "</td>";
            var end_score = "<td>" + args[i].end_score + "</td>";
            var report_score = "<td>" + args[i].report_score + "</td>";
            var attend_score = "<td>" + args[i].attend_score + "</td>";
            var attend_sum = "<td>" + args[i].attend_sum + "</td>";
            var attend_rating = "<td>" + args[i].attend_rating + "</td>";
            var attend_grade = "<td>" + args[i].attend_grade + "</td></tr>";
            $("#listInfo").append(isu + sub_nm + sub_cd + mid_score + end_score + report_score + attend_score + attend_sum + attend_rating + attend_grade);
         }
      })
   }
</script>

</head>
<body>
<div class="container">
	<h2>성적 관리</h2>
   <select class="container" id="gm_years" name="gm_years">
      <option value="">::연도선택::</option>
   </select>
   <select class="container" id="gm_sem" name="gm_sem">
      <option value="">::학기선택::</option>
   </select>
   <input class="btn btn-dark" type="button" value="조회" onclick="seletGradeM()">
   <hr>
</div>
<div class="container">
   <div class="row col-md-6 col-md-offset-2 custyle" id = "ee"></div>
</div>
</body>
</html>