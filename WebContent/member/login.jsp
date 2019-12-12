<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css">
<script src="https://apis.google.com/js/api:client.js"></script>
<script>
  window.fbAsyncInit = function() {
    FB.init({
      appId      : '1005995036413873',
      cookie     : true,
      xfbml      : true,
      version    : 'v4.0'
    });
      
    FB.getLoginStatus(function(response) {  
        statusChangeCallback(response);       
      });
      
  };

  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "https://connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));
  

  FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
  });

  function checkLoginState() {
    FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
    });
  }
  
  function statusChangeCallback(response) {  // Called with the results from FB.getLoginStatus().
       console.log('statusChangeCallback');
       console.log(response);                   // The current login status of the person.
       if (response.status === 'connected') {   // Logged into your webpage and Facebook.
         testAPI();  
       }
   }
  function testAPI() {                      // Testing Graph API after login.  See statusChangeCallback() for when this call is made.
       console.log('Welcome!  Fetching your information.... ');
       FB.api('/me', {fields: 'name,email'}, function(response) {
         console.log('Successful login for: ' + response.name);
         console.log('Successful login for: ' + response.id);
         console.log('Successful login for: ' + response.email);
         location.href = "facebook.mem?mId="+response.id+"&mName="+response.name +"&mEmail="+response.email;
       });
     }
</script>
<title>Login</title>
<link href="./css/login.css" type="text/css" rel="stylesheet"/>
</head>
<body>
<%
   request.setCharacterEncoding("utf-8");
   Cookie[] cookies = request.getCookies();
   String id_saver="";
   if(cookies != null){
      for(Cookie c : cookies){
         String name = c.getName();
         if(name.equals("idsaver")){
            id_saver = c.getValue();
         }
      }
   }
