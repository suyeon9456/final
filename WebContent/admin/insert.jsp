<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="./smallImage/board.js"></script>
<link href="./smallImage/board.css" type="text/css" rel="stylesheet" />
<link href="./css/menu.css" type="text/css" rel="stylesheet" />
<style>
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothiccoding.css);
#relative {
   margin-top:50px;
   width: 1000px;
   height: auto;
   margin-left: 25%;
    display: flex;
}
#relative input::placeholder {
  color: red;
  font-style: bold;
}

#relative input[type="text"]{
font-size:20px;
border:0;
border-bottom: 1px solid #ccc;
}
#relative input[type="number"]{
font-size:20px;
border:0;
border-bottom: 1px solid #ccc;
}
#relative input[type="radio"]{
margin:6px;
}
#pSize{
margin:6px;
}
#relative #d1 {
   width: 50%;
   height:40%;
}

#relative #d2 {
   width: 101%;
   border:1px solid #aaaaaa;
}
#d4{
border:1px solid #aaaaaa;
font-size:20px;
margin-left:60px;
margin-top:30px;
}

#smart_e{
margin-left:25%;
}

#textContent{
margin-left:25%;
margin-top:5%;
}

#ininser{
text-align:center;
margin-left:100px;
}

#coupon {
   text-align: center;
}

#d4 #category #kind #woman {
   display: none;
}

#price #ss {
   display: none;
}

#d4 #category #kind #top {
   display: none;
}

#d4 #category #kind #bottom {
   display: none;
}

#d4 #category #kind #shoes {
   display: none;
}

#d4 #category #kind #acc {
   display: none;
}

#d4 #category #kind #Wdress {
   display: none;
}

#d4 #category #kind #Wblothes {
   display: none;
}

#d4 #category #kind #Wshoes {
   display: none;
}

#d4 #category #kind #Wacc {
   display: none;
}

#sli{
display:none;
}
#footer{
margin-top:1000px;
}
 
#d4 #textAreaContent{
height:340px;
}
#color{
text-align:left;
}
#color .c_color{
display:inline-block;
border:1px solid #000000;
width:13px;
height:13px;

}

