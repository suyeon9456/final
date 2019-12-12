<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>refundRecord</title>
<link href="./css/notice_search.css" type="text/css" rel="stylesheet" />
<style>
#noti input[type=button]{
cursor: pointer;
}

</style>
</head>
<body>
   <br />
   <br />
   <div id='noti'>
      <form name='frm_notice' id='frm_notice' method="post">      
         <H1>공지사항</H1>         
         
         <div id='btns'>
            <input type='text' id='findStr' name='findStr' value="${para.findStr }" />
            <input type='button' id="btnSearch"   name='btnSearch' value="조회" />
            <input type='hidden' id='nowPage' name='nowPage' value='1'/>
         </div>
         
         <div id = "bnts_su">
            <span id='nott' onclick="goNot('1')">공지사항</span>            
         </div>
         
         <div id="paylist">
            <div id="paylist_header">
               <span class='notice_no'>NO</span> 
               <span class='notice_subject'>SUBJECT</span> 
               <span class='notice_name'>NAME</span> 
               <span class="notice_date">DATE</span>
            </div>
            
            
            <div id="data_list" style="cursor: pointer;">
               <c:forEach var='data' items='${list }'>
                  <div class="datalist" onclick="goV('${data.nSerial}')">
                     <span class='notice_no'>${data.nSerial }</span>
                     <span class='notice_subject'>${data.nSubject }</span>
                     <span class='notice_name'>${data.nId }</span>
                     <span class="notice_date">${data.nDate }</span>
                  </div>
               </c:forEach>
            </div>
            
         </div>
         
         
         <c:if test="${sessionScope.user_id eq 'admin'}">
            <input type='button' id='write' name='write' value='글쓰기' />
         </c:if>
      </form>
   </div>


   <script>
   var frm_notice = document.frm_notice;
   
      function goV(serial) {
         frm_notice.action = 'index.jsp?content=go_notice_view.not&rSerial='+serial;
         frm_notice.submit();
      }

      getId("write").onclick = function() {
            frm_notice.action = 'index.jsp?content=go_notice_insert.not';
            frm_notice.submit();
      }

      function getId(id) {
         return document.getElementById(id);
      }
   </script>
</body>
</html>