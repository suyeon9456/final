<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<title>Customer View</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta name="description" content="spzoom. Simple jQuery plugin for zooming images"/>
<link rel="stylesheet" type="text/css" href="./spzoom-master/jquery.spzoom.css"/>
<link rel="stylesheet" type="text/css" href="./spzoom-master/test/style.css"/>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script type="text/javascript" src="./spzoom-master/jquery.spzoom.js"></script>
<link href="./css/customer_view.css" type="text/css" rel="stylesheet"/>

</head>
<body>
<div id = "customer_view">
      <h2>SIMSINSA</h2>
      <h3>${data.pName }</h3>
      <hr/>
      
<form id = 'frm' name='frm' method='post' >
	<input type='hidden' name='pCode' id='pCode' value="${data.pCode}"/>
	<input type='hidden' name='m_id' id='m_id' value="${sessionScope.user_id}"/>
	<input type='hidden' name='attFileB' id='attFileB' value="${data.attFileB }"/>
	<input type='hidden' name='cName' id='cName' value="${data.pName }"/>
	<input type='hidden' id='cPrice' value="${data.pPrice }"/>
	<input type='hidden' id='cPromotion' value="${data.pPromotion }"/>
	<input type='hidden' id='cPoint' value='<c:choose><c:when test="${data.pPoint eq 1}">Y</c:when><c:when test="${data.pPoint eq 2}">N</c:when></c:choose>'/>
	<input type='hidden' id ='sPrice' value="${data.sPrice }" />
	<input type="hidden" id="hidden" value="" name="paylist"/>
