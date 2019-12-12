<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage</title>
<link href = "./css/member.css" type = "text/css" rel = "stylesheet" />
</head>
<body>
<div id = "mypage">
   <h2>마이페이지</h2>
   <div class = "mypage_box">
      <div id = "left">
         <span>저희 쇼핑몰을 이용해 주셔서 감사합니다. 
            <span class = "txt_rbold"><strong>${sessionScope.user_name }</strong></span>님은
            <span class = "txt_rbold">쇼핑몰</span>회원이십니다.
         </span>
      </div>
      <div id = "right">
         <table cellpadding = "0" cellspacing = "0">
         
            <thead>
               <tr>
                  <td>가용적립금</td>
                  <td>사용적립금</td>
                  <td>쿠폰</td>
                  <td>총마일리지</td>
                  <td>총주문</td>
               </tr>
            </thead>
            
            <tbody>
               <tr>
                  <td>-원</td>
                  <td>-원</td>
                  <td>-개</td>
                  <td>-원</td>
                  <td><fmt:formatNumber value="${tot }"/>원</td>
               </tr>
            </tbody>
         </table>
      </div>
   </div>
   
   <div class = "mypage_box">
      <h3>나의 주문처리 현황</h3>
      <div id = "state">
         <table cellpadding = "0" cellspacing="0">
            <thead>
               <tr class = "del_box_tit">
                  <td>결제전</td>
                  <td>결제완료</td>
                  <td>배송준비중</td>
                  <td>배송중</td>
                  <td>배송완료</td>
               </tr>
            </thead>
            
            <tbody>
               <tr>
                  <td class = "del_box">${list[0].rDelCount }</td>
                  <td class = "del_box">${list[1].rDelCount }</td>
                  <td class = "del_box">${list[2].rDelCount }</td>
                  <td class = "del_box">${list[3].rDelCount }</td>
                  <td class = "del_box">${list[4].rDelCount }</td>
               </tr>
            </tbody>
         </table>
      
      </div>
   </div>
   
   <div class = "mypage_box">
      <div class = "item">
         <a href = "index.jsp?content=ReSearch.rcd">
            <img src = "./mem_images/mypage_1.png"/>
            <div class = "order_list">
               주문내역조회
            </div>
         </a>
         
         <a href = "index.jsp?content=refundC.refund">
            <img src = "./mem_images/mypage_1.png"/>
            <div class = "order_list">
               환불|반품 조회
            </div>
         </a>
         
         <a href = "index.jsp?content=go_my_like.mem">
            <img src = "./mem_images/mypage_2.png"/>
            <div class = "interest">
               관심상품
            </div>
         </a>
         
         <a href = "#">
            <img src = "./mem_images/mypage_3.png"/>
            <div class = "coupon">
               쿠폰
            </div>
         </a>
         
         <a href = "#">
            <img src = "./mem_images/mypage_4.png"/>
            <div class = "savings">
               적립금조회
            </div>
         </a>
         
         
         <a href = "index.jsp?content=myqna_search.mem">
            <img src = "./mem_images/mypage_6.png"/>
            <div class = "my_text">
               1:1문의
            </div>
         </a>
         
         <a href = "#">
            <img src = "./mem_images/mypage_7.png"/>
            <div class = "address">
               배송주소록 관리
            </div>
         </a>
         
         <a href = "index.jsp?content=get_modify.mem">
            <img src = "./mem_images/mypage_8.png"/>
            <div class = "my_info">
               회원정보
            </div>
         </a>
      </div>
   </div>
</div>
</body>
</html>