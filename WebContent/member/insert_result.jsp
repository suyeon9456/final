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
   
   <div class = "result_ic_text">
      <img src = "./mem_images/result_img.png"></img><br/>
      <img src = "./css/logo1.png" style = "width: 120px;"/>
      <h2>회원가입이 완료 되었습니다.</h2>
   </div>
   
   <div class = "result_content">
      <div class = "hh3">저희 쇼핑몰을 이용해주셔서 감사합니다.</div>
      
      <div>
         <table>
            <tbody>
               <tr>
                  <td>아이디</td>
                  <td>${result.mId }</td>
               </tr>
               
               <tr>
                  <td>이름</td>
                  <td>${result.mName }</td>
               </tr>
               
               <tr>
                  <td>이메일</td>
                  <td>${result.mEmail }</td>
               </tr>
               
            </tbody>
         </table>
      </div>
   </div>
   <div id = "btn_main_btn">
      <form name = "sfrm" method="post">
         <input type = "hidden" name = "mId" value = "${result.mId }" />
         <input type = "hidden" name = "mName" value = "${result.mName }" />
         <input type = "button" name = "btnMain" id = "btn_main" value = "완료" />   
      </form>
   </div>
</div>
<script>
var frm = sfrm;
$('#btn_main').click(function(){
   var url = "result_login.mem";
   frm.action = url;
   frm.submit();
});
</script>
</body>
</html>