</form>

   <div id = 'relative'>
      
      <div id = 'd1'>
         <div id="demo">
               <a href="./supload/${data.attFileB }" data-spzoom data-spzoom-width="400" data-spzoom-height="400" id = "demo_a">
                   <img src="./supload/${data.attFileB }" alt="Image" style="width:520px; height:520px;" id = "demo_img"/>  
               </a> 
         </div>
           
         <div id = 'd2'>
           <c:forEach var='pto' items="${data.delFile}">
              <div class='dd' style="width:70px; height:70px;">
                  <img src='./supload/${pto}' width='70px' height= '70px' onclick = "imgEv(event)"/>
              </div>
            </c:forEach>
         </div>
      </div>
      
      
         
         <div id = 'd3'>
         
            <c:choose>
               <c:when test ="${data.pPromotion ne 0 }">
               <div id = "discount_box">
               ${data.pPromotion }<span style = "font-size:18px;">%</span>
              </div>
               </c:when>
            </c:choose>
           
           <table cellpadding = "0" cellsapacing = "0" border="0">
                 <c:choose>
                       <c:when test = "${data.pPromotion eq 0 }">
                          <tr style = "border-bottom:1px solid #ddd;">
                             <td class = "tit">판매가</td>
                             <td style = "font-size: 24px;"><strong><fmt:formatNumber value="${data.pPrice}"/>원</strong></td>
                          </tr>
                       </c:when>
                       
                    
                    <c:when test = "${data.pPromotion ne 0 }">
                       <tr>
                          <td class = "tit">판매가</td>
                          <td style = "text-decoration: line-through;"><fmt:formatNumber value="${data.pPrice}"/>원</td>
                       </tr>
                       
                       <tr style = "border-bottom:1px solid #ddd;">
                          <td class = "tit">할인가</td>
                          <td style = "font-size: 24px;"><strong><fmt:formatNumber value="${data.sPrice}"/>원</strong></td>
                       </tr>
                    </c:when>
                 </c:choose>
                 
                 <tr>
                    <td class = "tit">배송비</td>
                    <td>무료배송</td>
                 </tr>
                 
                 <tr>
                    <td class = "tit">포인트 사용여부</td>
                    <td>
                       <c:choose>
                          <c:when test="${data.pPoint eq 1}">
                           	사용가능
                          </c:when>
                          <c:when test="${data.pPoint eq 2}">
                       		      사용불가
                          </c:when>
                       </c:choose>
                    </td>
                 </tr>
                 
                 <tr style = "border-bottom:1px solid #ddd;">
                    <td class = "tit">남은상품수량</td>
                    <td>${data.pStock }</td>
                 </tr>
                 
                 <tr>
                    <td class = "tit">사이즈</td>
                    <td>
                       <select style="width:100%; height:30px;" id="item_1"  name="item_1" onchange="select()">
                        <option value ="">옵션선택</option>
                        <option value ="" disabled>사이즈 선택</option>
	                          <c:forEach var = "size" items = "${data.size }">
	                           <option>${size }</option>
	                          </c:forEach>
                        </select>
                     </td>
                 </tr>
                 
                 <tr>
                    <td class = "tit">컬러선택</td>
                    <td>
                       <select style="width:100%; height:30px;" id="item_2" name="item_2" onchange="select2()">
                           <option value="">컬러선택</option>
                           <c:forEach var = "rgb" items = "${data.rgb }">
                                 <c:set var="rgb_f" value="${rgb }" />
			                        <c:if test="${rgb_f eq 'rgb(255,0,0)' }">                        
			                                    <option>red</option>                                                
			                        </c:if>
			                        <c:if test="${rgb_f eq 'rgb(0,0,0)' }">                        
			                                    <option>black</option>                                                
			                        </c:if>
			                        <c:if test="${rgb_f eq 'rgb(0,0,255)' }">                        
			                                    <option>blue</option>                                                
			                        </c:if>
			                        <c:if test="${rgb_f eq 'rgb(255,255,0)' }">                        
			                                    <option>yellow</option>                                                
			                        </c:if>
			                        <c:if test="${rgb_f eq 'rgb(0,255,0)' }">                        
			                                    <option>green</option>                                                
			                        </c:if>
			                        <c:if test="${rgb_f eq 'rgb(0,128,255)' }">                        
			                                    <option>sky blue</option>                                                
			                        </c:if>
			                        <c:if test="${rgb_f eq 'rgb(255,128,0)' }">                        
			                                    <option>orange</option>                                                
			                        </c:if>
			                        <c:if test="${rgb_f eq 'rgb(192,192,192)' }">                        
			                                    <option>grey</option>                                                
			                        </c:if>
			                        <c:if test="${rgb_f eq 'rgb(255,255,255)' }">                        
			                                    <option>white</option>                                                
			                        </c:if>
			                        <c:if test="${rgb_f eq 'rgb(255,0,255)' }">                        
			                                    <option>pupple</option>                                                
			                        </c:if>
                           </c:forEach>
                       </select>
                    </td>
                 </tr>
                   <tr>
                    <td class = "tit">컬러 미리보기</td>
                    <td>
                       <div style="width:100%; height:30px;">   
                           <c:forEach var = "rgb" items = "${data.rgb }">
                                 
                                 <span style="background-color:${rgb}; border: 1px solid;width: 27px;display: inline-block; height:23px; margin-right:15px;"></span>
                                 <c:set var="rgb_f" value="${rgb }" />
                        
                           </c:forEach>
                       </div>
                    </td>
                   </tr>
           </table>
           
           
            <div id="mdmd">
               <div id='select_m'>
               
		       </div>
		         
		       <div id = 'tot'>
		       	 	<span>총 합계</span>
		       	 	<input type="text" id='price_s' value=0 readOnly/>원
		       </div>
		       
               <input type="button" class = "btnconts" id="csbtn" value="바로구매" style = "background-color: #c41e20; color:#fff; cursor: pointer;" onclick="buyClick(${data.pCode})"/>
               <input type="button" class = "btnconts" value='장바구니' onclick='btn_my()' style="cursor: pointer;"/>
                <c:choose>
                     <c:when test="${fn:length(data.likeList)>0 }">
                        <c:forEach var = "data1" items="${data.likeList }">
                           <c:if test="${data1 eq data.pCode }">
                              <input type="button" class = "btnconts" value='♡ 찜하기'  style = "background-color: #e44e4e; color:#fff;"/>
                              <c:set var="loop_flag" value="true" />
                           </c:if>
                        </c:forEach>
                        <c:if test="${loop_flag ne true}">
                           <input type="button" class = "btnconts" id="btnlike" value='♡ 찜하기' style="cursor: pointer;" />
                        </c:if>
                     </c:when>
                     
                     <c:when test = "${fn:length(data.likeList) eq 0 }">
                        <input type="button" class = "btnconts" id="btnlike" value='♡ 찜하기' style="cursor: pointer;" />                     
                     </c:when>
                  </c:choose>
                  
            </div>
            
            <c:if test="${sessionScope.user_id eq 'admin' }">
               <input type="button" id = "modifyBtn" value = "수정하기" onclick='modify_view()' style = "width: 494px;height: 53px;background-color: #fff;border:0;font-size: 17px;font-weight:bold;color:#888;line-height: 40px;border:1px solid #999;margin-top: 20px; cursor: pointer;"/>
            </c:if>
         </div>
            
   </div>
   
   
   
   <h3>상품상세정보</h3>
   <hr/>
            
            <div id='d4'>
               
               <p>${data.pContent }</p>
            
           
    		        
            </div>
            <div id="pop">
	            <div>
	               <img src="./css/images/cart_i.png" />
	               
	               <p>선택한 상품이 장바구니에 담겼습니다.</p>
	               
	               <div id = "cart_btns">
			            <input type = "button" id = "btn_re" value = "계속쇼핑하기" onclick = "re()" />
			            <input type = "button" id = "btn_cart" value = "장바구니가기" onclick = "btncart()"/>
		           </div>
	               
	            </div>
         </div>
