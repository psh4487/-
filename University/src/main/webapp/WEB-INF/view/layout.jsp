<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>test</title>
<style type="text/css">
#header {
   width: 100%;
   height: 61px;
   border-bottom: 1px solid;
   background: #3c3c3c;
}

#menu {
   float: left; 
}

#content {
   border-top : 10px;
   padding : 10px;
   float: left;   
}

#footer {
   width: 100%;  
   text-align: center;   
   clear: both;
   border-top: 1px solid;
}

#menu, #content {   
   min-height: 700px;
}
.font_ {
	font-size: 14px;
}
</style>
</head>
<body>
<div style="width:100%; height:100%;">
    <div id="header"><tiles:insertAttribute name="header" /></div>
    <div id="menu"><tiles:insertAttribute name="menu" /></div>
    <div id="content" class="font_"><tiles:insertAttribute name="content" /></div>    
    <div id="footer"><tiles:insertAttribute name="footer" /></div>
</div>
</body>
</html>