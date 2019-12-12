<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert</title>
<script src = "./lib/jquery-3.4.1.js"></script>
<link href = "./css/member.css" type = "text/css" rel = "stylesheet" />


</head>
<body>
<div id = "insert">

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
	
	<div id = "insert_form">
	
		<form name = "sfrm" method="post">
			<div>
				<label>아이디<span>*</span></label>
				<input type = "text" name = "mId" id = "mId" class = "id" value = "${param.mId }"/><br/>
			</div>
			<span id = "id_result" class = "result_txt"></span>
			
			<div>
				<label>이름<span>*</span></label>
				<input type = "text" name = "mName" id = "mName" class = "name" value = "${param.mName }"/>
			</div>
			
			<div>
				<label>비밀번호<span>*</span></label>
				<input type = "password" name = "mPwd" id = "mPwd" class = "pwd" value = "${param.mPwd }"/>
			</div>
			
			<div>
				<label>비밀번호 확인<span>*</span></label>
				<input type = "password" name = "pwdCheck" id = "pwd_check" class = "pwd_check" value = "${param.pwdCheck }"/>
			</div>
			<span id = "pwd_result" class = "result_txt"></span>

			<div>
				<label>생년월일</label>
				<input type = "date" name = "mDate" id = "m_date" class = "s_date" value = "${param.mDate }"/>
			</div>			
			
			<div>
				<label>휴대전화<span>*</span></label>
				<input type = "text" name = "mPhone" id = "mPhone" class = "phone" value = "${param.mPhone }"/>
			</div>
			<span id = "phone_result" class = "result_txt"></span>
			
			<div>
				<label>이메일</label>
				<input type = "text" name = "mEmail" id = "mEmail" class = "email" placeholder="이메일 주소를 입력하세요." value="${param.mEmail }"/>
				<input type = "button" name = "emailSend" id = "email_send" value = "이메일 인증"/>
			</div>
			<span id = "email_result" class = "result_txt"></span>
			
			<div>
				<input type = "hidden" name = "emailCheck" id = "email_check" class = "email"value = "${param.emailCheckPw }"/>
			</div>
			
			<div>
				<label>성별</label>
				<label>남성<input type = 'radio' name = 'mGender' id = "gender_m" value = 'm' <c:if test="${param.mGender eq 'm'}">checked</c:if> /></label>
				<label>여성<input type = 'radio' name = 'mGender' id = "gender_w" value = 'w' <c:if test="${param.mGender eq 'w'}">checked</c:if> /></label>
			</div>
			<span id = "gender_result" class = "result_txt"></span>
			
			<div class = "insert_btns">
				<input type = "button" name = "btnInsert" value = "저장"/>
				<input type = "button" name = "btnCancel" value = "취소"/>
			</div>
			
		</form>
	</div>
</div>

<script>
var frm = document.sfrm;