</div>   
   
<script>
function imgEv(ev){
	   var a = document.getElementById("demo_a");
	   var demo = document.getElementById("demo_img");
	   var spzoom_image = document.getElementsByClassName("spzoom-image");
	   
	   var img = ev.srcElement;
	   var src = img.src;
	   a.setAttribute("href", src);
	   demo.setAttribute("src", src);
	   spzoom_image[0].setAttribute("src", src);
	   
	}
	
var customer_frm = document.frm;
var el = document.getElementById("btnlike");

function getId(id){
   return document.getElementById(id);
}

function buyClick(pCode) {
	  if($('#m_id').val() == null || $('#m_id').val() == ""){
		  if(confirm("로그인이 필요한 서비스입니다. 로그인 페이지로 이동하시겠습니까?")){
			  customer_frm.action = "index.jsp?content=go_login.mem";
			  customer_frm.submit();
		      }
	  }else{
		   if($("#item_2 option:selected").val() == "" || $("#item_2 option:selected").val() == null){
			   alert("옵션을 선택하지 않으셨습니다.\n옵션을 선택해주세요.");
		   }else{
			   var jaewook = document.getElementsByClassName("ea_ss");
	        	 var suyeon =0;
	        	 for(i=0; i<jaewook.length; i++){
	        		 suyeon += parseInt(jaewook[i].value);	        		 
	        	 }
			   $.ajax({
		    		  async : false,
		    		  url : "info.shop",
		    		  type : "post",
		    		  data : {"rId" : '${sessionScope.user_id}', "rCode" : pCode, "rEa" : suyeon},
		    		  success : function(data, status) {
				   		var hidden = document.getElementById("hidden");
				   		hidden.value=data;
				   		customer_frm.action = 'index.jsp?content=payout.pay';		   			
				   		customer_frm.submit();
					}
		    	  }
		    	);
		   }
	  }
}

function btn_my(){
	   if($('#m_id').val() == null || $('#m_id').val() == ""){   
		   if(confirm("로그인이 필요한 서비스입니다. 로그인 페이지로 이동하시겠습니까?")){
			  
			   customer_frm.action = "index.jsp?content=go_login.mem";
			   customer_frm.submit();
		      }
	   }else{
		   if($("#item_2 option:selected").val() == "" || $("#item_2 option:selected").val() == null){
	            alert("장바구니에 담을 상품을 선택해주세요.");
	         }else{
	        	 var jaewook = document.getElementsByClassName("ea_ss");
	        	 var suyeon =0;
	        	 for(i=0; i<jaewook.length; i++){
	        		 suyeon += parseInt(jaewook[i].value);	        		 
	        	 }
	            var jnj = {"cid":$('#m_id').val(), "ccode":$('#pCode').val(),
	                  "cname":$("#cName").val(), "cprice":$('#cPrice').val(),
	                  "cpromotion":$('#cPromotion').val(), "cpoint":$('#cPoint').val(),
	                  "cphoto":$('#attFileB').val(), "cea":suyeon};
	               $.ajax({
	                  async: false,
	                  url : "insert.trade",
	                  type : "get",
	                  dataType: "html",
	                  data : jnj,
	                  success: function(data, status) {
	                  if(data == "Y"){
	                        $('#pop').css("display","block");
	                        $('#relative').css("-webkit-filter", "blur(6px)");                     
	                  }else{
	                     alert("장바구니 오류발생");
	                  }
	               }
	               });            
	         }
	      }
	      
	   }
if($('#btnlike') != null){
	$("#btnlike").click(function(){
		   var pCode = $("#pCode").val();
		   var mId = $("#m_id").val();
		   
		   if(!mId){
		      if(confirm("로그인이 필요한 서비스입니다. 로그인 페이지로 이동하시겠습니까?")){
		    	  customer_frm.action = "index.jsp?content=go_login.mem";
		    	  customer_frm.submit();
		      }
		      return false;
		   }
		   
		   $.ajax({
		      async: false,
		      url: "likeAdd.shop",
		      type: "post",
		      dataType : "html",
		      data : {"pCode" : pCode, "mId" : mId},
		      success : function(data, status){
		         alert("관심상품에 등록되었습니다.");
		      }
		   });
		   
		   $("#btnlike").css("background-color", "#e44e4e");
		   $("#btnlike").css("color", "#fff");
	});	
}

	
function re(){
	   $('#pop').css("display","none");
	   $('#relative').css("-webkit-filter", "blur(0px)");
	}

