<%@page import="bean.Param"%>
<%@page import="bean.ProductVo"%>
<%@page import="java.util.List"%>
<%@page import="bean.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
       <%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
<script> window.jQuery || document.write('<script src="booklet/jquery-2.1.0.min.js"><\/script>') </script>
<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
<script src="./lib/jquery.easing.1.3.js"></script>
<script src="./lib/jquery.booklet.latest.min.js"></script>
<link href="./css/category.css" type="text/css" rel="stylesheet"/>
<style>

</style>
</head>
<body>
<div id = "s_list">
         <div class='list' id='OT'>
               <!-- 카테고리 목록 -->
               <div id=bestproduct>
                  <c:choose>
                     <c:when test="${fn:substring(param.asd,0,3) eq 110}">
                        <a href="index.jsp?content=list.cate&asd=1101"><span id="category1" class="nav" >Leader</span></a>
                        <a href="index.jsp?content=list.cate&asd=1102"><span id="category1" class="nav">Coat</span></a>  
                        <a href="index.jsp?content=list.cate&asd=1103"><span id="category1" class="nav">Padding</span></a>
                     </c:when>
               
                     <c:when test="${fn:substring(param.asd,0,3) eq 111}">
                        <a href="index.jsp?content=list.cate&asd=1111"><span id="category1" class="nav" >Shirt</span></a>
                        <a href="index.jsp?content=list.cate&asd=1112"><span id="category1" class="nav">MenToMen</span></a>  
                        <a href="index.jsp?content=list.cate&asd=1113"><span id="category1" class="nav">T-Shirt</span></a>
                     </c:when>
               
                     <c:when test="${fn:substring(param.asd,0,3) eq 112}">
                        <a href="index.jsp?content=list.cate&asd=1121"><span id="category1" class="nav" >Jeans</span></a>
                        <a href="index.jsp?content=list.cate&asd=1122"><span id="category1" class="nav">Slacks</span></a>  
                        <a href="index.jsp?content=list.cate&asd=1123"><span id="category1" class="nav">Shorts</span></a>
                     </c:when>
                  
                     <c:when test="${fn:substring(param.asd,0,3) eq 113}">
                        <a href="index.jsp?content=list.cate&asd=1131"><span id="category1" class="nav" >Shoes</span></a>
                        <a href="index.jsp?content=list.cate&asd=1132"><span id="category1" class="nav">sneckers</span></a>  
                     </c:when>
                  
                     <c:when test="${fn:substring(param.asd,0,3) eq 114}">
                        <a href="index.jsp?content=list.cate&asd=1141"><span id="category1" class="nav">wallet</span></a>
                        <a href="index.jsp?content=list.cate&asd=1142"><span id="category1" class="nav" >watches</span></a>      
                     </c:when>
                  </c:choose>
               </div>
         </div>
      
      <div id='all_list'>
         <!-- 타이틀 이름 -->
      <h3>${category }</h3>
         <div id='list'><!-- for each -->
            <c:forEach var='data' items='${list }'>  <!-- 컨트롤러의 list를 data에 담는다. -->
               <div class='data' onclick="Custom_View('${data.pCode }')">
                   <img src='./supload/${data.attFileB }' width='120px' height= '160px'>
                  <div class="jaewook">
                     <img src="https://store.musinsa.com/skin/musinsa/images/icon_like_small_on.png" style="width: 15px; height: 15px;">
                     <span style="color: red;"><fmt:formatNumber value="${data.pLike}"/></span>
                  </div>
                  <span class="name">${data.pName}</span>
                  <div class="colors">
                     <c:forEach var='rgb' items="${data.rgb }">
                        <span style="background-color: ${rgb};"></span>
                     </c:forEach>
                  </div>
                  <div class="suyeon">
                     <c:choose>
                        <c:when test="${data. pPromotion eq 0}">
                           <span class="price"><fmt:formatNumber value="${data.pPrice}"/>원</span>
                        </c:when>
                        
                        <c:when test="${data. pPrice ne data.sPrice}">
                           <span class="discount">${data.pPromotion }%</span>
                           <div class="prices">
                              <span class="orip"><fmt:formatNumber value="${data.pPrice}"/>원</span>
                              <br/>
                              <span class="nowp"><fmt:formatNumber value="${data.sPrice}"/>원</span>
                           </div>
                        </c:when>
                     </c:choose>
                  </div>
               </div>
            </c:forEach>
         </div>
      </div>

</div>
    <script>
	function Custom_View(pCode){
	location.href = "index.jsp?pCode="+pCode+"&content=view.shop";
};
</script> 
</body>
</html>






