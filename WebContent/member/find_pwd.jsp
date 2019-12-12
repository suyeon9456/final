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
<div id="find_pwd">
	<h2>비밀번호 찾기</h2>
	<div id="req_pwd">
		<form action="index.jsp?content=findpwd.mem" method="post">
			<input type="text" name="mName" placeholder="이름" value="${data.mName }"/><br/>
			<input type="text" name="mId" placeholder="아이디" value="${data.mId }"/><br/>
			<input type="text" name="mEmail" placeholder="이메일" value="${data.mEmail }" title="가입시 이메일을 입력해주세요"/><br/><br/>
			<input type="submit" value="임시비밀번호 받기" >
		</form>
	</div>
</div>
</body>
</html>