function btncart(){
	   location.href="index.jsp?content=cart.trade";
	}

function modify_view(){
	location.href="index.jsp?content=modify_view.shop&pCode="+$('#pCode').val();
}

function clearcom(price) {
	return price.replace(/,/, "");
}

function for_commas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}  //정규화 

var btndel = document.getElementById("btndel");
var mdmd = document.getElementById("select_m");
var price_s = document.getElementById("price_s");
var sPrice = document.getElementById("sPrice");
var cnt=0;
var pPrice = document.getElementById("pPrice");
function up(cnt){
	var ea_s = document.getElementById("ea_s"+cnt);
	price_s.value = for_commas(parseInt(clearcom(price_s.value)) + parseInt(sPrice.value));
	ea_s.value = parseInt(ea_s.value)+1; 
	
}
function down(cnt){
	var ea_s = document.getElementById("ea_s"+cnt);
	if(ea_s.value == "1"){
		return;
	}
	price_s.value = for_commas(parseInt(clearcom(price_s.value)) - parseInt(sPrice.value));
	ea_s.value = parseInt(ea_s.value)-1; 
}

function del_c(ev,cnt){
	var ea_s = document.getElementById("ea_s"+cnt);
	price_s.value = for_commas(parseInt(clearcom(price_s.value)) - (parseInt(sPrice.value) * parseInt((ea_s).value)));
	var ele = ev.srcElement;
	var p = ele.parentNode;
	
	if(price_s.value == '0'){
		$('#tot').css("display","none");
	}
	mdmd.removeChild(p);
}
function select(){
	$('#item_2').attr('disabled',false);
}

 
function select2(){
	if(sPrice.value == "0" || sPrice.value == null){
		sPrice.value = cPrice.value;
	}
	if(price_s.value == "0" || price_s.value == null){
		price_s.value = for_commas(parseInt(price_s.value) + parseInt(sPrice.value));
	}else{
		price_s.value = for_commas(parseInt(clearcom(price_s.value)) + parseInt(sPrice.value));		
	}
	var select_m = document.getElementById("select_m");
	cnt++;
	var se = document.createElement('div');
	se.setAttribute("id","menu_cc"+cnt);
	var size =  $("#item_1 option:selected").val();
	var color = $('#item_2 option:selected').val();
	
	
	var item_1 = document.createElement('input');
	item_1.setAttribute("type","text");
	item_1.setAttribute("value",size);
	item_1.setAttribute("id","size_s");
	var item_2 = document.createElement('input');
	item_2.setAttribute("type","text");
	item_2.setAttribute("value",color)
	var item_3 = document.createElement('input');
	item_3.setAttribute("type","text");
	item_3.setAttribute("readOnly","readOnly");
	item_3.setAttribute("class", "ea_ss");
	item_3.setAttribute("id","ea_s"+cnt);
	
	item_3.setAttribute("value","1");
	item_3.setAttribute("min","1");
	var item_4 = document.createElement('input');
	item_4.setAttribute("type","button");
	item_4.setAttribute("id","btndel");
	item_4.setAttribute("value","x");
	item_4.setAttribute("onclick","del_c(event,"+cnt+")");
	var item_5 = document.createElement("hr");
	/* var item_1 = $("#item_1 option:selected").val();
	var item_2 = $('#item_2 option:selected').val(); */
	var item_6 = document.createElement("input");
	item_6.setAttribute("type","button");
	item_6.setAttribute("value","▲");
	item_6.setAttribute("id","up_s");
	item_6.setAttribute("onclick","up("+cnt+")");
	var item_7 = document.createElement("input");
	item_7.setAttribute("type","button");
	item_7.setAttribute("value","▼");
	item_7.setAttribute("id","down_s");
	item_7.setAttribute("onclick","down("+cnt+")");
	
	var sc = document.createTextNode("사이즈 : ");
	var sc2 = document.createTextNode("색상 : ");
	var sc3 = document. createTextNode("수량 : ");
	
	se.appendChild(sc);
	se.appendChild(item_1);
	se.appendChild(sc2); 
	se.appendChild(item_2);
	se.appendChild(sc3);
	se.appendChild(item_6);	
	se.appendChild(item_3);
	se.appendChild(item_7);
	se.appendChild(item_4);
	se.appendChild(item_5);
	select_m.appendChild(se); 
	
	$('#tot').css("display","block");
	
	
	  
}

</script>   
    <script type="text/javascript">
        $(function() {
            $('[data-spzoom]').spzoom();
        });
    </script>
   
</body>
</html>