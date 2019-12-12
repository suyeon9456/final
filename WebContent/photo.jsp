<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="./css/photo.css" type="text/css" rel="stylesheet" />
<link href="./css/fonttello/fontello.css" type="text/css"
	rel="stylesheet" />
<link href="./css/animation.css" type="text/css" rel="stylesheet" />
<style>
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
		
			


		
		<div class="p_info">
			<div class="p_color">
				<span class="p_color_in" style="background: rgb(174, 205, 208)"></span>
				<span class="p_color_in" style="background: rgb(236, 236, 236)"></span>
				<span class="p_color_in" style="background: rgb(104, 102, 102)"></span>
			</div>
		</div>
		<div class="p_menu">


			<div class="icon">
				<div class="icon-star" onclick="hit"></div>
				<br />
				<div class="icon-heart" onclick="heart"></div>
				<br />
				<div class="icon-comment-alt" onclick="cart"></div>
			</div>
		
	</div>
	<script>
		function heart() {

			alert(i + "그 선택");
		}

		function cart() {

			alert(i + "KAKAO톡 연동입니다.");
		}

		function hit() {

			alert("당신골랐다" + i + "번째 span");
		}
	</script>

</body>

</html>