<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>refundRecord</title>
<!-- <link href='../css/refundS.css' type='text/css' rel='stylesheet'/> -->
<style type="text/css">
/*------------ 관리자 환불반품관리 -------------------*/

#buyRecord {
   margin: 0 auto;
   width: 1400px;
}

#buyRecord h1{
   margin: 20px auto;
}

#paylist {
   margin: 0 auto;
   text-align: center;
}

#buyRecord ul{
   font-size: 13px;
   margin:20px auto;
}

#buyRecord #btns{
      margin:20px auto;
      text-align: right;
}

#buyRecord input[type=button]{
   width: 78px;
   height:32px;
   background-color: #fff;
   border:0;
   border:1px solid #ccc;
   cursor: pointer;
}

#buyRecord #btnSearch{
   width: 100px;
}
   
#buyRecord input[type=Date]{
   height:30px;
   margin: 0px auto;
   text-align: center;
   border:1px solid #ccc;
}

#buyRecord input[type=text]{
   height:30px;
   margin: 0px auto;
   text-align: center;
   border:1px solid #ccc;
}

#paylist_header {
   margin:0px auto;
   margin-top:20px;
    padding-top: 10px;
    border-bottom: 1px solid #ddd;
    border-top: 1px solid #adadad;
    background-color: #f3f3f3;
    color: #333;
    height: 30px;
}

.mem_id {
   width: 10%;
   float: left;
}

.product_img {
   width: 10%;
   float: left;
}

.item_code {
   width: 10%;
   float: left;
}

.item_name {
   width: 10%;
   float: left;
}

.orderDate {
   width: 10%;
   float: left;
}

.item_price {
   width: 8%;
   float: left;
}

.item_ea {
   width: 5%;
   float: left;
}

.cal_price {
   width: 15%;
   float: left;
}

.check {
   width: 10%;
   float: left;
}
.change {
   width: 12%;
   float: left;
}

.paylist_data{
   height: 110px;
   border-bottom: 1px solid #ddd;
   overflow: hidden;
}

.paylist_data span {
   line-height: 110px;
   vertical-align: middle;
   overflow: hidden;   
}

.paylist_data .product_img{
   line-height: 62px;
   vertical-align: middle;
}

.paylist_data .product_img img{
   margin-top:12px;
}

.paylist_data .cal_price {
   color: red;
}

.paylist_data .btnCC {
   size: 25px;
}

#agree_zone{
text-align: center;
}

