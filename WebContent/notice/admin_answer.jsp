<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의사항 답글달기</title>
<link href = "./css/admin_answer.css" type = "text/css" rel = "stylesheet" />
</head>
<body>
<div id = "admin_answer">
   <div id = "user_q">
      <div id = "hh3">소비자 문의 내용</div>
      <table class = "tbl_qna" cellspacing="0" cellpadding = "0">
             <tbody>
                <tr>
                   <th>제목</th>
                   <td>
                      ${data.qSubject }
                   </td>
                </tr>
                
                <tr>
                   <th>내용</th>
                   
                   <td style = "height:300px;">
                      ${data.qContent }
                   </td>
                </tr>
             </tbody>
         </table>   
   </div>
   <div id = "hh3">문의 답변 달기</div>
   
   <div id = "admin_a">
      <form name = "adminQna" method="post" enctype="multipart/form-data">
         <table class = "tbl_qna" cellspacing="0" cellpadding = "0">
             <tbody>
                <tr>
                   <th>제목</th>
                   <td>
                      <input type = "text" name = "qSubject" placeholder="답글 제목을 입력하세요." />
                   </td>
                </tr>
                
                <tr>
                   <th>내용</th>
                   
                   <td>
                      <textarea name = "qContent" placeholder="답글내용을 입력하세요."></textarea>
                   </td>
                </tr>
             </tbody>
         </table>
         
         <div id = "insert_btns">
            <input type = "button" value = "목록" name = "btnList" id = "btnList"/>
            <input type = "button" value = "등록" name = "btnInsert" id = "btnInsert"/>
         </div>
         <input type="hidden" name="qId"   value=${sessionScope.user_id } />
         <input type="hidden" name="qPserial" value='${data.qSerial }' />
      </form>
   </div>
</div>
<script>
var frm = document.adminQna;

document.getElementById("btnList").onclick = function() {
   frm.action = "index.jsp?content=go_question_search.not";
   frm.submit();
}

document.getElementById("btnInsert").onclick = function() {
   frm.action = "index.jsp?content=answer.not";
   frm.submit();
}


</script>
</body>
</html>