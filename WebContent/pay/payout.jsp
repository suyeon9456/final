<%@page import="java.util.List"%>
<%@page import="java.lang.reflect.Type"%>

<%@page import="com.google.gson.reflect.TypeToken"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.google.gson.JsonArray"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.JsonParser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href = "./css/payout.css" type = "text/css" rel = "stylesheet" />

<%
 String Json = request.getParameter("paylist");
  Gson gson = new Gson();
  Type listType = new TypeToken<List<Object>>(){}.getType();
  List<Object> json =gson.fromJson(Json, listType);
  request.setAttribute("paylist", json);
  System.out.println(json+"스크립틀릿 영역");
  
%>
</head>
<style>

</style>
<script src="./lib/jquery-3.4.1.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<body>
<div id="Payout">
   <form id="frm_payout" name="frm_payout" method="POST">
      <div id="payinfo"></div>
      <h2>구매목록</h2>
         <div id="paylist">
            <div id="paylist_header">
               <span class="serial">번호</span> 
               <span class="item_code">코드</span> 
               <span class="item_name">이름</span>
               <span class="item_price">가격</span> 
               <span class="item_ea">개수</span>
               <span class="promotion">할인</span> 
               <span class="point">포인트</span> 
               <span class="cal_price">총가격</span>
            </div>
            
          <div class="datalist">
                  <%
                     int a =0; int b=1; int u=0; int k=0;
                  %>     
               <c:forEach var ='data' items='${paylist }'>
                  <div class="paylist_data" id="list<%=a++%>">
                     <span class="serial"><%=b++%></span> 
                     <span class="item_code">${data.item_code}</span> 
                     <span class="item_name">${data.item_name }</span> 
                     <span class="item_price">${data.item_price }</span>
                        
                     <div class="item_ea">
                           <input type="button" class="up" onclick="$.fn.change(<%=u++ %>,1);" value="▲"/>
                           <span class="ea">${data.ea }</span>
                          <input type="button" class="down" onclick="$.fn.change(<%=k++ %>,-1);" value="▼"/>
                     </div>
                     
                     <span class="promotion">${data.promote }</span> 
                     <span class="point">${data.point }</span> 
                     <span class="cal_price"></span>
                  </div>
               </c:forEach>
               
            <input type="hidden" id="json" name="json" value=""/>
           </div>
         </div>
               
         
         <div id="paylocation">
            <div class = "hh3">배송지 설정</div>
                <div id="receiver">
                   <div id = "receiver_su">
                     <label>받 는 분 </label> <input type="text" name="user_name"/><br/>
                     <label>연 락 처 </label> <input type="text" name="phone"/><br/>
                    <label>우편번호</label> <input type="text" name="postal" id="postal" style = "width: 243px;" readOnly/>
                     <input type="button" value="주소찾기" name = "btnZip"/><br/>
                     <label>주  &nbsp; &nbsp; 소</label><input type="text" name="address" id="address" readOnly /><br/>   
                     <label>상세주소</label><input type="text" name="addressatt" id="addressatt" onchange="map_change();"/><br/> 
                   </div>
                </div>
                
<!--                <div id="receiver_box"></div> -->
               
