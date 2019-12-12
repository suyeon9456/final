<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<link href="./css/jquery.booklet.latest.css" type="text/css" rel="stylesheet" media="screen, projection, tv" />

<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
<script> window.jQuery || document.write('<script src="booklet/jquery-2.1.0.min.js"><\/script>') </script>
<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
<script src="./lib/jquery.easing.1.3.js"></script>
<script src="./lib/jquery.booklet.latest.min.js"></script>
    <script>
		$(function() {
		    $('#newproduct').booklet({
		        width:  '80%',
		        height: 700,
		        pageNumbers : false,
		        easing:  null,
		        easeIn:  null,
		        easeOut: null,
		       keyboard : true,
		       tabs:  true,
		       tabWidth:  180,
		       tabHeight:  20
		    });
		
		});
	</script>
<meta charset="UTF-8">
<title>SIMSINSA</title>

<link href="./css/index.css" type="text/css" rel="stylesheet"/>
</head>
<body>
<% 
request.setCharacterEncoding("utf-8");   
response.setCharacterEncoding("utf-8");
response.setContentType("text/html; charset=utf-8");
String content = request.getParameter("content");
if(content==null) content="main.main";
//자동로그인 쿠키 찾기
 Cookie[] cookies = request.getCookies();
   if(cookies != null){
      for(int i=0; i<cookies.length; i++){
         Cookie c = cookies[i];
         if(c.getName().equals("shop_user_name")){
            session.setAttribute("user_name", c.getValue());
         }
         if(c.getName().equals("shop_user_id")){
            session.setAttribute("user_id", c.getValue());
         }
         
      }
   }
%>
	<div class="all_fixed">
		<section id="header">
	
			<div id="high_menu">
				<div id="rm_1">
					<c:choose>
		                <c:when test="${sessionScope.user_id eq null}">
		                   <a href="index.jsp?content=go_notice_search.not"><span class="rm">공지사항</span></a>
		                   <a href="index.jsp?content=go_insert.mem"><span class="rm">회원가입</span></a> 
		                   <a href="index.jsp?content=go_login.mem"><span class="rm">로그인</span></a>    
		                </c:when>
		             
		                 <c:when test="${sessionScope.user_id eq 'admin'}">
		                   	 <strong>관리자계정</strong>
		                   	 <a href="index.jsp?content=go_notice_search.not"><span class="rm">공지사항</span></a>
		                    <a href="index.jsp?content=adminPage.adm"><span class="rm">관리자페이지</span></a> 
		                  <a href="logout.mem"><span class="rm">로그아웃</span></a>
		                </c:when>
		                <c:when test="${sessionScope.user_id ne null}">
		                    ${sessionScope.user_name }님
		                    <a href="index.jsp?content=go_notice_search.not"><span class="rm">공지사항</span></a>
		                    <a href="index.jsp?content=mypage.mem"><span class="rm">마이페이지</span></a> 
		                   	<a href="index.jsp?content=cart.trade"><span class="rm">장바구니</span></a>
		                    <a href="logout.mem"><span class="rm">로그아웃</span></a>
		                </c:when>
		                
	           		</c:choose>
				</div>
			</div>		
				
			<div id = "top_box">
				<div id = "find_box">
					<div id="rm_2" class = "top_child">
					<a href="index.jsp"><img src="./css/logo1.png" /></a>
				</div>
			</div>
				<div id="logo" class = "top_child">
					<div id = "logo_box">
						<div id = "logo_box_in">
							<form method="post" name="totalFrm">
								<input type="text" name="totalFindStr" id="total_findStr" size="40" placeholder="검색어를 입력해주세요." style="text-indent: 10px;" onkeypress="if( event.keyCode == 13 ){toFind();}">
								<input type = "button" name = "btnFind" id = "btn_find" style = "background-image: url('./css/search.png'); background-repeat: no-repeat;" onclick = "toFind();"/>
							</form>
						</div>
					</div>
				</div>
				<div id="left_menu" class = "top_child">
					<div id="left_show">
						<img src="http://www.elandrs.com/upload/dspl/banner/10/963/00/191000000155963.jpg"/>
					</div>
				</div>
			</div>
		</section>
	
		<section id="nav">
		<div id="sel_man">
			<span class="gender" id="gender_man">MAN</span>
			<a href="index.jsp?content=list.cate&asd=110"><span id="category1" class="nav">OUTTER</span></a> 
			<a href="index.jsp?content=list.cate&asd=111"><span id="category2" class="nav">TOP</span></a>
			<a href="index.jsp?content=list.cate&asd=112"><span id="category3" class="nav">BOTTOM</span></a> 
			<a href="index.jsp?content=list.cate&asd=113"><span id="category4" class="nav">SHOES</span></a> 
			<a href="index.jsp?content=list.cate&asd=114"><span id="category5" class="nav">ACC</span></a>
		</div>
		<div id="sel_woman">
			<span class="gender" id="gender_woman">WOMAN</span>
			<a href="index.jsp?content=list.cate&asd=220"><span id="category1" class="nav">TOP</span></a>
			<a href="index.jsp?content=list.cate&asd=221"><span id="category2" class="nav">DRESS/SKIRT</span></a> 
			<a href="index.jsp?content=list.cate&asd=222"><span id="category3" class="nav">BLOTHES</span></a>
			<a href="index.jsp?content=list.cate&asd=223"><span id="category4" class="nav">SHOES&BAG</span></a> 
			<a href="index.jsp?content=list.cate&asd=224"><span id="category5" class="nav">ACC</span></a>
		</div>
	</section>
	</div>

	<section id="wrap">
		<jsp:include page="<%=content %>"/>
	</section>
	
	<section id="footer">
		<%@include file = "footer.jsp" %>
	</section>
	
	<section id="hiddenlayer">
		<!--  Layer처리를 하기위한 hidden section입니다.  -->
	</section>
	
	<script>
	var frmm = document.totalFrm;
	var gender_man = document.getElementById("gender_man");
	var man = document.getElementById("sel_man");
	var gender_woman = document.getElementById("gender_woman");
	var woman = document.getElementById("sel_woman");
	
	function toFind(){      
	      frmm.action = "index.jsp?content=totalFind.cate";
	      frmm.submit();
	   }
	/////////////////////////헤더고정/////////////////////////////////
	$(document).ready(function() {
		var jbOffset = $('.all_fixed').offset();
		$(window).scroll(function() {
			if ($(document).scrollTop() > jbOffset.top) {
				$('.all_fixed').addClass('jbFixed');
			} else {
				$('.all_fixed').removeClass('jbFixed');
			}
		});
	});
	
	//////////////////////// 코드 리팩토링 해야함 ㅡㅡ /////////////////////////////// 
	gender_man.onclick = function(){
		man.style.display = "none";
		woman.style.display = "inline-block";
	}
	
	gender_woman.onclick = function(){		
		woman.style.display = "none";
		man.style.display = "inline-block";
	}

	</script>
</body>

</html>