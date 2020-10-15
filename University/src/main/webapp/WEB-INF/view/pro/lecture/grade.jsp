<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ����</title>
</head>
<style>
.swal2-popup {
	width: auto;
}
.swal2-title {
	font-size: 14px;
}

.swal2-styled.swal2-confirm {
	font-size: 10px;
}
.col-md-6 {
    width: 600px;
    max-width: 100%;
}
</style>
<script>
$(function(){
	var url="subname.do";	
	$.ajax({
		type:"post"	
		,url:url		
		,dataType:"json" })
		.done(function(args){
				//������ ���� ���� �ڵ带 ��ȯ�ϸ� ȣ��Ǵ� �Լ�
			 for(var i=0; i < args.length; i++) {
				 $("#subname").append("<option value='"+args[i].sub_cd+"'>"+args[i].sub_nm+"</option>");
			 }
 			})
	    .fail(function(e) {
	    	alert(e.responseText);
	    })
});//ready ��
$(function(){
	var url="testScore.do";	
	$.ajax({
		type:"post"	
		,url:url		
		,dataType:"json" })
		.done(function(args){
				//������ ���� ���� �ڵ带 ��ȯ�ϸ� ȣ��Ǵ� �Լ�
			 $("#empInfo").append("<table class='table table-striped custab' id='emp'><tr><td>�����</td><td>�й�</td><td>�л��̸�</td><td>�߰�</td><td>�⸻</td><td>����</td><td>�⼮</td><td>����</td><td>���</td><td>���</td></tr></table>");
			 for(var i=0; i < args.length; i++) {
				 var str="<tr><td>"+args[i].sub_nm
			        + "</td>" + "<td>"+args[i].stu_no
					+ "</td>" + "<td>" +args[i].stu_name
					+ "</td>" + "<td>"+args[i].mid_score
					+ "</td>" + "<td>" +args[i].end_score
					+ "</td>" + "<td>" +args[i].report_score
					+ "</td>" + "<td>" +args[i].attend_score
					+ "</td>" + "<td>" +args[i].attend_sum
					+ "</td>" + "<td>" +args[i].attend_grade
					+ "</td>" + "<td>" +args[i].attend_rating
					+ "</td></tr>";
				 $("#emp").append(str);
			 }
 			})
	    .fail(function(e) {
	    	alert(e.responseText);
	    })
});//ready ��
function selectPerson(){	  	    			
			var subname=$("#subname option:selected").html();
			var stuname=$("#stuname option:selected").html();
			var stuno=$("#stuname option:selected").val();
			var subcd=$("#subname option:selected").val();			
			$("#subname1").val(subname);
			$("#stuname1").val(stuname);
			$("#stu_no").val(stuno);			
			$("#sub_cd").val(subcd);
}

 function selectBuil(){
	var stuname = $("#subname :selected").val();
	var url="stuname.do";
	var params="sub_cd="+stuname;	
	console.log(params);
	$.ajax({
		type:"post"
		,url:url	
		,data:params
		,dataType:"json"})
		.done(function(args){
			$("#stuname option").each(function() {	
				$("#stuname option:eq(0)").remove();
			});
			 $("#stuname").append("<option value=''>::�л� ����::</option>");			 
			 for(var idx=0; idx<args.length; idx++) {	
				 $("#stuname").append("<option value='"+args[idx].stu_no+"'>"+args[idx].stu_name+"</option>");	
			 } 
		})
	    .fail(function(e) {
	    	alert(e.responseText);
	    });	
}

 function grade(){ 
	var mid_score = document.getElementById("mid_score").value;
	var end_score = document.getElementById("end_score").value;
	var report_score = document.getElementById("report_score").value;
	var attend_score = document.getElementById("attend_score").value;
	var params="mid_score=" + mid_score+"end_score"+end_score+"report_score"+report_score+"attend_score"+attend_score;
	var sendData = JSON.stringify({mid_score:$('#mid_score').val(), end_score:$('#end_score').val(),report_score:$('#report_score').val(),attend_score:$('#attend_score').val()});
	var arr = [mid_score,end_score,report_score,attend_score]; 
	var sum =0;	
	
	for(var i=0; i<arr.length; i++){
			sum += parseInt(arr[i]);
		}
	if(90<=sum){
		$("#gra").val("A+");		
		$("#sum").val(sum);		
		}
	else if(sum>=80&&sum<=89){	
		$("#gra").val("A");
		$("#sum").val(sum);	  
		}
	else if(sum>=70&&sum<=79){	
		$("#gra").val("B+");
		$("#sum").val(sum);   
		}
	else if(sum>=60&&sum<=69){		 
		$("#gra").val("B"); 
		$("#sum").val(sum);   
		}
	else if(sum>=50&&sum<=59){		
		$("#gra").val("C+"); 
		$("#sum").val(sum);  
		}
	if(sum>=40&&sum<=49){		 
		$("#gra").val("C");  
		$("#sum").val(sum); 
		}
	else if(sum>=30&&sum<=39){
		$("#gra").val("D+"); 
		$("#sum").val(sum);	 
		}
	else if(sum>=20&&sum<=29){		
		$("#gra").val("D");  
		$("#sum").val(sum);  
		}
	else if(sum>=0&&sum<=19){		
		$("#gra").val("F");  
		$("#sum").val(sum);
		}
};

