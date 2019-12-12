<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1대 1문의</title>
<script src="./lib/jquery-3.4.1.js"></script>
<link href="./css/member.css" type="text/css" rel="stylesheet" />
</head>
<body>
	<div id="mypage_qna_insert">
		<c:choose>
			<c:when test="${fn:length(data) ne 1}">
				<c:forEach var="i" items="${data }">
					<table class="tbl_qna" cellspacing="0" cellpadding="0">
						<tbody>
							<tr>
								<th>제목</th>
								<td><select name="qOrder">
											<option value="문의분류">문의분류</option>
											<option value="배송문의">배송문의</option>
											<option value="결제문의">결제문의</option>
											<option value="교환/반품문의">교환/반품문의</option>
											<option value="기타문의">기타문의</option>
										</select>
										<input type="text" name="qSubject" value="${i.qSubject }" />
								</td>
							</tr>

							<tr>
								<th>내용</th>
								<td><textarea name="qContent">${i.qContent }</textarea></td>
							</tr>
						</tbody>
					</table>

					<div id="photo_show" style="height: auto;">
						<c:forEach var="p" items="${i.list }">
							<div class="image_box">
								<img src="./upload/${p.hPhoto }">
							</div>
						</c:forEach>
					</div>
				</c:forEach>
				<form name="myqna" method="post">
					<div id="insert_btns">
						<input type="button" value="목록" name="btnSearch" id="btnSearch" />
					</div>

					<input type="text" name="nowPage" value="${param.nowPage }" />
					<input	type="text" name="qId" value="${param.qId }" />
				</form>
			</c:when>

			<c:when test="${fn:length(data) eq 1}">
				<script>
					var cnt = 0;

					var delpho = function(src) {
						var photo = document.getElementById('photo_show');

						//삭제버튼
						var btnDel = document.createElement("input");
						btnDel.setAttribute('style',
								'background-color:white; font-weight:bold;');
						btnDel.setAttribute('type', 'button');
						btnDel.setAttribute('value', 'X');

						btnDel.onclick = function(ev) {// 삭제
							if (photo.childNodes.length <= 1) {
								return;
							}
							var ele = ev.srcElement;
							var p = ele.parentNode;
							photo.removeChild(p);
							var dfile = document.createElement("input");
							dfile.setAttribute('type', 'hidden');
							dfile.setAttribute('name', 'delFile');
							dfile.setAttribute("value", src);
							photo.appendChild(dfile);
						}

						//메모리에 읽혀진 자료를 img 태그로 변환
						var img_box = document.createElement('div');
						img_box.setAttribute('class', 'image_box');
						var img = document.createElement('img');
						img.setAttribute('name', 'delimg' + cnt);
						img.setAttribute('id', 'delimg' + cnt);
						img.setAttribute('width', '120px');
						img.setAttribute('height', '160px');
						img.setAttribute('src', './upload/' + src);

						img_box.appendChild(img);
						img_box.appendChild(btnDel);

						photo.appendChild(img_box);

						cnt++;
					}
				</script>
				
				<form name="myqna" method="post" enctype="multipart/form-data">
					<table class="tbl_qna" cellspacing="0" cellpadding="0">
						<tbody>
							<tr>
								<th>제목</th>
								<td>
									<select name="qOrder" id="qOrder">
										<option value="문의분류">문의분류</option>
										<option value="배송문의">배송문의</option>
										<option value="결제문의">결제문의</option>
										<option value="교환/반품문의">교환/반품문의</option>
										<option value="기타문의">기타문의</option>
									</select>
									<input type="text" id ="qSubject"name="qSubject" value="${data[0].qSubject }" readOnly />
									<input type="hidden" name="qSerial"value="${data[0].qSerial }" />
								</td>
							</tr>
							<tr>
								<th>내용</th>
								<td><textarea name="qContent" id="qContent" readOnly>${data[0].qContent }</textarea></td>
							</tr>

							<tr id="att1" style="visibility: hidden;">
								<th>첨부파일</th>
								<td id="file_td">
									<input type="file" name="hPhotoFileName"id="hPhotoFileName" onchange="imagePreView(event)" />
								</td>
							</tr>
						</tbody>
					</table>

					<div id="photo_show">
						<c:forEach var="j" items="${data[0].list }">
							<script>
								delpho('${j.hPhoto }')
							</script>
						</c:forEach>
					</div><br />

					<div id="insert_btns">
						<input type='hidden' value='${param.category }' id='category'	name='category' />
						<input type="button" value="목록" name="btnSearch" id="btnSearch" />
						<input type="button" 	value="수정" name="btnModify" id="btnModify" />
					</div>

					<input type="hidden" name="nowPage" value="${param.nowPage }" />
					<input	type="hidden" name="qId" value="${param.qid }" />
					<input type="hidden" name="rId"	value="<%=session.getAttribute("user_id")%>" />
				</form>
			</c:when>
		</c:choose>
	</div>

	<script>
		var frm = document.myqna;

		document.getElementById("btnSearch").onclick = function() {
			var m = document.getElementById("category");
			if (m.value == 2) {
				frm.action = 'index.jsp?content=go_question_search.not';
				frm.submit();
			} else {
				frm.action = "index.jsp?content=myqna_search.mem";
				frm.submit();
			}
		}
		for (j = 0; j < frm.qOrder.options.length; j++) {
			if (frm.qOrder.options[j].value == '${data[0].qOrder}') {
				frm.qOrder.options[j].selected = true;
				break;
			}
		}

		function imagePreView(ev) {
			var photo = document.getElementById('photo_show');

			//이미지 사진을 선택한 파일태그
			var oriFile = document.getElementById("hPhotoFileName");
			oriFile.setAttribute("style", "display:none;");
			oriFile.setAttribute("name", "attFile");
			oriFile.setAttribute("class", "file");
			oriFile.setAttribute("id", "hPhotoFileName" + cnt);

			var fileTd = document.getElementById("file_td");

			// 새로 추가되는 file tag
			var file = document.createElement("input");
			file.setAttribute('type', 'file');
			file.setAttribute('name', "hPhotoFileName");
			file.setAttribute('id', 'hPhotoFileName');
			file.setAttribute('onchange', 'imagePreView(event)');

			//삭제버튼
			var btnDel = document.createElement("input");
			btnDel.setAttribute('style',
					'background-color:white; font-weight:bold;');
			btnDel.setAttribute('type', 'button');
			btnDel.setAttribute('value', 'X');
			btnDel.onclick = function(ev) {// 삭제
				if (photo.childNodes.length <= 1) {
					return;
				}

				var ele = ev.srcElement;
				var p = ele.parentNode;

				photo.removeChild(p);

				//파일태그 삭제하기

				var f = document.getElementsByClassName('file');
				var h = p.firstElementChild;

				for (var j = 0; j <= f.length - 1; j++) {

					if (f[j].id == h.id) {
						f[j].parentNode.removeChild(f[j]);
					}
				}
			}

			//이벤트가 발생한 file 태그 
			var tag = ev.srcElement;
			var file1 = tag.files[0];
			var reader = new FileReader();
			reader.readAsDataURL(file1);
			reader.onload = function(e) {
				var imgUrl = new Image();
				imgUrl.src = e.target.result;

				//메모리에 읽혀진 자료를 img 태그로 변환
				var img_box = document.createElement('div');
				img_box.setAttribute('class', 'image_box');

				var img = document.createElement('img');
				img.setAttribute('name', 'hPhotoFileName' + cnt);
				img.setAttribute('id', 'hPhotoFileName' + cnt);
				img.setAttribute('width', '120px');
				img.setAttribute('height', '160px');
				img.setAttribute('src', e.target.result);

				fileTd.appendChild(file);
				img_box.appendChild(img);
				img_box.appendChild(btnDel);

				photo.appendChild(img_box);

				cnt++;
			}
		}

		var qOrder = document.getElementById("qOrder");

		frm.btnModify.onclick = function() {
			var frm = document.myqna;
			var att = document.getElementById("att1");
			if(frm.btnModify.value=='수정'){
				frm.btnModify.value = '수정후 저장';
				
				frm.qSubject.readOnly = false;
				frm.qContent.readOnly = false;
				
				frm.qSubject.style.backgroundColor = '#E1F6FA';
				frm.qContent.style.backgroundColor = '#E1F6FA';
				
				att1.style.visibility = 'visible';
			}else{
				if (qOrder.options[qOrder.selectedIndex].value == "문의분류") {
					alert("문의분류를 선택해 주세요.");
					return false;
				}
				var url = "myqna_modifyR.mem";
				frm.action = url;
				frm.submit();				
			}
		}
	</script>
</body>
</html>