%>
<div id="login">
   <h2>로그인</h2>
      
      <div id="any_login">
         <div id="member_login">
            <h3>회원로그인</h3>
            <form action="logIn.mem" method="post" name="login_form">
               <input type="text" id="id" name="mId" placeholder="아이디" value="<%=id_saver %>"/><br/>
               <input type="password" id="pwd" name="mPwd" placeholder="비밀번호"/><br/>
               <input type="hidden" name="b_page" value="${b_page }">
               <div id="checks">
                  <label><input type="checkbox" name="keep_info" value="Y" >자동로그인</label>
                  <label><input type="checkbox" name="save_id" value="Y" checked="checked">아이디저장</label><br/>
               </div>
               <input type="submit" value="로그인" id="btnLogin">         
            </form>
            <br/>
            
            <div id="findbtn">
               <input type="button" value="아이디 찾기" id="find_id"/>
               <input type="button" value="비밀번호찾기" id="find_pwd"/>
            </div>
         </div>
         
         <div id="social">
               <h3>SNS 간편로그인</h3>
                     <div id="btnsns">
                     <a href="https://kauth.kakao.com/oauth/authorize?client_id=aa34502acf42a2e44a92c9c5a02b0ce7&redirect_uri=http://192.168.0.3:9991/1903_final/kakao.mem&response_type=code" target="_self">
                        <span id = "kaCustomBtn">
                           <span class = "k_icon"></span>
                           <span id = "k_a" class = "customGPlusSignIn">Log in With Kakao</span>
                         </span>
                    </a>
                    
                      <div id = "customBtn">
                         <span class = "icon"></span>
                         <span id = "a" class = "customGPlusSignIn" onclick="if(this.innerHTML === 'Log out With Google') {signOut();} return false;">
                         Log in With Google</span>
                      </div>   
                               
                      <div class="fb-login-button" data-width="320px" data-size="large" data-button-type="login_with" data-auto-logout-link="false" data-use-continue-as="false" 
                         style = "width: 320px; height:40px; border:1px solid #0d69e6; border-radius: 3px; background-color: #1877f2; box-sizing: border-box; margin-bottom: 20px;"></div>
                 </div>
            
            </div>
         <div id="no_member_login">
            <h3>비회원 주문조회</h3>
            <form action="" method="post">
               <input type="text" id="name" name="name" placeholder="이름"/><br/>
               <input type="text" id="code" name="code" placeholder="주문번호"/><br/>
               <input type="password" id="pwd" name="pwd" placeholder="비밀번호"/><br/><br/>
               <input type="submit" value="주문조회" id="btnOrderS"/>
            </form>
         </div>
      </div>
      <br/>
      
      <hr>
      
      <div id="sign_up">
         <h3 style = "background-color: ">아직도 회원이 아니세요?</h3>
         <div id="sign_up_content">
            <div>
               <p>회원가입을 하시면 회원에게만 제공되는 <br/>
                   다양한 혜택과 이벤트에 참여하실 수 있습니다.<br/>
                   SIMSINSA회원만의 특별한 혜택을 만나보세요</p>
            </div>
            <div>
               <input type="button" id="btnSignup" value="회원가입">
               
            </div>
         </div> 
      </div>
      
      <div id="merit">
         <h3>SIMSINSA 전회원에게 드리는 혜택</h3>
         <div id="merits">
            <div class="merit_con">
               <a href="#"><img src="./mem_images/i_milage.png"><br/>구매 적립금</a>
            </div>
            <div class="merit_con">
               <a href="#"><img src="./mem_images/i_favorite.png"><br/>즐겨찾기</a>
            </div>
            <div class="merit_con">
               <a href="#"><img src="./mem_images/i_check.png"><br/>추가정보입력</a>
            </div>
            <div class="merit_con">
               <a href="#"><img src="./mem_images/i_day.png"><br/>0000 데이</a>
            </div>
            <div class="merit_con">
               <a href="#"><img src="./mem_images/i_free.png"><br/>무료배송쿠폰</a>
            </div>
            <div class="merit_con">
               <a href="#"><img src="./mem_images/i_happybirth.png"><br/>생일축하쿠폰</a>
            </div>
            <div class="merit_con">
               <a href="#"><img src="./mem_images/i_review.png"><br/>추가 적립금</a>
            </div>
            <div class="merit_con">
               <a href="#"><img src="./mem_images/i_king.png"><br/>리뷰왕</a>
            </div>
            <div class="merit_con">
               <a href="#"><img src="./mem_images/i_cc.png"><br/>출석체크</a>
            </div>
            <div class="merit_con">
               <a href="#"><img src="./mem_images/i_coupone.png"><br/>우수회원쿠폰</a>
            </div>
            <div class="merit_con">
               <a href="#"><img src="./mem_images/i_change.png"><br/>사이즈1회교환</a>
            </div>
            <div class="merit_con">
               <a href="#"><img src="./mem_images/i_45.png"><br/>매일 한상품 45%</a>
            </div>
         </div>      
      </div>
</div>
<script>
   var googleUser = {};
   var startApp = function(){
      gapi.load("auth2", function(){
         auth2 = gapi.auth2.init({
            client_id:"59260924376-qm7brgi63b50i2b7mnmht2vk28np57iv.apps.googleusercontent.com",
            cookiepolicy:"single_host_origin",
         });
         attachSignin(document.getElementById("customBtn"));
      });
   };
   
   function attachSignin(element){
      auth2.attachClickHandler(element, {}, 
         function(googleUser){
         var profile = googleUser.getBasicProfile();
         location.href = "google.mem?mId="+profile.getId()+"&mName="+profile.getName() +"&mEmail="+profile.getEmail();
      });
   }
   
   function signOut(){
      var auth2 = gapi.auth2.getAuthInstance();
      auth2.signOut().then(function(){
         document.querySelector("#a").innerHTML = "Log in With Google";
      });
      auth2.disconnect();
   }
   
   window.onload = function(){
      startApp();      
   }
   
   document.getElementById("btnSignup").onclick = function() {
      location.href = "index.jsp?content=go_insert.mem";
   }
   
   document.getElementById("find_id").onclick = function() {
      location.href = "index.jsp?content=go_findid.mem"
   }
   document.getElementById("find_pwd").onclick = function() {
      location.href = "index.jsp?content=go_findpwd.mem"
   }
</script>


</body>
</html>