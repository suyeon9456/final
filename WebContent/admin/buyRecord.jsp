<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BuyRecord</title>
<link href="./css/admin.css" type="text/css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

</head>
<body>
<div id = 'buyRecord'>
<form name = 'frm_buyRecord' id = 'frm_buyRecord' method="post"> 
   <H1 style = "margin:20px auto;">구매내역 조회</H1>
   
   <ul style = 'list-style: none; color : #666;'>
      <li>동일 주문 건이라도 2개 이상의 브랜드를 주문하신 경우,각각 배송됩니다.</li>
      <li>입금 확인 상태만 주문/취소 가능합니다.배송 준비 중부터 취소가 어려우며 반송 후 환불 처리 됩니다.</li>
      <li>구매 확정시 환불 및 교환이 불가능합니다.</li>
   </ul>
   <br/>
   
   <div id = 'btns'>
      <div id = "btns_date">
         <input type = 'button' id = "btnWeek"    name = 'btnWeek'   value = "1주일"   style = "background-color: white; border: 1px solid lightgray;"/>
         <input type = 'button' id = "btnMonth"   name = 'btnMonth'  value = "1개월"   style = "background-color: white; border: 1px solid lightgray;"/>
         <input type = 'button' id = "btn3Month"  name = 'btn3Month' value = "3개월"   style = "background-color: white; border: 1px solid lightgray;"/>
         <input type = 'button' id = "btnAll"     name = 'btnAll'    value = "전체시기" style = "background-color: white; border: 1px solid lightgray;"/>
         <input type = 'Date' id = "oneDate"  name = 'oneDate' value = "2019-01-01"/>
         ~<input type = 'Date' id = "twoDate"  name = 'twoDate' value = '2019-12-31'/>
      </div>
      <div id = "btns_find">
         <input type = 'text' id = 'findStr' name = 'findStr' value = "${para.findStr }"/>
         <input type = 'submit' id = "btnSearch"  name = 'btnSearch' value = "조회"    style = "background-color: white; border: 1px solid lightgray; width: 70px; "/>
      </div>
   </div>
   
   <div id = 'title'>
      <span class = 'sales'>상품정보</span>
      <span class = 'orderDate'>주문일자</span>
      <span class = 'orderNum'>주문번호</span>
      <span class = 'priceA'>주문금액(수량)</span>
      <span class = 'delivery'>배송현황</span>
      <span class = "change">환불/반품</span>
   </div>
   
   <c:forEach var = "dataa" items = "${list }" varStatus="status">
      <c:if test="${dataa.rRefund == 0 }">
         <div id = 'data' >
           <span class = 'sales'>
               <img src = "./supload/${dataa.fPhoto }" style = "width: 85px; height: 85px; cursor: pointer;" onclick = "go('${dataa.rCode}')"></img>
               ${dataa.rName }
            </span>
            <span class = 'orderDate'>${dataa.rDate }</span>
            <span class = 'orderNum'>${dataa.rCode }</span>
            <span class = 'priceA'>${dataa.rPrice }</span>
           <span class = 'delivery'>
               <c:choose>
                  <c:when test="${dataa.rDelter eq '1'}">
                 		    결제전
                  </c:when>
                  <c:when test="${dataa.rDelter eq '2'}">
            		         결제완료
                  </c:when>
                  <c:when test="${dataa.rDelter eq '3'}">
            		         배송준비중
                  </c:when>
                  <c:when test="${dataa.rDelter eq '4'}">
             		        배송중
                  </c:when>
                  <c:when test="${dataa.rDelter eq '5'}">
        		             배송완료
                  </c:when>
               </c:choose>
            </span>
            
               <span class = "change">
                  <select name="select${status.count }" id = "select${status.count }" class = 'select${status.count }' >
                      <option value = "" >전체</option>
                      <option value = "환불">환불</option>
                      <option value = "반품">반품</option>
                  </select>
               </span>
            
            <input type = 'hidden' name = 'btnSave${status.count }' value = "${status.count }"/>
            <input type = 'button' value = '저장' onclick = "goo(btnSave${status.count },${dataa.rSerial })" style = "background-color: white; border: 1px solid lightgray;"/>
            
         </div>
      </c:if>
   </c:forEach>
         
   <div id = 'listt'>
      <input type = "button" value = "목록으로" name = "btnListt" id = "btnListt" style = "background-color: white; border: 1px solid lightgray; width : 200px; height:40px; margin-top: 50px;"/>
   </div>
         
</form>
</div>

<script>
   var frm_record = document.frm_buyRecord;
   
   
   //var select = document.getElementsByName("select")
   
   function goo(ev,s){
      var nn = "btnSave" + ev.value;
      var evv = ev.value;
      
       var vall = $(".select"+evv).val();
       var seri = s;
      
      if(vall == "반품"){
         var yn = confirm("반품 신청을 하시겠습니까?");
            if(yn == true){
               frm_record.action = "Update1.rcd?rSerial=" + seri;
               frm_record.submit();
            }

      }
      
      if(vall == "환불"){
         var yn = confirm("환불 신청을 하시겠습니까?");
         if(yn == true){
            frm_record.action = "Update2.rcd?rSerial=" + seri;
            frm_record.submit();
         }
      }
   } 
   
   frm_record.btnAll.onclick = function(){
      frm_record.action = "index.jsp?content=ReSearch.rcd"
      frm_record.submit();
   }
   
   frm_record.btnWeek.onclick = function(){
      frm_record.action = "index.jsp?content=RewSearch.rcd"
      frm_record.submit();
   }
   
   frm_record.btnMonth.onclick = function(){
      frm_record.action = "index.jsp?content=RemSearch.rcd"
      frm_record.submit();
   }
   
   frm_record.btn3Month.onclick = function(){
      frm_record.action = "index.jsp?content=RetmSearch.rcd"
      frm_record.submit();
   }
   
   frm_record.btnListt.onclick = function(){
      frm_record.action = "index.jsp?content=mypage.mem";
      frm_record.submit();
   }
   
   function go(ev){
	      frm_record.action = "index.jsp?content=view.shop?pCode=" + ev;
	      frm_record.submit();
	   }
   
   
</script>

</body>
</html>