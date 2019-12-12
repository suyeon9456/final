<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shoes</title>
<link href="./css/category.css" type="text/css" rel="stylesheet"/>

</head>
<body>
<div id='all'>
	<h3>Shoes</h3>
	<fieldset name='Outter' style= "border:5px solid #ffffff">
		<legend style= "color: #ff7b51"></legend>
<div class='list' id='OT'>
		<span>구두</span>
		<span>스니커즈</span> 
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
	<script>
	function goSub(page){
		var path = "index.jsp?sub=${param.sub}&content=";
		var url = path + page;
		location.href = url;
	}
	</script>
</body>
</html>