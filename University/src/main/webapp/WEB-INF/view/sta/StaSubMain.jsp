<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
   <title>강의 개설/강의실 관리</title>  
   <style>
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
    function selectMenu(){        
    		var menu=$("#menu1").val();
    		
    		if(menu=="") {
    				$("#con").empty();
    				$("#category1").hide();  
    				$("#category2").hide();  
    				
    				$("#bd option").each(function() {	
        				$("#bd option:eq(0)").remove();
        			});
        			$("#bd").append("<option value=''>::건물선택::</option>");
    		}
    		
    		var url="sublist.do";
    		var url2="manageRoom.do";
    		if(menu=="1"){
    			$("#category1").hide();
    			$("#category2").hide();
    			
    			$("#bd option").each(function() {	
    				$("#bd option:eq(0)").remove();
    			});
    			$("#bd").append("<option value=''>::건물선택::</option>");
    			 $("#con").empty();
	    		$.ajax({
					type:"post"		
					,url:url		
					,dataType:"json"})
					.done(function(args){	
								 $("#con").append(									
									"<table class='table table-striped custab' style='margin-left:200px;width:1000px;' id='table'><tr><td>번호</td><td>이수구분</td><td>강의명</td><td>교수명</td><td>강의코드</td><td>학점</td><td>시간</td><td>상태</td></tr>");
						 for(var i=0; i < args.length; i++) {							
											var c = i+1
											var str = "<tr><td>" + c
											+ "</td>" + "<td>" + args[i].isu
											+ "</td>" + "<td>" + "<a href='javascript:void(0);' onclick='selectSub(this);' id='"+args[i].sub_nm+"'>" + args[i].sub_nm +"</a>"
											+ "</td>" + "<td>" + args[i].prof_nm
											+ "</td>" + "<td>" + args[i].sub_cd
											+ "</td>" + "<td>" + args[i].credit
											+ "</td>" + "<td>" + args[i].lec
											+ "</td>" + "<td>" + args[i].sub_state											
											+ "</td></tr>";
											$("#con table").append(str);	
											$("#con table").append("</table>");	
						 }
			 			})
				    .fail(function(e) {
				    	alert("경고");
				    })
        		}
    		if(menu=="2"){
    			$("#con").empty();
    			$("#category1").show();    			
    			$.ajax({
    				type:"post"		
    				,url:url2		
    				,dataType:"json" })
    				.done(function(args){	//응답이 성공 상태 코드를 반환하면 호출되는 함수
    					 for(var i=0; i < args.length; i++) {
    						 $("#bd").append("<option value='"+args[i].buil_no+"'>"+args[i].buil_no+"</option>");
    					 }
    		 			})
    			    .fail(function(e) {
    			    	alert("누르지마라");
    			    })
        		}    	    		
    	}
  	      
      function selectSub(e){               
    		$("#con").empty();	
    		    		
    		var url="StaSubSub.do"; 
	    		$.ajax({
					type:"post"		
					,url:url		
					,data:"sub_nm="+e.id
					,dataType:"html"})
					.done(function(args){					
							 $("#con").html(args); 
			 			})
				    .fail(function(e) {
				    	alert("경고");
				    })
    	} 

      function selectBd(){
    	  $("#con").empty();
    		var bd=$("#bd").val();

    		var url3="room.do";
    		var params="buil_no="+bd;

    		if(bd=="") {  	
    			$("#category2").hide();
    		}else{
    			$("#category2").show();
    			$("#rm option").each(function() {	
    				$("#rm option:eq(0)").remove();
    			});
    			$("#rm").append("<option value=''>::강의실선택::</option>");
				$.ajax({
	    			type:"post"
	    			,url:url3	
	    			,data:params
	    			,dataType:"json"})
	    			.done(function(args){
	    				 for(var idx=0; idx<args.length; idx++) {	
	    					 $("#rm").append("<option value='"+args[idx].subroom_nm+"'>"+args[idx].subroom_nm+"</option>");	
	    				 } 
	    			})
	    		    .fail(function(e) {	
	    		    	alert("누르지 마라");
	    		    });	
        		}    		
    	}

      function selecRm(){

    	  $("#con").empty();
    	  
    		var rm=$("#rm").val();

    		var url4="room2.do";
    		var params="subroom_nm="+rm;

    		$.ajax({
    			type:"post"
    			,url:url4	
    			,data:params
    			,dataType:"html"})
    			.done(function(args){
    				 $("#con").html(args);
    			})
    		    .fail(function(e) {
    		    	alert("누르지마라");
    		    });	
    	}
$(function(){
	$("#category1,#category2").hide(); 	
});    
</script>
  </head>
  <body>   
	<select id="menu1" onchange="selectMenu()">	
	  <option value="">::목록선택::</option>
	 	<option value ="1">강의 개설 신청 목록</option>
	    <option value ="2">강의실 관리</option>      
	</select>     
	<span id="category1">
		<select id="bd" onchange="selectBd()">	
			<option value="">::건물선택::</option>
		</select>
	</span>
  	<span id="category2">
	  	<select id="rm" onchange="selecRm()">
		  <option value="">::강의실선택::</option>
		</select>	  	
  	</span>
  	<br>
    <!-- 최종 선택 결과를 표시할 곳 -->
    <div id="con" align="center" style="margin-top:50px; height: 700px;"></div>
  </body>
</html>

