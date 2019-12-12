<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 관심 페이지</title>
<link href = "./css/member.css" type = "text/css" rel = "stylesheet" />
<script src = "./lib/jquery-3.4.1.js"></script>
</head>
<body>
<div id = "my_like">
   <H1 style = "margin:20px auto;">관심상품 조회</H1>
   
   <div id = 'title'>
      <span class = 'like_code'>상품명</span>
      <span class = 'like_price'>가격</span>
      <span class = 'like_sale'>주문/구매</span>
   </div>
   
   <c:forEach var = "data" items="${list }" >
      <div class = "like_list">
         <span class = 'like_code' onclick="viewClick(${data.pCode})">
            <img src = './supload/${data.attFileB }' />
            <span>${data.pName }</span>
         </span>
         <c:choose>
            <c:when test="${data.pPromotion eq 0 }">
               <span class = 'like_price'><fmt:formatNumber value="${data.pPrice}"/>원</span>      
            </c:when>
            
            <c:when test="${data.pPromotion ne 0 }">
               <span class = 'like_price'><fmt:formatNumber value="${data.sPrice}"/>원</span>      
            </c:when>
         </c:choose>
         <span class = 'like_sale'>
               <input type = "button" name = "btnBuy" id = "btnBuy" value = "바로구매" style="cursor: pointer;" onclick = "buyClick(${data.pCode})"/><br/>
               <input type = "button" onclick = "cartClick(${data.pCode})" name = "btnCart" id = "btnCart" value = "장바구니" style="cursor: pointer;"/><br/>
               <input type = "button" onclick = "delClick(${data.pCode})" id = "btnDelLike" value = "삭제" style="cursor: pointer;"/>
         </span>
      </div>
   </c:forEach>
   
   <form method="post" name = "likeFrm">
      <input type = "hidden" value = "" name = "pCode" id = "pCode"/>   
      <input type = "hidden" value = "${sessionScope.user_id }" name = "mId" id = "mId"/> 
      <input type="hidden" id="hidden" name="paylist" value=""/>     
   </form>
         
   <div id = 'listt'>
      <input type = "button" value = "목록으로" name = "btnListt" id = "btnListt" style = "background-color: white; border: 1px solid lightgray; width : 200px; height:40px; margin-top: 50px;"/>
   </div>
   

</div>

   <div id = "pop">
      <div>
         <img src = "./css/images/cart_i.png"/>
         <p>선택한 상품이 장바구니에 담겼습니다.</p>
         <div id = "cart_btns">
            <input type = "button" id = "btn_re" value = "계속쇼핑하기" onclick = "re()" />
            <input type = "button" id = "btn_cart" value = "장바구니가기" onclick = "btncart()"/>
         </div>
      </div>
   </div>      
<script>
var frm = document.likeFrm;
   
   function delClick(pCode){
      frm.pCode.value = pCode;
      var url = "like_delete.mem";
      frm.action = url;
      frm.submit();
   }
   
   function buyClick(pCode) {
	   frm.pCode.value = pCode;
		if(confirm("해당 상품을 바로구매 하시겠습니까?")){
			$.ajax({
	    		  async : false,
	    		  url : "info.shop",
	    		  type : "post",
	    		  data : {"rId" : '${sessionScope.user_id}', "rCode" : pCode, "rEa" : '1'},
	    		  success : function(data, status) {
			   		var hidden = document.getElementById("hidden");
			   		hidden.value=data;
		   			frm.action = 'index.jsp?content=payout.pay';		   			
		   		  	frm.submit();
				}
	    	  }
	    	);
		}else{
			return false;
		}
 	    	 
 	    	     		
		  }
   
   function cartClick(pCode){
      frm.pCode.value = pCode;
      
      $.ajax({
         async: false,
         url : "insert.trade",
         type : "get",
         dataType: "html",
         data : {"ccode":$("#pCode").val(), "cid" : $("#mId").val()},
         success: function(data,status){
            if(data == "Y"){
               console.log("dddd");
                $('#pop').css("display","block");
                  $('#my_like').css("-webkit-filter", "blur(6px)");
            }else{
               alert("장바구니 오류발생");
            }
         }
      });
      
   }
   
   
   function re(){
      $('#pop').css("display","none");
      $('#my_like').css("-webkit-filter", "blur(0px)");
   }
   
   function btncart(){
      location.href="index.jsp?content=cart.trade";
   }
   
   function viewClick(pCode){
      frm.pCode.value = pCode;
      var url = "index.jsp?content=view.shop";
      frm.action = url;
      frm.submit();
      
   }
   
   document.getElementById("btnListt").onclick = function(){
	      location.href="index.jsp?content=mypage.mem";
	   }
</script>
</body>
</html>