frm.btnInsert.onclick = function(){
	var regPhone = /(01[0|1|6|9|7])[-](\d{3}|\d{4})[-](\d{4}$)/g;
	
	//이름 공백 확인
    if(!$("#mName").val()){
     	$("#mName").focus();
      	return false;
    }
	
 	//아이디 공백 확인
    if(!$("#mId").val()){
     	$("#mId").focus();
      	return false;
    }
    
  	//아이디 중복 확인
    if($("#id_result").text() != "사용가능한 아이디 입니다."){
     	$("#id").focus();
     	$("#id_result").html("아이디 중복확인을 해주세요.");
      	return false;
    }
  	
 	//비밀번호 공백 확인
    if(!$("#mPwd").val()){
     	$("#mPwd").focus();
      	return false;
    }
 	
  	//비밀번호 확인 공백 확인
    if(!$("#pwd_check").val()){
     	$("#pwd_check").focus();
      	return false;
    }
  	
  	//비밀번호 일치 확인
    if($("#pwd_result").text() != "비밀번호가 일치합니다."){
     	$("#pwd_check").focus();
     	$("#pwd_result").html("비밀번호를 확인해주세요.");
      	return false;
    }
  	
  //생년월일 공백 확인
    if(!$("#m_date").val()){
     	$("#m_date").focus();
      	return false;
    }
  
  //휴대폰 공백 확인
    if(!$("#mPhone").val()){
     	$("#mPhone").focus();
      	return false;
    }
  
  //휴대폰 유효성검사
    if(!regPhone.test($("#mPhone").val())){
		  $('#phone_result').html('잘못된 휴대폰 번호입니다.');
		  $("#mPhone").val("");
    	  $('#mPhone').focus();
    	  return false;    
    	 }
  
  //이메일 공백 확인
    if(!$("#mEmail").val()){
     	$("#mEmail").focus();
      	return false;
    }
  
  //이메일 중복 확인
    if($('#email_result').text() != "인증번호를 전송했습니다." && $('#email_result').text() != "인증되었습니다"){
     	$("#mEmail").focus();
     	$('#email_result').html("이메일 중복 확인을 해주세요.");
      	return false;
    }else{
    	//인증번호 공백 확인
    	if(!$('#email_check').val()){
    		$('#email_check').focus();
    		return false;
    	}
	  //이메일 인증 확인
	  	if($('#email_result').text() != "인증되었습니다"){
	  		return false;
	  	}
	  
	  	var url = "index.jsp?content=insert_result.mem";
		frm.action = url;
		frm.submit();
    }
	
}

$('#mId').change(function(){
	var id = $('#mId').val();
	var id_result = $("#id_result");
	$.ajax({
		async: false,
		url : "id_check.mem",
		type: "post",
		dataType : "html",
		data : id,
		success : function(data, status){
			id_result.html(data);
		}
	});
});

$('#mId').trigger('change');

$('#pwd_check').change(function(){
	var pwd = $('#mPwd').val();
	var pwd_check = $('#pwd_check').val();
	var pwd_result = $('#pwd_result');
	
	if(!pwd){
		pwd_result.html("비밀번호를 입력해주세요.");
	}else{
		if(pwd == pwd_check){
			pwd_result.html("비밀번호가 일치합니다.");
		}else{
			pwd_result.html("비밀번호를 확인해주세요.");
		}
		
	}
	
});

$('#pwd_check').trigger('change');

$('#email_send').click(function(){
	var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
	var name = $('#mName').val();
	var id = $('#mId').val();
	var pwd = $('#mPwd').val();
	var pwdCheck = $('#pwd_check').val();
	var sdate = $('#m_date').val();
	var email = $('#mEmail').val();
	var gender = $("input:radio[name='mGender']:checked").val();
	var email_result = $('#email_result');
	var ran = $('#ran_num');
	var phone = $('#mPhone').val();
	
	//이메일 유효성 검사
    if(!getMail.test(email)){
    	email_result.html("잘못된 이메일 형식입니다.");
      $("#mEmail").val("");
      $("#mEmail").focus();
      return false;
    }
	
	if(!email){
		email_result.html("이메일을 입력해주세요.");
	}else{
		
		$.ajax({
			url : "email_send.mem",
			type: "post",
			dataType : "html",
			data : {mName: name, mId: id, mPwd:pwd, pwdCheck:pwdCheck, mDate:sdate, mPhone:phone, mGender:gender, mEmail:email},
			success : function(data, status){
				email_result.html(data);
			}
		});

	}
	
});

var number = $('#email_check').val();
var email_result = $('#email_result');
if(!$('#email_check').val()){
	email_result.html("");
}else{
	if(!number == null || !number == ""){
		email_result.html("인증되었습니다");
	}
}


frm.btnCancel.onclick = function(){
	if(confirm("회원가입을 취소하시겠습니까?")){
		location.href = "index.jsp";
	}else{
		$("input[type=text]").val("");
		$('span').text('');
	}
}
</script>
</body>
</html>