#agree_zone #btn_agree{
   width: 200px;
   height: 40px;
}
</style>
</head>
<body>
   <div id='buyRecord'>
      <form name='frm_SaleRecord' id='frm_SaleRecord' method="post">
         <H1>환불|반품 조회</H1>  

         <ul style='list-style: none; color: #666;'>
            <li>환불/교환 요청은 배송완료 시점부터 7일까지 가능합니다.</li>
            <li>반품 방법은 롯데택배 반품, 편의점 반품 두 가지가 있습니다. (일부 상품 및 화물/설치 상품제외)</li>
            <li>- 롯데택배 반품 : 환불요청 후 1~3일 이내(주말/공휴일 제외)에 택배 기사가 방문</li>
            <li>- 편의점 반품 : 가까운 편의점 (CU, GS25)에 방문하셔서 직접 접수</li>
         </ul>
         <br />

         <div id='btns'>
            <input type='button' id="btnWeek" name='btnWeek' value="1주일"
               style="background-color: white; border: 1px solid lightgray;" />
               
            <input   type='button' id="btnMonth" name='btnMonth' value="1개월"
               style="background-color: white; border: 1px solid lightgray;" />
               
            <input    type='button' id="btn3Month" name='btn3Month' value="3개월"
               style="background-color: white; border: 1px solid lightgray;" />
               
            <input   type='button' id="btnAll" name='btnAll' value="전체시기"
               style="background-color: white; border: 1px solid lightgray;" />
                
            <input    type='Date' id="btnCalOne" name='btnCalOne' /> ~
            <input    type='Date' id="btnCalTwo" name='btnCalTwo' />
            <input type = 'text' id = 'findStr' name = 'findStr' style = "margin-left: 40px;" value = "${para.findStr }"/>
            <input type='button' id="btnSearch" name='btnSearch' value="조회"
               style="background-color: white; border: 1px solid lightgray; width: 70px;" />
            <input type='text' id='cut' name='cut' value='${para.cut }'/>
         </div>
         
         <div id="paylist">
            <div id="paylist_header">
               <span class="mem_id">회원ID</span>
               <span class="product_img">상품정보</span>
               <span class="item_code">상품코드</span>
               <span class="item_name">이름</span>
               <span class='orderDate'>주문일자</span>
               <span class="item_price">가격</span>
               <span class="item_ea">개수</span>
               <span class="cal_price">총가격</span>
               <span class="check">내역</span>
               <span class="check_box">승인</span>
               <span class="binbox"></span>
            </div>
            
            <div class="datalist">
               <c:forEach var='data' items='${list }'>
                  <div class="paylist_data">
                     <span class="mem_id">${data.rId }</span>
                     <span class="product_img"><img class="productimg"src="./supload/${data.fPhoto }" width="85px"height="85px"/></span>
                     <span class="item_code">${data.rCode }</span>
                     <span class="item_name">${data.rName }</span>
                     <span class='orderDate'>${data.rDate }</span>
                     <span class="item_price">${data.rPrice }</span>
                     <span class="item_ea">${data.rEa }</span>
                     <span class="cal_price">${data.rAfter }</span>
                     
                     <c:choose>
                        <c:when test="${data.rRefund =='1'}">
                           <span class='check'>반품요청</span>
                        </c:when>
                        <c:when test="${data.rRefund =='2'}">
                           <span class='check'>환불요청</span>
                        </c:when>
                        <c:when test="${data.rRefund =='3'}">
                           <span class='check'>승인완료</span>
                        </c:when>
                     </c:choose>
                     <c:if test="${data.rRefund =='3'}"><span class="check_box" style="visibility: hidden;">
                        <input type="checkbox" name="chk" id="chk" value="${data.rSerial }"></span></c:if>
                     <c:if test="${data.rRefund !=3}"><span class="check_box" style="visibility: visible;">
                        <input type="checkbox" name="chk" id="chk" value="${data.rSerial }"></span></c:if>
                  </div>
               </c:forEach>
            </div>
         </div>
      </form>
      <br/>
      <div id="agree_zone">
         <input type="button"   id="btn_agree" value="승인" />
      </div>      
   </div>

   
<script>
var checkBox =document.getElementsByName("chk");
var cut = document.getElementById("cut");

   getId("btn_agree").onclick = function(){
      var cut = document.getElementById("cut");
      alert("abc");
      alert(cut.value);
      var frm_SaleRecord = document.frm_SaleRecord;
      if(cut.value ==1){
         frm_SaleRecord.action = 'index.jsp?content=wRefundS.refund';
         frm_SaleRecord.submit();
      }else if(cut.value ==2){
         frm_SaleRecord.action = 'index.jsp?content=mRefundS.refund';
         frm_SaleRecord.submit();
      }else if(cut.value ==3){
         frm_SaleRecord.action = 'index.jsp?content=tmRefundS.refund';
         frm_SaleRecord.submit();
      }else{
         frm_SaleRecord.action = 'index.jsp?content=refundS.refund';
         frm_SaleRecord.submit();         
      }
   }
   
   getId("btnWeek").onclick = function(){
      cut.value = 1;
      frm_SaleRecord.action = 'index.jsp?content=wRefundS.refund';
      frm_SaleRecord.submit();
   }
   
   getId("btnMonth").onclick = function(){
      cut.value = 2;
      frm_SaleRecord.action = 'index.jsp?content=mRefundS.refund';
      frm_SaleRecord.submit();
   }
   
   getId("btn3Month").onclick = function(){
      cut.value = 3;
      frm_SaleRecord.action = 'index.jsp?content=tmRefundS.refund';
      frm_SaleRecord.submit();
   }
   
   getId("btnAll").onclick = function(){
      cut.value = 4;
      frm_SaleRecord.action = 'index.jsp?content=aRefundS.refund';
      frm_SaleRecord.submit();
   }
   
   function getId(id){
      return document.getElementById(id);
   }
</script>

</body>
</html>
