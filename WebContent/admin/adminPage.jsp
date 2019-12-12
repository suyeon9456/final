<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AdminPage</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link href = "./css/admin.css" type = "text/css" rel = "stylesheet" />
<style>
   #adminPage {
      margin: 0 auto; width : 60%;
      height: 100%;
      width: 80%;
   }
   
   #div1 {
      margin: 0 auto;
      text-align: center;
      border: 1px solid #ccc;
      width: 80%;
      padding-bottom: 30px;
      color: #666;
   }
   
   .admin_menu{
   display: block; 
   height:40px;
   line-height:40px;
   font-size:15px; 
   background: #f3f3f3;
   font-weight: 800;
   margin-bottom: 20px;
   }
   
   .admin_menu2{
   width: 1216px; 
   margin:0 auto;
   height:40px;
   line-height:40px;
   font-size:15px; 
   background: #e44e4e;
   text-indent:20px;
   color:#fff;
   font-weight: 800;
   border-top:1px solid #c41e20;
   border-bottom:1px solid #c41e20;
   }
   
   #div2 {
      padding-top: 150px;
   }
   
   #circle1{
      display : inline-block;
      width: 120px;
      height: 120px;
      -webkit-border-radius: 100px;
      -moz-border-radius: 100px;
      margin-right: 130px;
      margin-top: 10px;
   }
   
   #circle2{
      display : inline-block;
      width: 120px;
      height: 120px;
      -webkit-border-radius: 100px;
      -moz-border-radius: 100px;
      margin-right: 130px;
   }
   
   #circle3{
      display : inline-block;
      width: 120px;
      height: 120px;
      -webkit-border-radius: 100px;
      -moz-border-radius: 100px;
   }
   
   #img{
      margin-top: 25px;
      margin-bottom: 10px;
   }
   
   #title{
      margin-bottom: 30px;
      background-color: #f3f3f3;
      width: 1216px; 
      margin: 0 auto;
      height: 40px;
      line-height: 40px;
      border-bottom: 1px solid #ccc;
      overflow: hidden;
      
   }
   
   #data{
      margin-bottom: 30px;
      width: 1216px; 
      margin: 0 auto;
      color : #666;
      overflow: hidden;
      height: 40px;
      line-height: 40px;
   }
   
   #data span {
      line-height:40px;
       vertical-align: middle;
   }
   
   #graph1{
      margin: 0 auto;
      margin-top:30px;
      text-align: center;
   }
   
.no{
   display:inline-block; 
   width: 5%; 
   margin-left: 10px;
   float: left;
   }         
      .kind{display:inline-block; width: 15%;float: left;}
      .sobi{display:inline-block; width: 10%;float: left;}
      .subject{display:inline-block; width: 22%;float: left;}
      .content{display:inline-block; width: 28%;float: left;}
      .mDate{display:inline-block; width: 10%;float: left;}
   
      .no1{display:inline-block; width: 5%; margin-left: 10px;float: left;}
      .admin1{display:inline-block; width: 10%;float: left;}
      .subject1{display:inline-block; width: 60%;float: left;}
      .mDate1{display:inline-block; width: 10%;float: left;}
      .hit1{display:inline-block; width: 5%;float: left;}
   
</style>

