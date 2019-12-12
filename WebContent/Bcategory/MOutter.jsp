<%@page import="bean.Param"%>
<%@page import="bean.ProductVo"%>
<%@page import="java.util.List"%>
<%@page import="bean.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
<script> window.jQuery || document.write('<script src="booklet/jquery-2.1.0.min.js"><\/script>') </script>
<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
<script src="./lib/jquery.easing.1.3.js"></script>
<script src="./lib/jquery.booklet.latest.min.js"></script>
<link href="./css/category.css" type="text/css" rel="stylesheet"/>
<style>

</style>
</head>
<body>
<form name='frm' method='post'enctype='mutipart/form-data'>
<div id='all'>
	<h3>Outter</h3>
	<fieldset name='Outter' style= "border:5px solid #ffffff">
		<legend style= "color: #ff7b51"></legend>
<div class='list' id='OT'>
	<a href="index.jsp?content=MLeader.cate"><span id="leader" class="leader">레더자켓</span></a>
		<span class="leader">레더자켓</span>
		<span class="coat">코트</span> 
		<span class="padding">패딩</span> 
	</div>
	</fieldset>
	</div>
		<div id='List'>
	<div id="bestproduct">
					<div class="b_2"><jsp:include page="../photo.jsp"/></div>
					<div class="b_2" ><jsp:include page="../photo.jsp"/></div>
					<div class="b_2" ><jsp:include page="../photo.jsp"/></div>
					<div class="b_2" ><jsp:include page="../photo.jsp"/></div>
					<div class="b_2" ><jsp:include page="../photo.jsp"/></div>
					<div class="b_2" ><jsp:include page="../photo.jsp"/></div>
					<div class="b_2" ><jsp:include page="../photo.jsp"/></div>
					<div class="b_2" ><jsp:include page="../photo.jsp"/></div>
					<div class="b_2" ><jsp:include page="../photo.jsp"/></div>
					<div class="b_2" ><jsp:include page="../photo.jsp"/></div>
					<div class="b_2" ><jsp:include page="../photo.jsp"/></div>			
	
	</div>

</div>

</form>
<script>

</script> 
</body>
</html>







