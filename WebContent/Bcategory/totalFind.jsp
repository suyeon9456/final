<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>총 검색 결과</title>
<link href="./css/totalFind.css" type="text/css" rel="stylesheet"/>
</head>
<body>
<div id = "totalFind">
	<div id='all_list'>
         <!-- 타이틀 이름 -->
      <h3>'<span style = "font-weight: bold">${totalFindStr }</span>'에 대한 검색결과</h3>
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