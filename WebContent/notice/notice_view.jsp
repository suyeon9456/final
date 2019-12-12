<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 입력하기</title>
<link href = "./css/notice_view.css" type = "text/css" rel = "stylesheet" />
</head>
<body>
<br/><br/>
<div id = "notice_view">
	<form name = "noticeFrm" method="post" enctype="multipart/form-data">
		<table class = "tbl_not" cellspacing="0" cellpadding = "0">
		<h1 style = "margin: 0 auto; width: 60%;">공지사항</h1><br/>
		 	<tbody>
		 		<tr>
			 		<th>제목</th>
		 			<td>
		 				<input type = "text" name = "nSubject" value='${vo.nSubject }' readOnly />
		 			</td>
		 		</tr>
		 		
		 		<tr>
		 			<th>내용</th>
		 			
		 			<td>
		 				<textarea name = "nContent" readOnly>${vo.nContent }</textarea>
		 			</td>
		 		</tr>
		 	</tbody>
		</table>
		
		</div>
		<div id = "view_btns">

		</div>			
		
		
		<input type = "hidden" name = "nowPage" value = "${param.nowPage }" />
	</form>
</div>
</body>

<script>
var frm = document.noticeFrm;

//저장 버튼 클릭 시 이벤트
frm.btnModify.onclick = function(){
	var frm = document.noticeFrm;
	if(frm.btnModify.value =='수정'){
		frm.btnModify.value = '수정후 저장';
		
		frm.nSubject.style.backgroundColor = '#faa';
		frm.nContent.style.backgroundColor = '#faa';

		frm.nSubject.readOnly = false;
		frm.nContent.readOnly = false;
	
		frm.nSubject.select();
	}else{
		var url = "index.jsp?content=notice_insertR.not";
		frm.action = url;
		frm.submit();		
	}

}
frm.btnSearch.onclick = function(){
	var url = "index.jsp?content=go_notice_search.not";
	frm.action = url;
	frm.submit();
}
</script>
</html>