<!--                <div id="daumpostal" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative; margin-top : 400px; "> -->
<!--                <img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼"> -->
<!--             </div> -->
       </div>
   
       <div class = "hh3">결제수단 선택</div>
   
       <div class="purchase">
           <div id="payment">
             <span class="pay_method" onclick='info("0")'>무통장 입금</span>
             <span class="pay_method" onclick='info("1")'>카카오페이</span>
            
            <div class="payment_info">
               <div id = "payment_info_cont">
                     <div class = "hh4">계좌이체 결제안내입니다.</div>
                     <div id = "pay_num">
                        <div id = "pay_num_table">
                           <span class = "pay_bank_tit">입금은행</span><span class = "pay_bank_cont">국민은행</span><br/>
                           <span class = "pay_bank_tit">계좌번호</span><span class = "pay_bank_cont">123456-02-123456</span><br/>
                           <span class = "pay_bank_tit">예금주</span><span class = "pay_bank_cont">김승현</span>
                        </div>
                     </div>
               </div>
            </div>
            
            <div class="payment_info"></div>
            
         </div>
   
         <input type="hidden" id="hidden" name="paylist" value=${param.paylist } />
         
         <div id="payment_2">
            <div id = "payment_2_su">
               <span>상품 총 금액<input type="text" name="price" value="0" readOnly ></span>   
               <span class = "cntt">+</span> 
               <span>총 배송비<input type="text" name="delieve" value="0" readOnly/></span>   
               <span class = "cntt">-</span>
               <span>총 할인금액<input type="text" name="promotion" value="0"readOnly/></span>
               <span class = "cntt">=</span>
               <span>총 주문금액<input type="text" name="total_price" value="0"readOnly/></span>
            </div>
         </div>
      </div>
   
      <div class = "hh3">약관동의</div>
      
      <div id="agreement">
       
         <div id="agree1">
            <textarea class="ta" readOnly>제2장 이용계약 및 정보보호
            제7조 (구매 서비스 이용계약의 성립)
            1. 구매 서비스 이용계약(이하 "이용계약"이라고 합니다)은 회사가 제공하는 구매 서비스를 이용하고자 하는 자의 이용신청에 대하여 회사가 이를 승낙함으로써 성립합니다. 회사는 이용승낙의 의사표시를 해당 서비스화면에 게시하거나 email 또는 기타 방법으로 통지합니다.
            2. 구매 서비스를 이용하고자 하는 자는 이 약관에 동의하고 , 회사가 정하는 회원 가입 신청 양식에 따라 필요한 사항을 기입합니다.
            3. 회원가입은 만 14세 이상의 개인 또는 사업자(개인사업자 및 법인사업자)가 할 수 있으며, 이용신청자는 실명으로 가입신청을 해야 하며, 실명이 아니거나 타인의 정보를 도용하는 경우 서비스이용이 제한되거나 관련 법령에 의거 처벌받을 수 있습니다.
            4. 이용신청의 처리는 신청순서에 의하며, 회원가입의 성립시기는 회사의 승낙이 회원에게 도달한 시점으로 합니다.
            5. 회사는 다음과 같은 사유가 발생한 경우 이용신청에 대한 승낙을 거부하거나 유보할 수 있습니다.
            1) 회사의 실명확인절차에서 실명가입신청이 아님이 확인된 경우
            2) 이미 가입된 회원과 이름 및 주민등록번호(또는 사업자등록번호)가 동일한 경우
            3) 회사에 의하여 이용계약이 해지된 날로부터 2개월 이내에 재이용신청을 하는 경우
            4) 회사로부터 회원자격 정지 조치 등을 받은 회원이 그 조치기간 중에 이용계약을 임의 해지하고 재이용신청을 하는 경우
            5) 설비에 여유가 없거나 기술상 지장이 있는 경우
            6) 기타 이 약관에 위배되거나 위법 또는 부당한 이용신청임이 확인된 경우 및 회사가 합리적인 판단에 의하여 필요하다고 인정하는 경우</textarea>
         </div>
      
          <div class = "agree_check">
             <input type="checkbox" name="mustagree"/>
             <span>구매동의(필수)</span>
          </div>
      
         <div id="agree2">
            <textarea class="ta" readOnly>
            제8조 (개인정보의 변경, 보호)
            1. 회원은 이용신청 시 허위의 정보를 제공하여서는 아니 되며, 기재한 사항이 변경되었을 경우에는 즉시 변경사항을 최신의 정보로 수정하여야 합니다. 이름, ID, 주민등록번호 등은 수정할 수 없으나 법령에 의한 경우는 예외적으로 수정 가능합니다.
            2. 회사의 회원에 대한 통지는 회원이 제공한 주소 또는 e-mail주소에 도달함으로써 통지된 것으로 보며, 수정하지 않은 정보로 인하여 발생하는 손해는 당해 회원이 전적으로 부담하며, 회사는 이에 대하여 아무런 책임을 지지 않습니다.
            3. 회사는 이용계약을 위하여 회원이 제공한 정보를 회원이 동의한 회사 서비스 운영을 위한 목적 이외의 용도로 사용할 수 없으며, 새로운 이용목적이 발생한 경우 또는 제3자에게 제공하는 경우에는 이용·제공단계에서 당해 회원에게 그 목적을 고지하고 동의를 받습니다. 다만, 관련 법령에 달리 정함이 있는 경우에는 예외로 합니다.
            4. 회사는 개인정보의 수집·이용·제공에 관한 동의란을 미리 선택한 것으로 설정해두지 않습니다. 또한 개인정보의 수집·이용·제공에 관한 이용자의 동의거절시 제한되는 서비스를 구체적으로 명시하고, 필수수집항목이 아닌 개인정보의 수집·이용·제공에 관한 구매서비스를 이용하고자 하는 자의 동의 거절을 이유로 회원가입 등 서비스 제공을 제한하거나 거절하지 않습니다.
            5. 회사는 회원의 개인정보를 보호하기 위해 제3자에게 구매회원의 개인정보를 제공할 필요가 있는 경우에는 실제 청약시에 제공되는 개인정보 항목, 제공받는 자, 제공받는 자의 개인정보 이용목적 및 보유·이용기간 등을 명시하여 구매회원의 동의를 받고, 개인정보를 위탁하는 경우에는 관련 법령이 정하는 바에 따라 "개인정보처리방침"을 수립하고 개인정보 보호 책임자를 지정하여 이를 게시하고 운영합니다.
            </textarea>
         </div>
         
          <div class = "agree_check">
             <input type="checkbox" name="subagree">
             <span>주소정보 수집 및 이용 동의</span>
          </div>
          
         <div style = "text-align: center;">
            <input type="button" name="pay" id="realpay" value="결제하기" onClick="pay()"/>
         </div>
         
      </div>
   </form>
