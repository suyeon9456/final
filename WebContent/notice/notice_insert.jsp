<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 입력하기</title>
<link href = "./css/notice.css" type = "text/css" rel = "stylesheet" />
</head>
<body>
<br/><br/>
<div id = "notice_insert">
	<form name = "noticeFrm" method="post" enctype="multipart/form-data">
		<table class = "tbl_not" cellspacing="0" cellpadding = "0">
		 	<tbody>
		 		<tr>
			 		<th>제목</th>
		 			<td>
		 				<input type = "text" name = "nSubject" placeholder="공지사항 제목을 입력하세요." />
		 			</td>
		 		</tr>
		 		
		 		<tr>
		 			<th>내용</th>
		 			
		 			<td>
		 				<textarea name = "nContent" placeholder="공지사항 내용을 입력하세요."></textarea>
		 			</td>
		 		</tr>

		 	</tbody>
		</table>
	
		
		<div id = "insert_btns">
			<input type = "button" value = "목록" name = "btnSearch" id = "btnSearch"/>
			<input type = "button" value = "등록" name = "btnInsert" id = "btnInsert"/>
		</div> 
		
		<input type = "hidden" name = "nowPage" value = "${param.nowPage }" />
	</form>
</div>
</body>

<script>
var frm = document.noticeFrm;


//저장 버튼 클릭 시 이벤트
frm.btnInsert.onclick = function(){
	var url = "index.jsp?content=notice_insertR.not";
	frm.action = url;
	frm.submit();
}
frm.btnSearch.onclick = function(){
	var url = "index.jsp?content=go_notice_search.not";
	frm.action = url;
	frm.submit();
}
</script>
</html>