</head>
<body>
	<div id="adminPage">
		<H1 style="margin-bottom: 25px; margin-top:20px; text-align: center;">관리자 페이지</H1>
		<form id="frm_admin" name="frm_admin">
			<div id='div1'>
				<span class = "admin_menu">관리자 메뉴</span>
				<span style="font-weight: bold; margin-right: 160px; padding-bottom: 5px;">배송 대기</span> 
				<span style="font-weight: bold; margin-right: 160px; margin-left: 5px;">환불/반품 진행</span>
				<span style="font-weight: bold; margin-left: 5px;">현재 문의</span>
				 
				<br/>
				
				<span id="circle1"> 
 					<img id='img'src="./mem_images/abdd.png" width="64px" height="64px">
				<br/>
					 <span style='font-weight: bold; font-size: x-large;'>${stay }</span>
				</span> 
				
				<span id="circle2"> 
					<img id='img'src="./mem_images/abc.png" width="64px" height="64px">
				<br/>
					<span style='font-weight: bold; font-size: x-large;'>${refund }</span>
				</span>
				
				<span id="circle3"> 
 					<img id='img'src="./mem_images/abgg.png" width="64px" height="64px">
				<br/>
					<span style='font-weight: bold; font-size: x-large;'>${ask }</span>
				</span>

			</div>
			
			<br/><br/>
				
			<div id = 'graph1'>
				<div id = 'columnchart_material'  style =  " display : inline-block;width: 350px; height:300px; margin-right: 5%;"></div>
				<div id = 'columnchart_material1' style =  " display : inline-block;width: 350px; height:300px; margin-right: 5%;"></div>
				<div id = 'columnchart_material2' style =  " display : inline-block;width: 350px; height:300px;"></div>
			</div>
			
			<br/><br/>
			
			<div class = "mypage_box">
		<div class = "item">
			<a href = "index.jsp?content=search.shop">
				<img src = "./mem_images/mypage_1.png"/>
				<div class = "order_list">
					재고관리
				</div>
			</a>
			
			<a href = "index.jsp?content=ReSaleSearch.rcd">
				<img src = "./mem_images/mypage_2.png"/>
				<div class = "interest">
					판매관리
				</div>
			</a>
			
			<a href = "index.jsp?content=refundS.refund">
				<img src = "./mem_images/mypage_3.png"/>
				<div class = "coupon">
					환불/반품
				</div>
			</a>
			
			<a href = "index.jsp?content=insert.shop">
				<img src = "./mem_images/mypage_4.png"/>
				<div class = "savings">
					상품등록
				</div>
			</a>
			
			<a href = "index.jsp?content=go_notice_search.not">
				<img src = "./mem_images/mypage_5.png"/>
				<div class = "deposit">
					공지사항
				</div>
			</a>
			
			<a href = "index.jsp?content=go_question_search.not">
				<img src = "./mem_images/mypage_6.png"/>
				<div class = "deposit2">
					1대1 문의
				</div>
			</a>

		</div>
	</div>
			
			
			
		<div class = "admin_menu2">공지사항 관리</div>
		<div id = 'title' style = "padding:0;  border:0; border-bottom: 1px solid #ccc;">
			<span class = 'no1'>no</span>
			<span class = 'admin1'>작성자</span>
			<span class = 'subject1'>제목</span>
			<span class = 'mDate1'>작성일</span>
			<span class = 'hit1'>조회수</span>
		</div>
		
		<div id = "data-" style = "margin-bottom: 50px;">
			<c:forEach var = "dataa" items = "${list }">
				<div id = 'data'>
					<span class = 'no1'>${dataa.nSerial }</span>
					<span class = 'admin1'>${dataa.nId }</span>
					<span class = 'subject1'>${dataa.nSubject }</span>
					<span class = 'mDate1'>${dataa.nDate }</span>
					<span class = 'hit1'>${dataa.nHit }</span>
				</div>
			</c:forEach>
		</div>
		
		<div class = "admin_menu2">소비자 문의 현황</div>
		
		<div id = 'title' style = "padding:0;  border:0; border-bottom: 1px solid #ccc;">
			<span class = 'no'>no</span>
			<span class = 'kind'>문의분류</span>
			<span class = 'sobi'>작성자</span>
			<span class = 'subject'>제목</span>
			<span class = 'content'>내용</span>
			<span class = 'mDate'>작성일</span>
		</div>
		
		<div id = 'data-b'>
			<c:forEach var = "datab" items = "${listt }">
				<div id = 'data'>
					<span class = 'no'>${datab.qSerial }</span>
					<span class = 'kind'>${datab.qOrder }</span>
					<span class = 'sobi'>${datab.qId }</span>
					<span class = 'subject'>${datab.qSubject }</span>
					<span class = 'content'>${datab.qContent }</span>
					<span class = 'mDate'>${datab.qDate }</span>
				</div>
			</c:forEach>
		</div>
		
		<div id = "div2"></div>
	</form>
</div>
	
 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
   	  var data = google.visualization.arrayToDataTable([
 			   ['Day', 'Outer', 'Top', 'Bottom','Shoes','Acc'],
 			   ['2016', 102, 78,43,48,56] // data 값
		 ]);

        var options = {
          chart: {
            title: '1903기 2조 프로젝트',
            subtitle: '2019년 일간 매출',
          }
        };

        var chart = new google.charts.Bar(document.getElementById('columnchart_material'));

        chart.draw(data, google.charts.Bar.convertOptions(options));
      }
	</script>

 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
    	  var data = google.visualization.arrayToDataTable([
  			   ['Week', 'Outer', 'Top', 'Bottom','Shoes','Acc'],
  			   ['2016', 982, 527, 311,349,245] // data 값
		   ]);

        var options = {
          chart: {
            title: '1903기 2조 프로젝트',
            subtitle: '2019년 주간 매출',
          }
        };

        var chart = new google.charts.Bar(document.getElementById('columnchart_material1'));

        chart.draw(data, google.charts.Bar.convertOptions(options));
      }
	</script>
    
    
 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
  			    ['Month', 'Outer', 'Top', 'Bottom','Shoes','Acc'],
  			    ['2016', 2458, 1751, 1082,1256,764] // data 값
 			 ]);
        	
        var options = {
          chart: {
            title: '1903기 2조 프로젝트',
            subtitle: '2019년 월간 매출',
          }
        };

        var chart = new google.charts.Bar(document.getElementById('columnchart_material2'));

        chart.draw(data, google.charts.Bar.convertOptions(options));
      }
	</script>
	
</body>
</html>






