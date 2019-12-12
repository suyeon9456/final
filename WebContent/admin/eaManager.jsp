<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>eaManager</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
	#eaManager {
		margin: 0 auto;
		width: 60%;
		height: 100%;
	}
	
	#title{
		padding-top: 10px;
		padding-bottom: 10px;
		margin-bottom: 20px;
		border-bottom: 2px solid;
		border-top: 2px solid;
	}
	
	#sales{
		border : 2px solid lightgray;
		padding: 30px;
	}
	
	#sales label{
		display : inline-block;
		width: 100px;
	}
	
  #data{
      padding: 5px;
      margin-bottom : 10%;
      height: 30px;
      line-height: 30px;
      color : #aaa;
   }
	
	#listt{
		text-align: center;
	}
	
	.pCode{display:inline-block; width: 15%; margin-left: 10%;}
	.pName{display:inline-block; width: 15%;}
	.mMdate{display:inline-block; width: 15%;}
	.price{display:inline-block; width: 15%;}
	.ea{display:inline-block; width: 10%;}
	.sEa{display:inline-block; width: 15%;}
	
</style>
</head>
<body>

<div id = 'eaManager'>
<form name = "frm_eam" id = "frm_eam" method="post">
	<H1 style = "border-bottom: 2px solid; padding-bottom: 5px; margin-bottom: 25px;">재고관리</H1>
	
	<div id = 'sales'>
		<label>상품분류</label>
		<select name = "select_big">
			<option>대분류</option>
			<option>Outer</option>
			<option>Top</option>
			<option>Bottom</option>
			<option>Shoes</option>
			<option>Acc</option>
		</select>
		<br/><br/>
		
		<label>상품등록일</label>
		<input type = 'button' value = '당일' name = 'btnDay'  id = 'btnDay' style = 'background-color: white; border: 1px solid lightgray; width: 70px;'/>
		<input type = 'button' value = '3일' name = 'btntDay' id = 'btntDay' style = 'background-color: white; border: 1px solid lightgray; width: 70px;'/>
		<input type = 'button' value = '7일' name = 'btnsDay' id = 'btnsDay' style = 'background-color: white; border: 1px solid lightgray; width: 70px;'/>
		<input type = 'button' value = '전체' name = 'btnaDay' id = 'btnADay' style = 'background-color: white; border: 1px solid lightgray; width: 70px;'/>
		&nbsp;&nbsp;&nbsp;
		<input type = 'date'  name = 'mDate'/> ~
		<input type = 'date'  name = 'rDate'/>
		
		<br/><br/>
		
		<label style = "margin-bottom: 30px;">검색분류</label>
		<input type = 'text'   name = 'findStr' id = 'findStr' value = '${para.findStr }'/>
		<input type = 'submit' value = '검색' name = 'search' style = 'background-color: white; border: 1px solid lightgray; width: 70px;'/>
	</div>
	<br/><br/>
	
	<input type = 'button' id = 'btnSale' value = '매출현황' style = 'background-color: white; border: 1px solid lightgray; width: 70px;'/>
	
	<select style = "float: right;" onchange = "javascript:handleSelect(this)">
		<option>등록일</option>
		<option value = "DescSearch">추가된 날짜(최신순)</option>
		<option value = "AscSearch">추가된 날짜(오래된순)</option>
	</select>
	
	<br/><br/>
	
	<div id = 'title'>
		<span class = 'pCode'>상품정보</span>
		<span class = 'pName'>상품명</span>
		<span class = 'mMdate'>등록일</span>
		<span class = 'price'>주문금액</span>
		<span class = 'ea'>재고</span>
		<span class = 'sEa'>좋아요</span>
	</div>
	<div id = "data-detail">
	  <c:forEach var = "dataa" items = "${list }" varStatus="status">
		<div id = 'data' onclick = "go('${dataa.pCode}')">
			<span class = 'pCode'><img src = "./supload/${dataa.attFileB }" style = "width: 80px; height: 70px;" ></img></span>
			<span class = 'pName'>${dataa.pName }</span>
			<span class = 'mMdate'>${dataa.pDate }</span>
			<span class = 'price'>${dataa.pPrice }</span>
			<span class = 'ea'>${dataa.pStock }</span>
			<span class = 'sEa'>${dataa.pLike }</span>
		</div>
		
	  </c:forEach>
	</div>
	
	<br/>
		
	<div id = 'columnchart_material' style = "margin: 0 auto; width: 800px; height: 500px;"></div>
	
	<div id = 'listt'>
		<input type = "button" value = "목록으로" name = "btnListt" id = "btnListt" style = "background-color: white; border: 1px solid lightgray; width : 70px; margin-bottom: 50px; margin-top: 50px;"/>
	</div>
	
</form>
</div>
 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
    var frm_eam = document.frm_eam;
    
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
         var data = google.visualization.arrayToDataTable([
             ['Year', 'Outer', 'Top', 'Bottom','Shoes','Acc'],
             ['2016', 11942, 17246, 13764,7346,6189],
             ['2017', 12247, 15467, 15912,8314,5947],
             ['2018', 10834, 16585, 12294,8724,6734],
             ['2019', 13565, 17642, 14627,9167,6581]
           ]);

        var options = {
          chart: {
            title: '1903기 2조 프로젝트',
            subtitle: '2016 - 2019년도 각 카테고리별 매출',
          }
        };

        var chart = new google.charts.Bar(document.getElementById('columnchart_material'));

        chart.draw(data, google.charts.Bar.convertOptions(options));
      }
    </script>
<script>
	
	$('#btnSale').click(function(){
		
		$('#columnchart_material').toggle('slow');
		
		
	});
	
	
	
</script>

<script>
	var frm = document.frm_eam;
	
	
	frm.btnDay.onclick = function(){
		frm.action = 'index.jsp?content=Dsearch.shop';
		frm.submit();
	}
	
	frm.btntDay.onclick = function(){
		frm.action = 'index.jsp?content=Tsearch.shop';
		frm.submit();
	}
	
	frm.btnsDay.onclick = function(){
		frm.action = 'index.jsp?content=Ssearch.shop';
		frm.submit();
	}
	
	frm.btnaDay.onclick = function(){
		frm.action = 'index.jsp?content=search.shop';
		frm.submit();
	}
	
	
	function handleSelect(elm){
		window.location = "index.jsp?content=" + elm.value + ".shop";
	}
	
	frm.btnListt.onclick = function(){
		frm.action = "index.jsp?content=adminPage.adm";
		frm.submit();
	}
	
	 function go(ev){
		 frm.action = "index.jsp?content=view.shop?pCode=" + ev;
		 frm.submit();
	   }
	
</script>

</body>
</html>