</div>

<script>
const d = new Date();
var time = d.getTime()+"";
var serial = time.substring(5);
var delter = 1; //초기값
$(document).ready(function(){
     
   $.fn.total_cal();   
   $.fn.listcal();
   });


function info(index){
   console.log(index);
   if(index == 1 || index=="1"){
      //카카오페이로 변경
      delter =2;
   }
   
   var payment_method = document.getElementsByClassName("pay_method");
   var payment_info = document.getElementsByClassName("payment_info");
   
   for(var i=0; i<payment_method.length; i++){
      payment_method[i].style.background ="white";
      payment_method[i].style.color ="black";
      payment_info[i].style.display = "none";
      
   }
   
   payment_method[index].style.background ="#e44e4e";
   payment_method[index].style.color ="#fff";
   payment_info[index].style.display = "block";
   console.log(delter);
   console.log(serial);
}

var frm = document.frm_payout
var hidden = document.getElementById("hidden");
var item_code = document.getElementsByClassName("item_code");
var pay = document.getElementById("realpay");

var tb = document.getElementsByClassName("tb");

pay.addEventListener("click",btn_pay,false);


function btn_pay(){

   var list =document.getElementsByClassName("paylist_data");
   var item_code = document.getElementsByClassName("item_code");
   var item_price =document.getElementsByClassName("item_price");
   var item_name =document.getElementsByClassName("item_name");
   var item_ea =document.getElementsByClassName("ea");
   var item_promotion =document.getElementsByClassName("promotion");
   var item_afprice =document.getElementsByClassName("cal_price");

   var js_save = new Array();
   
      for(var i=0; i<list.length; i++){
   			var js_save_in = new Object();
           js_save_in['serial'] = serial;
           js_save_in['user_id'] = '${sessionScope.user_id}';
             js_save_in['item_code'] = item_code[i+1].innerHTML;
           js_save_in['item_name'] = item_name[i+1].innerHTML;
            js_save_in['item_ea'] = item_ea[i].innerHTML;
           js_save_in['item_price'] = item_price[i+1].innerHTML;
            js_save_in['promote'] = item_promotion[i+1].innerHTML; 
            js_save_in['cal_price'] = item_afprice[i+1].innerHTML;
           js_save_in['delter'] = delter;
            js_save.push(js_save_in);
      }
   
    var json_save = JSON.stringify(js_save);
    var json = document.getElementById("json");
    json.value = json_save;
    
    if(delter ==1 || delter == '1'){
       //무통장 입금
       frm.action = 'index.jsp?content=realpay.pay'; 
       if(confirm("무통장 결제를 하시겠습니까?")){
          frm.submit();    
       }else{
          return false;
       }
       
    }else{
       //카카오페이
       frm.action = 'kakaopay.pay';
       if(confirm("카카오페이 결제를 하시겠습니까?")){
          frm.submit();          
       }else{
          return false;
       }
    }   
   
}



/* var mapContainer = document.getElementById('receiver_box'), // 지도를 표시할 div
mapOption = {
    center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
    level: 4 // 지도의 확대 레벨
};

//지도를 미리 생성
var map = new daum.maps.Map(mapContainer, mapOption);
//주소-좌표 변환 객체를 생성
var geocoder = new daum.maps.services.Geocoder();
//마커를 미리 생성
var marker = new daum.maps.Marker({
   position: new daum.maps.LatLng(37.537187, 127.005476),
   map: map
});

$(document).ready(function(){

   $.fn.total_cal();
   $.fn.listcal();
    

});

*/




