<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정 전 비밀번호</title>
<link href="./css/find.css" type="text/css" rel="stylesheet"/>
</head>
<body>
<div id="find_id" style="margin-top: 20px; width: 60%; margin: 0 auto;">
	<h2 style="margin-top: 20px;">개인정보변경</h2>
	<hr/>
	<br/>
	<h5 style="text-align: center;">고객님의 개인정보 보호를 위해 본인확인을 진행합니다.</h5>
	
	<div id="req_id">
		<form action="index.jsp?content=go_modify.mem" method="post">
			<input type="password" name="mPwd" placeholder="비밀번호" /><br/><br/>
			<input type="submit" value="비밀번호확인" >		
		</form>
	</div>
</div>
</body>
</html>