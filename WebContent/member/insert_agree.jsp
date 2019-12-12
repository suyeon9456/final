<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert_agree</title>
<script src = "./lib/jquery-3.4.1.js"></script>
<link href = "./css/member.css" type = "text/css" rel = "stylesheet" />
</head>
<body>
<div id = "insert_agree">
	<div class = "icon_box">
		<h2>회원가입</h2>
		<ol>
			<li class = "agree_icon">
			약관동의
			</li>
			
			<li class = "insert_icon">
			회원정보 입력
			</li>
			
			<li class = "result_icon">
			회원가입 완료
			</li>
		</ol>
	</div>
	
	<div id = "agree_contents">
		<iframe src = "./member/agree/use_agree.jsp" scrolling = "yes" frameborder = "0"></iframe>
		
		<div class ="a_check">
			<label>동의함<input type = 'radio' name = 'aAgree' id = "a_agree1" value = 'y'/></label>
			<label>동의안함<input type = 'radio' name = 'aAgree' id = "a_agree2" value = 'n'/></label>
		</div>
	
		<iframe src = "./member/agree/privacy_agree.jsp" scrolling = "yes" frameborder = "1"></iframe>	
		
		<div class ="a_check">
			<label>동의함<input type = 'radio' name = 'bAgree' id = "b_agree1" value = 'y'/></label>
			<label>동의안함<input type = 'radio' name = 'bAgree' id = "b_agree2" value = 'n'/></label>
		</div>
		
	</div>
	
	<div id = "agree_btn">
		<span class = "btn_box">
			<a id = "btn_insert" href = "#">확인</a>
		</span>	
	</div>
	
</div>

<script>
$('#btn_insert').click(function(){
	if($('#a_agree1').is(':checked') && $('#b_agree1').is(':checked')){
		$("#btn_insert").attr("href", "index.jsp?content=insert.mem");
	}else{
		alert("약관에 동의해주세요.");	
	}
});
</script>
</body>
</html>