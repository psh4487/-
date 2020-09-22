<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>상담 신청</title>
</head>
<!-- <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script> -->
<%-- <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> --%>
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
<script>
   $(function() {
      var url = "subroomList.do";
      $.ajax({
         type : "post",
         url : url,
         dataType : "json"
      }).done(
            function(args) {
               for (var i = 0; i < args.length; i++) {
                  $("#sub_nm").append(
                        "<option value='"+args[i].sub_cd+"'>"
                              + args[i].sub_nm + "</option>");
               }
            }).fail(function(e) {
         alert(e.responseText);
      })
   });
</script>
<script>
   function datasub() {
      var form = document.subdata;
      var sub_nm = $('#sub_nm').val();
      var cs_date = $('#date_sel').val();
      var cs_nm = $('#cs_nm').val();
      var cs_con = $('#cs_con').val();
      if (sub_nm == "null") {
         alert("강의를 선택하세요.");
      } else if (cs_date == "") {
         alert("상담 신청일 선택하세요.");
      } else if (cs_nm == "") {
         alert("제목을 입력하세요.");
      } else if (cs_con == "") {
         alert("내용을 입력하세요.");
      } else {
         form.submit();
      }
   }
   $(function() {
      $('#date_sel').datepicker(
            {
               showAnim : "slide",
               dateFormat : "yy-mm-dd",
               minDate : 0,
               maxDate : '14d',
               dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
               monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
                     '7월', '8월', '9월', '10월', '11월', '12월' ],
               monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
                     '8월', '9월', '10월', '11월', '12월' ]
            });
   });
</script>
<body>
  <div class="container">
		<h1>상담 신청</h1>
		<div class="container" style="width: 437px;">
		<hr>
			<form name="subdata" action="counselingApply.do">
				<div>
					<div style="float: left; width: 50%;">
						<select id="sub_nm" name="sub_cd" class="container">
							<option value="null">::강의 선택::</option>
						</select>
					</div>
					<div style="float: right; width: 50%; text-align: right; height:25px">
						<input type="text" id="date_sel" name="cs_date" Placeholder="날짜를 선택하세요."
							readonly style="height:25px"><br>
					</div>
				</div>
				<br><br>
				<div style="float: left; width: 100%;">
					제목 : <input type="text" id="cs_nm" name="cs_nm"
						Placeholder="제목을 입력하세요."><br>
				</div>
				<br><br>
				<textarea rows="10" cols="64" id="cs_con" name="cs_con"
					Placeholder="상담 내용을 입력하세요." style="resize: none;"></textarea>
				<br><br>
        		<button type="button" class="btn btn-dark" onclick="datasub()" value="신청">신청</button>
			</form><br>
		</div>
		<div class="container" style="width: 700px;">
			<hr style="width: 700px;">
			<h2>상담 신청 내역</h2>
			<div class="row col-md-6 col-md-offset-2 custyle">
				<table style="text-align: center;" class="table table-striped custab">
					<thead>
		            <tr>
		                <th>강의명</th>
		                <th>예약된 상담 일정</th>
		                <th>교수명</th>
		                <th>처리상태</th>
		            </tr>
		            </thead>
		            <c:forEach var="list" items="${historyList}">
		                <tr>
		                    <td>${list.sub_nm}</td>
		                    <td>${list.cs_date}</td>
		                    <td>${list.prof_nm}</td>
		                    <td>${list.cs_state}</td>
		                </tr>
		            </c:forEach>
				</table>
			</div>
		</div>
	</div>
</body>
</html>