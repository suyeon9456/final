<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert</title>
<link href = "./css/member.css" type = "text/css" rel = "stylesheet" />

</head>
<body>
<div id = "insert">	
	<div id = "insert_form">
	
		<form name = "sfrm" method="post">
			<div>
				<label>이름<span>*</span></label>
				<input type = "text" name = "mName" class = "name" value="${data.mName }"/>
			</div>
			
			<div>
				<label>아이디<span>*</span></label>
				<input type = "text" name = "mId" class = "id" value="${data.mId }" readOnly/><br/>
				<span></span>
			</div>
			
			<div>
				<label>비밀번호<span>*</span></label>
				<input type = "password" name = "mPwd" class = "pwd"/>
			</div>
			
			<div>
				<label>비밀번호 확인<span>*</span></label>
				<input type = "password" name = "pwdCheck" class = "pwd_check"/>
			</div>

			<div>
				<label>생년월일</label>
				<input type = "date" name = "mDate" class = "s_date" value="${fn:substring(data.mDate, 0, 10)}"  />
			</div>			
			
			<div>
				<label>휴대전화<span>*</span></label>
				<input type = "text" name = "mPhone" class = "phone" value="${data.mPhone }" readOnly/>
			</div>
			
			<div>
				<label>이메일</label>
				<input type = "text" name = "mEmail" class = "email" value="${data.mEmail }" readOnly/>
			</div>
			
			<div>
				<label>성별</label>
				<label>남성<input type = 'radio' name = 'mGender' value = 'm'/></label>
				<label>여성<input type = 'radio' name = 'mGender' value = 'w'/></label>
				<input type="hidden" name="gender_c" value="${data.mGender }"/>
			</div>
			
			<div>
				<input type = "button" name = "btnModify" id = "btn_modify" value = "수정"/>
				<input type = "button" name = "btnDelete" id = "btn_delete" value = "삭제"/>
				<input type = "button" name = "btnCancel" id = "btn_cancel" value = "취소"/>
			</div>
			
		</form>
	</div>
</div>

<script>
var frm = document.sfrm;

var g = frm.gender_c.value;
if(g == "m"){
	frm.mGender[0].checked = 'checked';
}else if(g == "w"){
	frm.mGender[1].checked = 'checked';
}
frm.btnModify.onclick = function() {
	
	frm.action = "index.jsp?content=modify.mem";
	frm.submit();
}
frm.btnDelete.onclick = function() {
	frm.action = "index.jsp?content=delete.mem";
	frm.submit();
}
frm.btnCancel.onclick = function() {
	location.href = "index.jsp?content=mypage.mem";
}


</script>
</body>
</html>