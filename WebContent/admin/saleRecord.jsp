<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SaleRecord</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
	#saleRecord {
		margin: 0 auto;
		width: 60%;
		height: 100%;
	}
	
	#div1{
		margin: 0 auto;
		text-align : center;
		border: 2px solid;
		width: 80%;
		padding-top: 3%;
		padding-bottom: 3%;
	}
	
	#img{
		margin-top: 25px;
		margin-bottom: 30px;
	}
	
	#circle1{
		display : inline-block;
		width: 200px;
		height: 200px;
		border: 2px solid;
		-webkit-border-radius: 100px;
		-moz-border-radius: 100px;
		margin-right: 70px;
		margin-top: 10px;
	}
	
	#circle2{
		display : inline-block;
		width: 200px;
		height: 200px;
		border: 2px solid;
		-webkit-border-radius: 100px;
		-moz-border-radius: 100px;
	}
	
	 #title{
      padding-top: 10px;
      padding-bottom: 10px;
      margin-bottom: 20px;
      border-bottom: 2px solid;
      border-top: 2px solid;
      
   }
   
   #data{
      padding: 5px;
      margin-bottom : 10%;
      height: 30px;
      line-height: 30px;
      color : #aaa;
      
   }
	
	#listt{
		text-align: center;
	}
	
	
   .no{display:inline-block; width: 8%;}
   .buys{display:inline-block; width: 15%;}
   .brand{display:inline-block; width: 20%;}
   .priceA{display:inline-block; width: 20%;}
   .delivery{display:inline-block; width: 15%;}
   .sales{display:inline-block; width: 8%;}
   
</style>
</head>
<body>
<div id = 'saleRecord'>
<form name = 'frm_sale' id = "frm_sale" method="post">
	<H1 style = "border-bottom: 2px solid; padding-bottom: 5px; margin-bottom: 25px;">판매내역 조회</H1>

	<div id = 'div1'>
	<span style = "font-weight: bold; margin-right: 205px; padding-bottom: 5px;">결제 전</span>
	<span style = "font-weight: bold; margin-left: 5px;">결제 완료</span>
	<br/>
		<span id = "circle1">
			<img id = 'img' src="./mem_images/pay1.png " width="100px;" height="50px;">
			<br/>
			<span style = 'font-weight: bold; font-size: x-large;'>${vo.rDelter1}</span>
			
		</span>
		<span id = "circle2">
			<img id = 'img' src="./mem_images/pay2.png " width="100px;" height="50px;">
			<br/>
			<span style = 'font-weight: bold; font-size: x-large;'>${vo.rDelter2}</span>
		</span>
	</div>
	
	<br/><br/>
	
	<input type = 'text' name = 'findStr' style = 'margin-right: 10px; margin-left: 77%;' />
	<input type = 'submit' name = 'search' value = '검색' style = 'background-color: white; border: 1px solid lightgray; width: 70px; float: right'/>
	
	<br/><br/>
	
	<div id = 'title'>
      <span class = 'no'>no</span>
      <span class = 'buys'>주문자</span>
      <span class = 'brand'>상품코드</span>
      <span class = 'priceA'>주문금액(수량)</span>
      <span class = 'delivery'>주문날짜</span>
      <span class = 'sales'>결제현황</span>
   </div>
	
	<c:forEach var = "dataa" items = "${list }" varStatus="status">
      <div id = 'data' >
         <span class = 'no'>${dataa.rSerial } </span>
         <span class = 'buys'>${dataa.rId }</span>
         <span class = 'brand'><img src = "./supload/${dataa.fPhoto }" style = "width: 80px; height: 70px; cursor: pointer;" onclick = "go('${dataa.rCode}')" ></img></span>
         <span class = 'priceA'><fmt:formatNumber value="${dataa.rAfter }"/>원&nbsp;&nbsp;&nbsp;(${dataa.rEa }개)</span>
         <span class = 'delivery'>${dataa.rDate }</span>
         
         <c:if test="${dataa.rDelter == 0 }">
            <span class = 'sales'>   
               <select name="select${status.count }" class = 'select${status.count }'>
                   <option value="결제전">결제전</option>
                   <option value="결제완료">결제완료</option>
               </select>
            <input type = 'button' value = '저장' name = 'btnSave' id = 'btnSave' onclick = "goo(btnSave${status.count },${dataa.rSerial })" style = 'background-color: white; border: 1px solid lightgray; width : 70px; margin-left: 5px;'/>
            </span>
         </c:if>   
         
         <c:if test="${dataa.rDelter == 1 }">
            <span class = 'sales'>   
               <select name="select${status.count }" class = 'select${status.count }'>
                   <option value="결제전">결제전</option>
                   <option value="결제완료">결제완료</option>
               </select>
            </span>
            <input type = 'button' value = '저장' name = 'btnSave' id = 'btnSave' onclick = "goo(btnSave${status.count },${dataa.rSerial })" style = 'background-color: white; border: 1px solid lightgray; width : 70px; margin-left: 15px;'/>
         </c:if>   
         
         <c:if test="${dataa.rDelter == 2 }">
            <span class = 'sales'>결제완료</span>
         </c:if>   
         
         <input type = 'hidden' name = 'btnSave${status.count }' value = "${status.count }"/>

      </div>
   </c:forEach>
	
	<div id = 'listt'>
		<input type = "button" value = "목록으로" name = "btnListt" id = "btnListt" style = "background-color: white; border: 1px solid lightgray; width : 70px; margin-bottom: 50px; margin-top: 50px;"/>
	</div>
	
</form>
</div>
<script>
	var frm_sale = document.frm_sale;
	
	function goo(ev,s){
		var nn = "btnSave" + ev.value;
		var evv = ev.value;
		
	    var vall = $(".select"+evv).val();
	    var seri = s;
		
		if(vall == "결제전"){
			var yn = confirm("결제 전으로 수정 하시겠습니까?");
				if(yn == true){
					frm_sale.action = "saleUpdate1.rcd?rSerial=" + seri;
					frm_sale.submit();
				}

		}
		
		if(vall == "결제완료"){
			var yn = confirm("결제완료로 수정 하시겠습니까?");
			if(yn == true){
				frm_sale.action = "saleUpdate2.rcd?rSerial=" + seri;
				frm_sale.submit();
			}
		}
	} 
	
	
	frm_sale.btnListt.onclick = function(){
		frm_sale.action = "index.jsp?content=adminPage.adm";
		frm_sale.submit();
	}
	
	 function go(ev){
		 frm_sale.action = "index.jsp?content=view.shop?pCode=" + ev;
		 frm_sale.submit();
	   }
	
	
</script>
</body>
</html>






