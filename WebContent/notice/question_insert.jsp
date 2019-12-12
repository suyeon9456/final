<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 입력하기</title>
<link href = "./css/question_insert.css" type = "text/css" rel = "stylesheet" />
</head>
<body>
<br/><br/>
<div id = "question_insert">
	<form name = "questionFrm" method="post" enctype="multipart/form-data">
		<table class = "tbl_que" cellspacing="0" cellpadding = "0">
		 	<tbody>
		 		<tr>
			 		<th>제목</th>
		 			<td>
		 				<input type = "text" name = "qSubject" placeholder="1대1문의 제목을 입력하세요." />
		 				<select><option>전체</option>
		 							 <option>회원정보</option>
		 							 <option>배송</option>
		 							 <option>환불|반품</option>
		 							 <option>결제</option>
		 							 <option>기타</option></select>
		 			</td>
		 		</tr>
		 		
		 		<tr>
		 			<th>내용</th>
		 			
		 			<td>
		 				<textarea name = "qContent" placeholder="1대1문의 내용을 입력하세요."></textarea>
		 			</td>
		 		</tr>
		 	</tbody>
		</table>
		
		
		</div>
		
		<div id = "insert_btns">
			<input type = "button" value = "목록" name = "btnSearch" id = "btnSearch"/>
			<input type = "button" value = "등록" name = "btnInsert" id = "btnInsert"/>
		</div>
		
		<input type = "text" name = "nowPage" value = "1" />
		<input type = "text" name = "qId" value = ${sessionScope.user_id } />
	</form>
</div>
</body>

<script>
var frm = document.questionFrm;


//저장 버튼 클릭 시 이벤트
frm.btnInsert.onclick = function(){
	alert("저장실행");
	var url = "index.jsp?content=question_insertR.not";
	frm.action = url;
	frm.submit();
}
frm.btnSearch.onclick = function(){
	var url = "index.jsp?content=go_question_search.not";
	frm.action = url;
	frm.submit();
}
</script>
</html>