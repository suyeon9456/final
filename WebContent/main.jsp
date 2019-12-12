<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="./css/main.css" type="text/css" rel="stylesheet"/>
<link href="./css/photo.css" type="text/css" rel="stylesheet" />
<script>
$(function() {
    $('#newproduct').booklet({
        width:  '80%',
        height: 700,
        pageNumbers : false,
        easing:  null,
        easeIn:  null,
        easeOut: null,
       keyboard : true,
       tabs:  true,
       tabWidth:  180,
       tabHeight:  20
    });

});
   </script>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
   <div id='slideSize'>
      <%@include file="slide.jsp" %>
   </div>
   
   <h2><span>NEW</span> ARRIVAL</h2>
      <div id="newcover">
         <div id="newproduct">
            <div class="page">
            <br/>
            <br/>
            <br/>
            <br/>   
              <img src="http://img.ssfshop.com/display/html/STRND/20191018/BPS_191016_AC01.jpg" style="max-width: 100%; width: auto !important; height : auto !important;"/>
            </div>
            <div class="page">
            <div>
            <iframe width="640" height="300" src="https://www.youtube.com/embed/2oScvid2c58" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
            
            </div>
            
            <div>
             <img src="http://img.ssfshop.com/goods/BPBR/19/09/24/GM0019092460231_1_ORGINL.jpg" style="max-width: 100% width : 200px; height :200px;"/>
            <img src="http://img.ssfshop.com/cmd/LB_500x660/src/http://img.ssfshop.com/goods/BPBR/19/09/24/GM0019092460231_2_ORGINL.jpg"style="max-width: 100% width : 200px; height :200px;"/>
            <img src="http://img.ssfshop.com/cmd/LB_500x660/src/http://img.ssfshop.com/goods/BPBR/19/09/24/GM0019092460231_3_ORGINL.jpg"style="max-width: 100% width : 200px; height :200px;"/>
            <img src="http://img.ssfshop.com/cmd/LB_500x660/src/http://img.ssfshop.com/goods/BPBR/19/09/24/GM0019092460231_4_ORGINL.jpg"style="max-width: 100% width : 200px; height :200px;"/>
            </div>
            <div>
            
            <span class="product_text" style="font-size : 1.2em; margin-left : 50px;" >19FW [올라운더] 카키 여성 보아 구스 쇼트 다운 점퍼</span><br/><br/>
                <span class="product_price" >420,000(20%할인 =>) 336,000 </span><br/><br/><br/>
                <span class="product_more_info" style="margin-left : 50px;">453 Reviews, 멤버십포인트 18,000p 적립</span>

            </div>
            </div>
            
         <div class="page">
               <img src="http://www.elandrs.com/upload/dspl/banner/10/824/00/191000000157824.jpg" style = "width: 100%; height: 100%;"/>
               <br/><br/><br/><br/>
               <img src="http://www.elandrs.com/upload/dspl/banner/90/851/00/191100000158851.jpg" style = "width: 100%; height: 100%;"/>
               <br/><br/><br/><br/>
               <img src="http://www.elandrs.com/upload/dspl/banner/90/642/00/191100000158642.jpg" style = "width: 100%; height: 100%;"/>
            </div>
            
            <div class="page">
               <img src="http://www.elandrs.com/upload/dspl/banner/10/973/00/191100000157973.jpg" style = "max-width: 100%; height: 100%;"/>
            </div>
            
            <div class="page">
               <img src="http://www.elandrs.com/upload/dspl/banner/10/518/00/191100000158518.jpg" style = "max-width: 100%; height: 100%;"/>
            </div>
            
            <div class="page">
               <img src="http://www.elandrs.com/upload/dspl/banner/10/765/00/191000000155765.jpg" style = "max-width: 100%; height: 100%;"/>
            </div>
            
         </div>
         </div>
         
   <h2 id="h2middle">
      BEST <span>APPAREL</span>
   </h2>


   <div id="bestproduct">
      <div class="b_1">
         <div class="photo" onclick="sival('${vo.pCode}')" style="cursor: pointer;">
            <div class="p_photo1">
               <img src="./supload/${vo.attFileB }"
                  style="max-width: 100%; width: 100%; height: 100%;" />
            </div>
            <div class = "su_info1">
               <div class = "p_color_box">
                  <c:forEach var="rgbColor" items="${vo.rgb }">
                     <span class ="p_color" style="background-color: ${rgbColor};"></span>
                  </c:forEach>
               </div>
               <div class="p_name">${vo.pName }</div>
               <div class="p_price">${vo.pPrice }</div>
            </div>
         </div>

      </div>

      <c:forEach var="data" items='${list }'>
         <div class="b_2">
            <div class="photo" onclick="sival('${data.pCode}')" style="cursor: pointer;">
               <div class="p_photo2">
                  <img src="./supload/${data.attFileB }" width="100%" height="100%" />
               </div>
               <div class = "su_info1">
                  <div class = "p_color_box">
                     <c:forEach var="rgbColor" items="${data.rgb }">
                        <span class ="p_color" style="background-color: ${rgbColor};"></span>
                     </c:forEach>
                  </div>
                  <div class="p_name">${data.pName }</div>
                  <div class="p_price">${data.pPrice }</div>
               </div>
            </div>
         </div>
      </c:forEach>

   </div>

   <h2 id="h2last">
      <span>COMMON</span> APPAREL
   </h2>
   <div id="commonproduct">
      <c:forEach var="data" items='${listR }'>
         <div class="b_3" onclick="sival('${data.pCode}')" style="cursor: pointer;">
            <div class="photo">
               <div class="p_photo3">
                  <img src="./supload/${data.attFileB }" width="100%" height="100%" />
               </div>
               <div class = "p_color_box">
                     <c:forEach var="rgbColor" items="${data.rgb }">
                        <span class ="p_color" style="background-color: ${rgbColor};"></span>
                     </c:forEach>
                  </div>
               <div class="p_name">${data.pName }</div>
               <div class="p_price">${data.pPrice }</div>
            </div>

         </div>
      </c:forEach>


   </div>

   <script>
      
   </script>
<script>
function sival(code) {
   location.href = "index.jsp?content=view.shop&pCode="+code;
}
</script>
</body>
</html>