<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<head>
</head>
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

    /*     .btn-file input[type=file] {
            position: absolute;
            top: 0;
            right: 0;
            min-width: 100%;
            min-height: 100%;
            font-size: 100px;
            text-align: right;
            filter: alpha(opacity = 0);
            opacity: 0;
            outline: none;
            background: white;
            cursor: inherit;
            display: block;
        } */
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
<body>
<div class="container">
<div class="container" style="width: 1000px;">
<div style="float: left; width: 50%; margin:30px;">

<form name="form1" method="post">
   <table class="est_view" >
      <colgroup>
         <col width="15%" />
         <col width="35%" />
         <col width="15%" />
         <col width="35%" />
      </colgroup>


<c:forEach var="list" items="${list}">

      <span style="font-weight:bold"></span><br>      
   </c:forEach>   
   </table>
<span style="font-weight:bold; width: 800px;">1. 강의계획서가 충실하게 구성되어 강좌선택에 도움이 되었다.</span><br>
         <input type="checkbox" name="no1" value="1"  disabled="disabled">전혀아니다
         <input type="checkbox" name="no1" value="2"  disabled="disabled">아니다
         <input type="checkbox" name="no1" value="3"  disabled="disabled">보통이다
         <input type="checkbox" name="no1" value="4"  disabled="disabled">그렇다
         <input type="checkbox" name="no1" value="5"  disabled="disabled">매우그렇다<br><br>
      <span style="font-weight:bold">2. 강의자료가 적절히 활용되어 학습에 도움이 되었다.</span><br>
         <input type="checkbox" name="no2" value="1"  disabled="disabled">전혀아니다
         <input type="checkbox" name="no2" value="2"  disabled="disabled">아니다
         <input type="checkbox" name="no2" value="3"  disabled="disabled">보통이다
         <input type="checkbox" name="no2" value="4"  disabled="disabled">그렇다
         <input type="checkbox" name="no2" value="5"  disabled="disabled">매우그렇다<br><br>
      <span style="font-weight:bold">3. 이 수업은 전반적으로 출결관리가 잘 되었다.</span><br>
         <input type="checkbox" name="no3" value="1"  disabled="disabled">전혀아니다
         <input type="checkbox" name="no3" value="2"  disabled="disabled">아니다
         <input type="checkbox" name="no3" value="3"  disabled="disabled">보통이다
         <input type="checkbox" name="no3" value="4"  disabled="disabled">그렇다
          <input type="checkbox" name="no3" value="5"  disabled="disabled">매우그렇다   <br><br>
      <span style="font-weight:bold">4. 교수님은 학생들의 참여와 소통을 독려하였다.</span><br>
         <input type="checkbox" name="no4" value="1"  disabled="disabled">전혀아니다
         <input type="checkbox" name="no4" value="2"  disabled="disabled">아니다
         <input type="checkbox" name="no4" value="3"  disabled="disabled">보통이다
         <input type="checkbox" name="no4" value="4"  disabled="disabled">그렇다
          <input type="checkbox" name="no4" value="5"  disabled="disabled">매우그렇다   <br><br>
      <span style="font-weight:bold">5. 시험, 과제 등 성적 평가의 기준이 공정하였다.</span><br>
         <input type="checkbox" name="no5" value="1"  disabled="disabled">전혀아니다
         <input type="checkbox" name="no5" value="2"  disabled="disabled">아니다
         <input type="checkbox" name="no5" value="3" disabled="disabled">보통이다
         <input type="checkbox" name="no5" value="4" disabled="disabled">그렇다
          <input type="checkbox" name="no5" value="5"  disabled="disabled">매우그렇다   <br><br>
      <span style="font-weight:bold">6. 강의 내용이 효과적으로 전달되어 이해하기 쉬웠다.</span><br>
         <input type="checkbox" name="no6" value="1"  disabled="disabled">전혀아니다
         <input type="checkbox" name="no6" value="2" disabled="disabled">아니다
         <input type="checkbox" name="no6" value="3" disabled="disabled">보통이다
         <input type="checkbox" name="no6" value="4" disabled="disabled">그렇다
          <input type="checkbox" name="no6" value="5" disabled="disabled">매우그렇다   <br><br>
      <span style="font-weight:bold">7. 본 강의를 통하여 해당분야에 대한 충분한 지적 자극을 받았다.</span><br>
         <input type="checkbox" name="no7" value="1" disabled="disabled">전혀아니다
         <input type="checkbox" name="no7" value="2" disabled="disabled">아니다
         <input type="checkbox" name="no7" value="3" disabled="disabled">보통이다
         <input type="checkbox" name="no7" value="4" disabled="disabled">그렇다
          <input type="checkbox" name="no7" value="5" disabled="disabled">매우그렇다   <br><br>
      <span style="font-weight:bold">8. 교수님은 열의를 가지고 강의를 진행하였다.</span><br>
            <input type="checkbox" name="no8" value="1" disabled="disabled">전혀아니다
         <input type="checkbox" name="no8" value="2" disabled="disabled">아니다
         <input type="checkbox" name="no8" value="3" disabled="disabled">보통이다
         <input type="checkbox" name="no8" value="4" disabled="disabled">그렇다
          <input type="checkbox" name="no8" value="5" disabled="disabled">매우그렇다   <br><br>
      <span style="font-weight:bold">9. 본 강의를 다른 학생에게 추천하고 싶다.</span><br>
         <input type="checkbox" name="no9" value="1" disabled="disabled">전혀아니다
         <input type="checkbox" name="no9" value="2" disabled="disabled">아니다
         <input type="checkbox" name="no9" value="3" disabled="disabled">보통이다
         <input type="checkbox" name="no9" value="4" disabled="disabled">그렇다
          <input type="checkbox" name="no9" value="5" disabled="disabled">매우그렇다   <br><br>
      <span style="font-weight:bold">10. 본 강의는 전반적으로 유익하였다. </span><br>
         <input type="checkbox" name="no10" value="1" disabled="disabled">전혀아니다
         <input type="checkbox" name="no10" value="2" disabled="disabled">아니다
         <input type="checkbox" name="no10" value="3" disabled="disabled">보통이다
         <input type="checkbox" name="no10" value="4" disabled="disabled">그렇다
          <input type="checkbox" name="no10" value="5" disabled="disabled">매우그렇다<br><br>
      <c:forEach var="list" items="${list}">
      <span style="font-weight:bold">교수에게 하고 싶은 말 </span><br>   
      <textarea rows="10" cols="60" name="prof_say" Placeholder="교수에게 하고싶은 말을 입력하세요." style="resize:none;">${list.prof_say}</textarea><br>
   <br>
   <button type="button" class='btn btn-dark' onclick="location.href='EstimationinfoPro.do'">목록으로</button>

