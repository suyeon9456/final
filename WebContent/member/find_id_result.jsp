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
		<h2>회원님의 정보를 찾았습니다.</h2>
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
		<form name="findedinfo" method="post">
			<input type="hidden" name="mId" value="${data.mId }"/>
			<input type="hidden" name="mName" value="${data.mName }"/>
			<input type="hidden" name="mEmail" value="${data.mEmail }"/>
			<input type = "button" name = "btnLogin" value = "로그인화면" />
			<input type = "button" name = "btnFindPWD" value = "비밀번호찾기" />
		</form>
	</div>
</div>
<script>
var frm = document.findedinfo;
frm.btnLogin.onclick = function() {
	frm.action = "index.jsp?content=go_login.mem";
	frm.submit();
}
frm.btnFindPWD.onclick = function() {
	frm.action = "index.jsp?content=go_findpwd.mem";
	frm.submit();
}

</script>
</body>
</html>