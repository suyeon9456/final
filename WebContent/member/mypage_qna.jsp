<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>1대 1문의</title>
<script src = "./lib/jquery-3.4.1.js"></script>
<link href = "./css/member.css" type = "text/css" rel = "stylesheet" />
</head>
<body>
<div id = "mypage_qna">
   <div id = "qna_top">
      <h2>
         1대 1문의
      </h2>   
      <ul>
         <li>총 문의 <span>${para.totListSize}</span> 건</li>
      </ul>   
   </div>
   <table class = "tbl_qna" cellspacing="0" cellpadding = "0">
      <thead>
         <tr>
            <th>번호</th>
            <th>제목</th>
            <th>등록일</th>
            <th>문의 분류</th>
         </tr>
      </thead>
      
      <tbody>
         <c:forEach var = "data" items="${list }">
            <tr onclick = "goqna('${data.qSerial }')" style="cursor: pointer;">
               <td class = "qSerial">${data.qSerial }</td>
               <td class = "qSubject">${data.seq }</td>
               <td class = "qDate">${data.qDate }</td>
               <td class = "qOrder">${data.qOrder }</td>
            </tr>
         </c:forEach>
      </tbody>
   </table>
   
   <form name = "myqna" method="post">
      <div id = "insert_btn_box">
         <input type = "button" value="문의하기" name = "btnInsert" class= "btnInsert"/>
      </div>
         <input type = "hidden" name = "qId" value = "${sessionScope.user_id }"/>
         <input type = "hidden" name = "nowPage" value = "${(empty param.nowPage)?1:param.nowPage }"/>
         <input type = "hidden" id ="qSerial" name = "qSerial" value="0"/>
   </form>
   
   <div id = "btns">
      <input type = "button" value = "&lt&lt" id = "btnFirst" class = "btnss"/>
      <input type = "button" value = "&lt" id = "btnPrev" class = "btnss"/>
      <input type = "button" value = "&gt" id = "btnNext" class = "btnss"/>
      <input type = "button" value = "&gt&gt" id = "btnLast" class = "btnss"/>
   </div>
</div>

<script>
var frm = document.myqna;
var totPage = ${para.totPage};


var getId = function(id){
   return document.getElementById(id);
}

function goqna(serial) {
   getId("qSerial").value = serial;
   console.log(getId("qSerial").value);
   frm.action = "index.jsp?content=myqna_view.mem";
   frm.submit();
}

getId("btnFirst").onclick = function(){
   frm.nowPage.value = 1;
   frm.action = "index.jsp?content=myqna_search.mem";
   frm.submit();
}

getId("btnPrev").onclick = function(){
   var nowPage = Number(frm.nowPage.value) - 1 ;
   if(nowPage < 1){nowPage = 1;}
   frm.nowPage.value = nowPage;
   frm.action = "index.jsp?content=myqna_search.mem";
   frm.submit();
}

getId("btnNext").onclick = function(){
   var nowPage = Number(frm.nowPage.value) + 1 ;
   if(nowPage >totPage){nowPage = totPage;}
   frm.nowPage.value = nowPage;
   frm.action = "index.jsp?content=myqna_search.mem";
   frm.submit();
}

getId("btnLast").onclick = function(){
   frm.nowPage.value = totPage;
   frm.action = "index.jsp?content=myqna_search.mem";
   frm.submit();
}
   
frm.btnInsert.onclick = function(){
   frm.action = "index.jsp?content=myqna_insert.mem";
   frm.submit();
}
</script>
</body>
</html>