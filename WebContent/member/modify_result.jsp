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
		<h2>회원님의 정보를 수정했습니다.</h2>
	</div>
	
	<div class = "result_content">
		<h3>저희 쇼핑몰을 이용해주셔서 감사합니다.</h3>
		
		<div>
			<table>
				<tbody>
					<tr>
						<td>아이디</td>
						<td>${data.mId }</td>
					</tr>
					
					<tr>
						<td>이름</td>
						<td>${data.mName }</td>
					</tr>
					
					<tr>
						<td>이메일</td>
						<td>${data.mEmail }</td>
					</tr>
					
				</tbody>
			</table>
		</div>
	</div>
	<div id = "btn_main_btn">
		<form name="modifyinfo">
			<input type = "button" name = "btnMypage" value = "마이페이지로" />
			<input type = "button" name = "btnHome" value = "홈페이지로" />
		</form>
	</div>
</div>
<script>
var frm = document.modifyinfo;

frm.btnMypage.onclick = function() {
	location.href = "index.jsp?content=mypage.mem";
}
frm.btnHome.onclick = function() {
	location.href = "index.jsp";
}
</script>
</body>
</html>