/* var element_wrap = document.getElementById('daumpostal');

function foldDaumPostcode() {
    // iframe을 넣은 element를 안보이게 한다.
    element_wrap.style.display = 'none';
}

function execDaumPostcode() {
           // 현재 scroll 위치를 저장해놓는다.
           var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
           new daum.Postcode({
               oncomplete: function(data) {
                   // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                   // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                   // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                   var addr = data.address; // 주소 최종변수
                   var extraAddr = ''; // 참고항목 변수
                   document.getElementById("address").value = addr;// 변수넣은다음
                   
                   geocoder.addressSearch(data.address, function(results, status){
                      if(status === daum.maps.services.Status.OK){
                         var result = results[0];
                          var coords = new daum.maps.LatLng(result.y, result.x);
                            // 지도를 보여준다.
                            mapContainer.style.display = "block";
                            map.relayout();
                            // 지도 중심을 변경한다.
                            map.setCenter(coords);
                            // 마커를 결과값으로 받은 위치로 옮긴다.
                            marker.setPosition(coords)
                        }
                    });
                         
                                  
                   
                   //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                   if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                       addr = data.roadAddress;
                   } else { // 사용자가 지번 주소를 선택했을 경우(J)
                       addr = data.jibunAddress;
                   }

                   // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                   if(data.userSelectedType === 'R'){
                       // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                       // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                       if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                           extraAddr += data.bname;
                       }
                       // 건물명이 있고, 공동주택일 경우 추가한다.
                       if(data.buildingName !== '' && data.apartment === 'Y'){
                           extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                       }
                       // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                       if(extraAddr !== ''){
                           extraAddr = ' (' + extraAddr + ')';
                       }
                       // 조합된 참고항목을 해당 필드에 넣는다.
                       document.getElementById("addressatt").value = extraAddr;
                   
                   } else {
                       document.getElementById("addressatt").value = '';
                   }

                   // 우편번호와 주소 정보를 해당 필드에 넣는다.
                   document.getElementById('postal').value = data.zonecode;
                   document.getElementById("address").value = addr;
                   // 커서를 상세주소 필드로 이동한다.
                   document.getElementById("addressatt").focus();

                   // iframe을 넣은 element를 안보이게 한다.
                   // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                   element_wrap.style.display = 'none';

                   // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                   document.body.scrollTop = currentScroll;
               },
               // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
               onresize : function(size) {
                   element_wrap.style.height = size.height+'px';
               },
               width : '100%',
               height : '100%'
           }).embed(element_wrap);

           // iframe을 넣은 element를 보이게 한다.
           element_wrap.style.display = 'block';
       }
   
   */



$.fn.total_cal = function(){
   
var tprice = 0;
var tpromotion= 0;
var tpoint = 0;
var tsale = 0;
   for(i=1; i<=$('.paylist_data').length; i++){
       
       var price = Number($('.item_price')[i].innerHTML);
       var promotion =Number($('.promotion')[i].innerHTML);

        var ea =Number($('.ea')[i-1].innerHTML);
        var cal_price = (price *(100-promotion)/100)*ea

    tprice  += price*ea;  // 2*2
    tpromotion += price*promotion*ea*0.01;

    
     
   }
    tsale = tpromotion ;
    
    $("input[name=price]").val( $.fn.for_commas(tprice));
    $("input[name=promotion]").val( $.fn.for_commas(tsale));
    $("input[name=total_price]").val( $.fn.for_commas(tprice-tsale)); 
}



$.fn.change =function(index,num){
      
      var y= Number($('.ea')[index].innerHTML)+num;

      if(y<1) y=1;
      $('.ea')[index].innerHTML =y;
       $.fn.listcal();
       $.fn.total_cal();
      }


$.fn.for_commas = function(x){
   
   return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

$.fn.listcal = function(){
   
 for(i=1; i<=$('.paylist_data').length; i++){
    
    var price = Number($('.item_price')[i].innerHTML);
    var promotion =Number($('.promotion')[i].innerHTML);

     var ea =Number($('.ea')[i-1].innerHTML);
     var cal_price = (price *(100-promotion)/100)*ea;

     $('.cal_price')[i].innerHTML =    $.fn.for_commas(cal_price);
     
 
 }



}

$('#agree1').click(function(){
   
   $.fn.listcal();

   
});

//우편번호 검색 
frm.btnZip.onclick = function(){
   new daum.Postcode({
      oncomplete : function(data){
         frm.postal.value = data.zonecode;
         frm.address.value = data.address;
      }
   }).open();
}


</script>
</body>
</html>