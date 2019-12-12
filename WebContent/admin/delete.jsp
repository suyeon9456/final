<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>delete</title>
<style>
.del {
width:1000px;
height:250px;
}
fieldset{
width:1000px;
height:250px;

}
#delete{
text-align:center;
margin-top:80px;
}

</style>
</head>
<body>
<form name='del' method='post'>
	<fieldset><legend>[삭제확인]</legend>
	<div id='delete'>
		<h5>게시물을 삭제하시겠습니까?</h5><br/>
		<input type="button" value='삭제'/>
		<input type="button" value='취소'/>
	</div>
	</fieldset>
</form>
<script>

</script>
</body>
</html>