$(document).on("keyup", "input[name=mid_score]", function() {
    var val= $(this).val();

    if(val.replace(/[0-9]/g, "").length > 0) {
        alert("���ڸ� �Է��� �ֽʽÿ�.");
        $(this).val('');
    }
    if(val < 1 || val > 35) {
        alert("1~35 ������ �Է��� �ֽʽÿ�.");
        $(this).val('');
    }
});

$(document).on("keyup", "input[name=end_score]", function() {
    var val= $(this).val();

    if(val.replace(/[0-9]/g, "").length > 0) {
        alert("���ڸ� �Է��� �ֽʽÿ�.");
        $(this).val('');
    }
    if(val < 1 || val > 40) {
        alert("1~40 ������ �Է��� �ֽʽÿ�.");
        $(this).val('');
    }
});

$(document).on("keyup", "input[name=report_score]", function() {
    var val= $(this).val();

    if(val.replace(/[0-9]/g, "").length > 0) {
        alert("���ڸ� �Է��� �ֽʽÿ�.");
        $(this).val('');
    }
    if(val < 1 || val > 15) {
        alert("1~15 ������ �Է��� �ֽʽÿ�.");
        $(this).val('');
    }
});

$(document).on("keyup", "input[name=attend_score]", function() {
    var val= $(this).val();

    if(val.replace(/[0-9]/g, "").length > 0) {
        alert("���ڸ� �Է��� �ֽʽÿ�.");
        $(this).val('');
    }
    if(val < 1 || val > 10) {
        alert("1~10 ������ �Է��� �ֽʽÿ�.");
        $(this).val('');
    }
});
function checkIt(){
	var a = $("#subname1").val()
	var b = $("#stuname1").val()
	var c = $("#mid_score").val()
	var d = $("#report_score").val()
	var e = $("#end_score").val()
	var f = $("#attend_score").val()	
	
	if (!a){	                  
		alert("���Ǹ� �����ϼ���.");		
		return false;
	}
	if (!b){	                  
		alert("�л��� �����ϼ���.");		
		return false;
	}
	if (!c){	                  
		alert("�߰� ������ �Է��ϼ���.");
		document.myForm.mid_score.focus();
		return false;
	}
	if (!d){	                  
		alert("���� ������ �Է��ϼ���.");
		document.myForm.report_score.focus();
		return false;
	}
	if (!e){	                  
		alert("�⸻ ������ �Է��ϼ���.");
		document.myForm.end_score.focus();
		return false;
	}
	if (!f){	                  
		alert("�⼮ ������ �Է��ϼ���.");
		document.myForm.attend_score.focus();
		return false;
	}	
	if (confirm("������ �Է��Ͻðڽ��ϱ�?") == true){    //Ȯ��	 
		  return true;
		 }else{   //���
		     return false;
		}
}
</script>
<body>
	<select id="subname" onchange="selectBuil()">
		<option value="">::���� ����::</option>
	</select>
	<select id="stuname" onchange="selectPerson()" >
		<option value="">::�л� ����::</option>
	</select>
	<br>	
	&nbsp;&nbsp;���Ǹ� : <input type="text" style="margin-left: 1.81px;" id="subname1" name="subname1" readonly="readonly">&nbsp;
	&nbsp;&nbsp;&nbsp;�л��� : <input type="text" id="stuname1" name="stuname1" readonly="readonly"> <br>
<form action="test.do" onsubmit="return checkIt()" name="myForm">
	<input type="hidden" id="sub_cd" name="sub_cd"> 
	<input type="hidden" id="stu_no" name="stu_no">
	<br>
	�߰�(35) : <input type="text" id="mid_score" name="mid_score">&nbsp;	
	����(15) : <input type="text" id="report_score" name="report_score"> <br>
	�⸻(40) : <input type="text" id="end_score" name="end_score">&nbsp;
	�⼮(10) : <input type="text" id="attend_score" name="attend_score"> <br>
	&nbsp;&nbsp;&nbsp;&nbsp;�հ� :&nbsp;&nbsp; <input type="text" style="margin-left: 0.5px;" id="sum" readonly="readonly">&nbsp;&nbsp;&nbsp;&nbsp;��� : &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" style="margin-left: 1.4px;" id="gra" readonly="readonly"><br>
	<input class="btn btn-dark" type="submit" value="���� �Է�">
	<input class="btn btn-dark" type="button" id="save" value="���" onclick="grade()"> <br>
</form>
<br>
	<div id="empInfo" class="row col-md-6 col-md-offset-2 custyle"></div>
</body>
</html>