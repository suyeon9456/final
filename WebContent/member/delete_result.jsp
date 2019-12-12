<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert_result</title>
<link href = "./css/member.css" type = "text/css" rel = "stylesheet" />

</head>
<body>
<div id = "insert_result">	
	<div class = "result_ic_text">
		<img src = "./mem_images/result_img.png"></img>
		<h2>회원님의 정보를 삭제했습니다.</h2>
	</div>
	
	<div class = "result_content">
		<h3>지금까지 쇼핑몰을 이용해주셔서 감사합니다.</h3>
		
		<div>
			회원님은 지금까지 0000원, 000개를 구매하셨습니다.
		</div>
	</div>
	<div id = "btn_main_btn">
		<form name="modifyinfo">
			<input type = "button" name = "btnHome" value = "홈페이지로" />
		</form>
	</div>
</div>
<script>
var frm = document.modifyinfo;

frm.btnHome.onclick = function() {
	location.href = "index.jsp";
}
</script>
</body>
</html>