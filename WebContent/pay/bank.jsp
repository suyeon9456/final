<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href = "./css/pay.css" type = "text/css" rel = "stylesheet" />
</head>
<body>

<div id="realpay">

<div id = "result"></div>

<div class = "result_ic_text">
    <img src = "./mem_images/pay.png"></img><br/>
      <img src = "./css/logo1.png" style = "width: 120px;"/>
      <h2>주문이 완료 되었습니다.</h2>
   </div>
   
   <div class = "result_content">
      <div class = "hh3">저희 쇼핑몰을 이용해주셔서 감사합니다.</div>
      
      <div>
         <table>
            <tbody>
               <tr>
                  <td>날짜</td>
                  <td>${info[0].rDate }</td>
               </tr>
               
               <tr>
                  <td>상품명</td>
                  <td>
					<c:choose>
						<c:when test="${fn:length(info) eq 1}">
							${info[0].rName }
						</c:when>
						<c:when test="${fn:length(info) ne 1}">
							${info[0].rName } 외 ${fn:length(info)-1 }개
						</c:when>
					</c:choose>
				  </td>
               </tr>
               
               <tr>
                  <td>금액</td>
                  <td>
                  	<c:choose>
						<c:when test="${fn:length(info) eq 1}">
							<fmt:formatNumber value="${info[0].rAfter }"/>원
						</c:when>
						<c:when test="${fn:length(info) ne 1}">
							<c:forEach var="i" items="${info }">
								<c:set var="tot" value="${tot + i.rAfter}"></c:set>
							</c:forEach>
								<fmt:formatNumber value="${tot }"/>원
						</c:when>
					</c:choose>
                  </td>
               </tr>
            </tbody>
         </table>
      </div>
   </div>
   
   <div id = "btn_main_btn">
      <form name = "pfrm" method="post">
         <input type = "hidden" name = "mId" value = "${result.mId }" />
         <input type = "hidden" name = "mName" value = "${result.mName }" />
         <input type = "button" name = "btnMain" id = "btn_main" value = "메인페이지" />   
      </form>
   </div>

</div>


<script>

var result= document.getElementById("result");
var paylist = document.getElementById("paylist");



document.getElementById("btn_main").onclick = function() {
	location.href = "index.jsp";
}


</script>
</body>
</html>