<button type="button" class='btn btn-dark' id="$list.es_state}" onclick="location.href='estok.do?stu_no=${list.stu_no}'">확인</button>
</c:forEach>
</form>   
</div>
</div>
</div>
<script type="text/javascript">
var no1= document.getElementsByName("no1");
var no2= document.getElementsByName("no2");
var no3= document.getElementsByName("no3");
var no4= document.getElementsByName("no4");
var no5= document.getElementsByName("no5");
var no6= document.getElementsByName("no6");
var no7= document.getElementsByName("no7");
var no8= document.getElementsByName("no8");
var no9= document.getElementsByName("no9");
var no10= document.getElementsByName("no10");
var length = no1.length;
//alert("length:"+length);
<c:forEach var="list" items="${list}">   
for(var i=1;i<=length;i++){ 

   if(${list.no1}==i){
      no1[i-1].checked=true;
   }
   if(${list.no2}==i){
      no2[i-1].checked=true;
}
   if(${list.no3}==i){
      no3[i-1].checked = true;
      }
   if(${list.no4}==i){
      no4[i-1].checked = true;
      }
   if(${list.no5}==i){
      no5[i-1].checked = true;
      }
   if(${list.no6}==i){
      no6[i-1].checked = true;
      }
   if(${list.no7}==i){
      no7[i-1].checked = true;
      }
   if(${list.no8}==i){
      no8[i-1].checked = true;
      }
   if(${list.no9}==i){
      no9[i-1].checked = true;
      }
   if(${list.no10}==i){
      no10[i-1].checked = true;
      }
   
   }
      
    </c:forEach> 


</script>
</body>
</html>