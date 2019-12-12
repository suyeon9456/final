<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>findID</title>
<link href="./css/find.css" type="text/css" rel="stylesheet"/>
</head>
<body>
<div id="find_id">
	<h2>아이디 찾기</h2>
	<div id="req_id">
		<form action="index.jsp?content=findid.mem" method="post">
			<input type="text" name="mName" placeholder="이름"/><br/>
			<input type="text" name="mEmail" placeholder="이메일" title="가입시 이메일을 입력해주세요"/><br/><br/>
			<input type="submit" value="확인" >		
		</form>
	</div>
</div>
</body>
</html>