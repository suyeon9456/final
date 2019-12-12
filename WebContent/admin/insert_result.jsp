<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

#content {
	width: 1400px;
	height: 900px;
	background-color: white;
	margin: 0 auto;
	margin-top:10px;
	margin-left:444px;
}
#footer{
margin-top:122px;
}
#sli {
display: none;
}
</style>
</head>
<body>
<h3>상품 정보 입력결과</h3>
${msg }
<p/>
<form name="sale_frm" method="post">
	<input type="button" value="목록으로" name="btnList"/>
</form>
</body>
</html>