/* 파일 업로드 css */
.filebox input[type="file"] { position: absolute; width: 1px; height: 1px; padding: 0; margin: -1px; overflow: hidden; clip:rect(0,0,0,0); border: 0; } 
.filebox label { display: inline-block; padding: .5em .75em; color: #999; font-size: inherit; line-height: normal; vertical-align: middle; background-color: #fdfdfd; cursor: pointer; border: 1px solid #ebebeb; border-bottom-color: #e2e2e2; border-radius: .25em; margin-right : 3%; float: left;}
 
/* named upload */ 
.filebox .upload-name { display: inline-block; padding: .5em .75em; 
/* label의 패딩값과 일치 */ font-size: inherit; font-family: inherit; line-height: normal; vertical-align: middle; background-color: #f5f5f5; border: 1px solid #ebebeb; border-bottom-color: #e2e2e2; border-radius: .25em; -webkit-appearance: none; 
/* 네이티브 외형 감추기 */ -moz-appearance: none; appearance: none;}

</style>
</head>
<body>
   

<!--    <form name='smallimage' method='post' enctype='multipart/form-data'>
      <div id='d2'>
            <div id='attfile' name='attfile'></div>
      </div>
      <input type='button' id='btn_small'  value='저장'/>
   </form> -->
   
   <form id='product' name='product' method='post' enctype='multipart/form-data'>
      <div id='relative'>
         <div id='d1'>
            <div class="filebox" style = "margin-bottom: 15px;"> 
               <input class="upload-name" value="파일선택" disabled="disabled"> <label for="ex_filename">업로드</label> 
               <input type="file" id="ex_filename" name = "attFileB" class="upload-hidden"> 
            </div>
             <img src="./mem_images/nullImage.png" name='img_b' id='img_b' width='504px' height='550px' border='1px'>
         <div id='d2'>
            <div id='attfile'></div>
         </div>
         </div>


         <div id='d4' style = "border-style : none;">
            
               
               <div id='category' style = "margin-bottom: 25px; margin-top: 25px;">
               
                  <div style="background-color: white; color:#888; font-family: Nanum Gothic Coding, serif; padding: 5px; border : 1px solid lightgray; border-radius: 5px 5px 5px 5px;">성별</div>
                  
                   남<input type='radio' value='1' name='Tgender' onclick='ge(this.value)' checked='checked' />
                   여<input type='radio' value='2' name='Tgender' onclick='ge(this.value)' style = "margin-bottom: 25px; margin-top: 20px;" />
                   
                  <p />
                  <div id='kind'>
                     <ul id='man'>
                        <div style="background-color: white; border : 1px solid lightgray; padding: 5px; color:#888;  font-family: Nanum Gothic Coding, serif; border-radius: 5px 5px 5px 5px; ">대분류</div>
                        
                         Outter<input type='radio' name='Tbig' value='10' onclick='gf(this.value)' checked='checked' />
                         Top<input type='radio' name='Tbig' value='11' onclick='gf(this.value)' />
                         Bottom<input type='radio' name='Tbig' value='12' onclick='gf(this.value)' />
                         Shoes<input type='radio' name='Tbig' value='13' onclick='gf(this.value)' />
                         Acc<input type='radio' name='Tbig' value='14'onclick='gf(this.value)' style = "margin-bottom: 25px;  margin-top: 20px;"  />
                        <p />
                        <div style="background-color: white; border : 1px solid lightgray; padding: 5px; color:#888;  font-family: Nanum Gothic Coding, serif; border-radius: 5px 5px 5px 5px; ">소분류</div>
                        
                        <div id='outter'>
                           레더자켓<input type='radio' name='Tsmall' value='1' checked='checked' style = " margin-top: 20px;" />
                           코트<input type='radio' name='Tsmall' value='2' />
                           패딩<input type='radio' name='Tsmall' value='3' />
                        </div>
                        <div id='top'>
                           셔츠<input type='radio' name='Tsmall' value='1' />맨투맨<input
                              type='radio' name='Tsmall' value='2' />티셔츠<input type='radio'
                              name='Tsmall' value='3' />
                        </div>
                        <div id='bottom'>
                           청바지<input type='radio' name='Tsmall' value=1 />슬렉스<input
                              type='radio' name='Tsmall' value='2' />반바지<input type='radio'
                              name='Tsmall' value='3' />
                        </div>
                        <div id='shoes'>
                           구두<input type='radio' name='Tsmall' value='1' />스니커즈<input
                              type='radio' name='Tsmall' value='2' />
                        </div>
                        <div id='acc'>
                           지갑<input type='radio' name='Tsmall' value='1' />시계<input
                              type='radio' name='Tsmall' value='2' />
                        </div>
                     </ul>

                     <ul id='woman'>
                        <div style="background-color: white; border : 1px solid lightgray; color:#888; padding: 5px; font-family: Nanum Gothic Coding, serif; border-radius: 5px 5px 5px 5px; ">대분류</div>
                        
                        Top<input type='radio' name='Tbig' value='20' onclick='gg(this.value)' />Dress/Skirt
                        <input type='radio' name='Tbig' value='21'
                           onclick='gg(this.value)' />Blothes
                        <input type='radio' name='Tbig' value='22'
                           onclick='gg(this.value)' />Shoes&Bag
                        <input type='radio' name='Tbig' value='23'
                           onclick='gg(this.value)' />Acc
                        <input type='radio' name='Tbig' value='24'
                           onclick='gg(this.value)' />
                        <p />
                        <hr />
                        <div style="background-color: white; border : 1px solid lightgray; color:#888;  padding: 5px; font-family: Nanum Gothic Coding, serif; border-radius: 5px 5px 5px 5px; ">소분류</div>
                        <div id='Wtop'>
                           니트<input type='radio' name='Tsmall' value='1' />티<input
                              type='radio' name='Tsmall' value='2' />맨투맨<input type='radio'
                              name='Tsmall' value='3' />후드티<input type='radio' name='Tsmall'
                              value='4' />
                        </div>
                        <div id='Wdress'>
                           원피스<input type='radio' name='Tsmall' value='1' />스커트<input
                              type='radio' name='Tsmall' value='2' />
                        </div>
                        <div id='Wblothes'>
                           블라우스<input type='radio' name='Tsmall' value=1 />셔츠<input
                              type='radio' name='Tsmall' value='2' />
                        </div>
                        <div id='Wshoes'>
                           신발<input type='radio' name='Tsmall' value='1' />가방<input
                              type='radio' name='Tsmall' value='2' />
                        </div>
                        <div id='Wacc'>
                           브로칭<input type='radio' name='Tsmall' value='1' />ETC<input
                              type='radio' name='Tsmall' value='2' />
                        </div>
                     </ul>

                     <input type='hidden' id='pCode' name='pCode' />

                  </div>

               </div>
               
            
            <div id="price" style = "margin-bottom: 15px;">
            <div style="background-color: white;  border : 1px solid lightgray; color:#888;  margin-bottom: 15px; padding: 5px; font-family: Nanum Gothic Coding, serif; border-radius: 5px 5px 5px 5px; ">상품정보</div>
               <span style="margin-right:65px">품명   </span><input type='text' name='pName' id='pName'/>
               <br /> 
               <span style="margin-right:24px">해시태그  </span><input type='text' name='hashTag' id='hashTag'/><br />
               <ul>
                  <li><span style="margin-right:25px">판매가격</span> <input type='number' id='pPrice' name='pPrice'/>
                  </li> 
                  <span style="margin-right:20px">할인여부 </span>
              		   예<input type='radio' value='1' name='Psaleck' onclick='sa(this.value)' />
                	  아니오<input type='radio' value='2' name='Psaleck' onclick='sa(this.value)' checked='checked' />
                  <br />
                  <div id='ss'>
                     <span style="margin-right:41px">할인율 </span> <input type='number' style='width: 40px' id='pp' name='pPromotion' value='0'/>%
                     <li><span style="margin-right:42px">세일가</span> <input type='text' id='sPrice' name='pSale' value='0' /></li>
                  </div>
                  <span style="margin-right:41px">적립금</span>
                  가능<input type='radio' name='pPoint' value='1'/>불가능<input type='radio' name='pPoint' value='2'/>
                  <li><span style="margin-right:24px">재고수량</span> <input type='number' name='pStock' id='pStock'></li>
               </ul>
               <span style="margin-right:44px">사이즈</span>   
                  S<input type='checkbox' name='pSize_o' id='pSize_o' value="S"/>
                  M<input type='checkbox' name='pSize_o' id='pSize_o' value="M"/>
                  L<input type='checkbox' name='pSize_o' id='pSize_o' value="L"/>
                  XL<input type='checkbox' name='pSize_o' id='pSize_o' value="XL"/>
                  <input type="hidden" id="pSize" name="pSize"/>
            </div>

   
                           
            <br />
                  <div id='color' style = "margin-bottom: 25px;">
                  <div style="background-color: white; border : 1px solid lightgray; color:#888;  margin-bottom: 15px; padding: 5px; font-family: Nanum Gothic Coding, serif; border-radius: 5px 5px 5px 5px; ">색상 선택</div>
                  
                        <label style="margin-right:53px">RED     </label> <sapn class='c_color' style="background : rgb(255,0,0)" ></sapn>       -<input type="checkbox" name="color" value="rgb(255,0,0)" /><br/>
                        <label style="margin-right:31px">BLACK   </label> <sapn class='c_color' style="background : rgb(0,0,0)" ></sapn>       -<input type="checkbox" name="color" value="rgb(0,0,0)" /><br/>
                        <label style="margin-right:44px">BLUE    </label> <sapn class='c_color' style="background : rgb(0,0,255)" ></sapn>      -<input type="checkbox" name="color" value="rgb(0,0,255)" /><br/>
                        <label style="margin-right:15px">YELLOW  </label> <sapn class='c_color' style="background : rgb(255,255,0)" ></sapn>     -<input type="checkbox"name="color"  value="rgb(255,255,0)" /><br/>
                       <label style="margin-right:28px">GREEN   </label> <sapn class='c_color' style="background : rgb(0,255,0)" ></sapn>     -<input type="checkbox" name="color" value="rgb(0,255,0)" /> <br/>
                        <label style="margin-right:10px">SKYBLUE </label> <sapn class='c_color' style="background : rgb(0,128,255)" ></sapn>     -<input type="checkbox" name="color" value="rgb(0,128,255)" /> <br/>
                        <label style="margin-right:10px">ORANGE  </label> <sapn class='c_color' style="background : rgb(255,128,0)" ></sapn>     -<input type="checkbox" name="color" value="rgb(255,128,0)" /><br/>
                        <label style="margin-right:42px">GREY    </label> <sapn class='c_color' style="background : rgb(192,192,192)" ></sapn>        -<input type="checkbox" name="color" value="rgb(192,192,192)" /><br/> 
                        <label style="margin-right:30px">WHITE   </label> <sapn class='c_color' style="background : rgb(255,255,255)" ></sapn>       -<input type="checkbox" name="color" value="rgb(255,255,255)" /> <br/>
                        <label style="margin-right:22px">PUPPLE  </label> <sapn class='c_color' style="background : rgb(255,0,255)" ></sapn>     -<input type="checkbox" name="color" value="rgb(255,0,255)" /><br/>
                        <input type='hidden' id='Tcolor' name='Tcolor' />
                          
                        </div>
                  
               

            <input type='hidden' name='sysdate' value='게시날짜' />
            <input type='hidden' name='pLike' value='0'/>
            
         </div>
      </div>
            <div id='textContent' style = "font-size: x-large; color : #888;  border-radius: 5px 5px 5px 5px; border : 1px solid lightgray; width: 10%; padding: 5px; text-align: center;">
            <label>상품 상세정보</label>
            </div><br/>
            
            <div id='smart_e'>
            <textarea style="height: 700px; width:1000px;" rows="10" name="pContent"
               id="textAreaContent" cols="80"></textarea>
            </div>

            <div id='ininser'>

               <input type='button' id='btn_insert' name='btn_insert' value='등록하기'
                  style="width: 300px; height : 50px; font-size: 25px; background-color: white; margin-bottom: 5%; margin-top: 5%; border : 1px solid #999; color : #888;" />
            </div>
   </form>

</body>
<script type="text/javascript"
   src="<%=request.getContextPath()%>/se2/js/HuskyEZCreator.js"
   charset="utf-8"></script>
<script type="text/javascript"
   src="<%=request.getContextPath()%>/se2/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js"
   charset="utf-8"></script>

<script type="text/javascript">
var frm = document.product;

var sPrice = document.getElementById("sPrice");
var pPrice = document.getElementById("pPrice");
var test="";
var test2="";

frm.attFileB.onchange = imagePreView;

// 등록하기 버튼
frm.btn_insert.onclick = function(){
   
   $("#pCode").val($("input[name=Tgender]:checked").val()+$("input[name=Tbig]:checked").val()+$("input[name=Tsmall]:checked").val());
   
   $("input[name=color]:checked").each(function() {
      if(test!=""){ 
         test +='_';  
      }    
       test += $(this).val();    
   });
       $('#Tcolor').val(test);
   
   $("input[name=pSize_o]:checked").each(function() {    
       if(test2 !=""){ 
            test2 +='_';  
         }   
          test2 += $(this).val();    
      });
          $('#pSize').val(test2);
       //상품 등록 예외 처리
       if($('#pName').val() == "" || $('#pName').val() == null){
          $('#pName').attr("placeholder","품명을 입력해주세요.");
          $('#pName').focus();
          return;
       }
       
       if($('#hashTag').val() == "" || $('#hashTag').val() == null){
          $('#hashTag').attr("placeholder","해시태그를 입력해주세요.");
          $('#hashTag').focus();
          return;
       }
       if($('#pPrice').val() == "0" || $('#pPrice').val() == null){
          $('#pPrice').attr("value","");
          $('#pPrice').attr("placeholder","판매가를 입력해주세요.");
          $('#pPrice').focus();
          return;
       }
       if($('#pStock').val() == "0" || $('#pStock').val() == null){
          $('#pStock').attr("value","");
          $('#pStock').attr("placeholder","재고 수량을 입력해주세요.");
          $('#pStock').focus();
          return;
       }
   
   // 에디터의 내용이 textarea에 적용된다.   
    oEditors.getById["textAreaContent"].exec("UPDATE_CONTENTS_FIELD", [ ]);
    console.log("일단 여기까지");
   frm.action="insertR.shop"
   frm.submit();  
    // 에디터의 내용에 대한 값 검증은 이곳에서
    // document.getElementById("textAreaContent").value를 이용해서 처리한다.

}

$("input[name=pSize_o]:checked").each(function() {    
    if(test2 !=""){ 
         test2 +='_';  
      }   
       test2 += $(this).val();    
   });
       $('#pSize').val(test2);

//남녀 카테고리
/* function click(){
   if(a ==null){
      a.style.display = 'none';
      b.style.display = 'visible';
   }else{
      b.style.display = 'none';
      a.style.display = 'visible';
   }
} */

//스마트 에디터
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
    oAppRef: oEditors,
    elPlaceHolder: "textAreaContent",
    sSkinURI: "<%=request.getContextPath()%>/se2/SmartEditor2Skin.html",

      fCreator : "createSEditor2"
   });

   //‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.
   /* function submitContents(elClickedObj) {
    // 에디터의 내용이 textarea에 적용된다.
    oEditors.getById["textAreaContent"].exec("UPDATE_CONTENTS_FIELD", [ ]);
   
    // 에디터의 내용에 대한 값 검증은 이곳에서
    // document.getElementById("textAreaContent").value를 이용해서 처리한다.
   
    try {
    elClickedObj.form.submit();
    } catch(e) {
   
    }
    } */

   //스마트에디터 (textArea)에 이미지 첨부
   function pasteHTML(filepath) {
      //   var sHTML = '<img src="C:/Users/JHTA/Desktop/eclipse_1903/workspace/Final/WebContent/uploadFolder/'+filepath+'">';
      var sHTML = '<img src="../se2/upload/'+filepath +'">';
      //    var sHTML = '<img src="./smart/uploadFolder/2019_10_22_103932.jpg">';
      //    var sHTML = '<img src="' + filepath + '">';
      oEditors.getById["textAreaContent"].exec("PASTE_HTML", [ sHTML ]);
      console.log(sHTML);
   }
   //세일가격 계산
   $('#pp').change(
         function() {
            sPrice.value = parseInt(pPrice.value)
                  - (parseInt(pPrice.value) / 100) * parseInt(pp.value);
         });

   //할인가격 사용여부
   function sa(v) {
      if (v == '1') {
         document.getElementById("ss").style.display = "block";
      } else if (v == '2') {
         document.getElementById("ss").style.display = "none";
      }

   }
   // 남녀 카테고리 분리.
   function ge(m) {
      if (m == 2) {
         document.getElementById("woman").style.display = "block";
         document.getElementById("man").style.display = "none";
      } else if (m == 1) {
         document.getElementById("woman").style.display = "none";
         document.getElementById("man").style.display = "block";
      }
   }

   function gf(m) {
      if (m == 10) {
         document.getElementById('outter').style.display = 'inline-block';
         document.getElementById('top').style.display = 'none';
         document.getElementById('bottom').style.display = 'none';
         document.getElementById('shoes').style.display = 'none';
         document.getElementById('acc').style.display = 'none';
      } else if (m == 11) {
         document.getElementById('outter').style.display = 'none';
         document.getElementById('top').style.display = 'inline-block';
         document.getElementById('bottom').style.display = 'none';
         document.getElementById('shoes').style.display = 'none';
         document.getElementById('acc').style.display = 'none';
      } else if (m == 12) {
         document.getElementById('outter').style.display = 'none';
         document.getElementById('top').style.display = 'none';
         document.getElementById('bottom').style.display = 'inline-block';
         document.getElementById('shoes').style.display = 'none';
         document.getElementById('acc').style.display = 'none';
      } else if (m == 13) {
         document.getElementById('outter').style.display = 'none';
         document.getElementById('top').style.display = 'none';
         document.getElementById('bottom').style.display = 'none';
         document.getElementById('shoes').style.display = 'inline-block';
         document.getElementById('acc').style.display = 'none';
      } else if (m == 14) {
         document.getElementById('outter').style.display = 'none';
         document.getElementById('top').style.display = 'none';
         document.getElementById('bottom').style.display = 'none';
         document.getElementById('shoes').style.display = 'none';
         document.getElementById('acc').style.display = 'inline-block';
      }
   }

   // 여자 대분류 소분류
   function gg(woman_cV) {
      if (woman_cV == '20') {
         document.getElementById('Wtop').style.display = 'inline-block';
         document.getElementById('Wdress').style.display = 'none';
         document.getElementById('Wblothes').style.display = 'none';
         document.getElementById('Wshoes').style.display = 'none';
         document.getElementById('Wacc').style.display = 'none';
      } else if (woman_cV == '21') {
         document.getElementById('Wtop').style.display = 'none';
         document.getElementById('Wdress').style.display = 'inline-block';
         document.getElementById('Wblothes').style.display = 'none';
         document.getElementById('Wshoes').style.display = 'none';
         document.getElementById('Wacc').style.display = 'none';
      } else if (woman_cV == '22') {
         document.getElementById('Wtop').style.display = 'none';
         document.getElementById('Wdress').style.display = 'none';
         document.getElementById('Wblothes').style.display = 'inline-block';
         document.getElementById('Wshoes').style.display = 'none';
         document.getElementById('Wacc').style.display = 'none';
      } else if (woman_cV == '23') {
         document.getElementById('Wtop').style.display = 'none';
         document.getElementById('Wdress').style.display = 'none';
         document.getElementById('Wblothes').style.display = 'none';
         document.getElementById('Wshoes').style.display = 'inline-block';
         document.getElementById('Wacc').style.display = 'none';
      } else if (woman_cV == '24') {
         document.getElementById('Wtop').style.display = 'none';
         document.getElementById('Wdress').style.display = 'none';
         document.getElementById('Wblothes').style.display = 'none';
         document.getElementById('Wshoes').style.display = 'none';
         document.getElementById('Wacc').style.display = 'inline-block';
      }
   }
   
   $(document).ready(function()
         { var fileTarget = $('.filebox .upload-hidden'); 
         fileTarget.on('change', function(){ 
            if(window.FileReader){ 
            var filename = $(this)[0].files[0].name; } else {
               var filename = $(this).val().split('/').pop().split('\\').pop();}
               $(this).siblings('.upload-name').val(filename); }); });

   frm.attFileB.onchange = imagePreView;

   // 이미지파일 미리보기
   function imagePreView(ev) {
      //이벤트가 발생한 file 태그
      var tag = ev.srcElement;
      var file = tag.files[0];
      var reader = new FileReader();
      reader.readAsDataURL(file);
      reader.onload = function(e) {
         //메모리에 읽혀진 자료를 img 태그로 변환
         var img = new Image();
         img.src = e.target.result;//Mapping
         frm.img_b.src = img.src;
      }
   }
attfileAppend();
   
   
</script> 


</html>