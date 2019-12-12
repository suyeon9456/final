<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 입력하기</title>
<link href = "./css/question_view.css" type = "text/css" rel = "stylesheet" />
</head>
<body>
<br/><br/>
<div id = "question_view">
	<h1>공지사항</h1>
	<form name = "questionFrm" method="post" enctype="multipart/form-data">
		<table class = "tbl_not" cellspacing="0" cellpadding = "0">
		 	<tbody>
		 		<tr>
			 		<th>제목</th>
		 			<td>
		 				<input type = "text" name = "qSubject" value='${vo.qSubject }' readOnly />
		 			</td>
		 		</tr>
		 		
		 		<tr>
		 			<th>내용</th>
		 			
		 			<td>
		 				<textarea name = "qContent" readOnly>${vo.qContent }</textarea>
		 			</td>
		 		</tr>
		 	</tbody>
		</table>
		
		
		
		<div id = "view_btns">
			<input type = "button" value = "목록" name = "btnSearch" id = "btnSearch"/>
			<input type = "button" value = "수정" name = "btnModify" id = "btnModify"/>
		</div>
		
		<input type = "text" name = "nowPage" value = "${param.nowPage }" />
	</form>
</div>
</body>

<script>
var frm = document.questionFrm;


//저장 버튼 클릭 시 이벤트
frm.btnModify.onclick = function(){
	var frm = document.questionFrm;
	if(frm.btnModify.value =='수정'){
		frm.btnModify.value = '수정후 저장';
		
		frm.qSubject.style.backgroundColor = '#faa';
		frm.qContent.style.backgroundColor = '#faa';

		frm.qSubject.readOnly = false;
		frm.qContent.readOnly = false;
	
		frm.qSubject.select();
	}else{
		var url = "index.jsp?content=question_insertR.not";
		frm.action = url;
		frm.submit();		
	}

}
frm.btnSearch.onclick = function(){
	alert("눌렷니?");
	var url = "index.jsp?content=go_question_search.not";
	frm.action = url;
	frm.submit();
}
</script>
</html>