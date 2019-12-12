<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


  <title>jQuery UI Draggable - Default functionality</title>

  <style>
  #draggable {   width: 200px;
  						 height: 300px;
  						 padding: 0.5em; 
  						 background-color: #ffffaa;
  						 z-index: 200;
  						 left: 87%;
  						 top: 70%;
  						 position: absolute;
  						 }
  </style>

  <script>
	jQuery(document).ready(function() {
		var y;
		$("#draggable").draggable({
			start: function(){y=0},
			stop: function(){y = $("#draggable").offset().top},
			containment : "window",
			scroll : false
		});
		var boxtop = $("#draggable").offset().top;
		
		$(window).scroll(function() { // 스크롤 기능
			$("#draggable").stop();
			$("#draggable").animate({
				"top" : document.documentElement.scrollTop+y+"px"
			}, 0);
		});
	});
  </script>

</head>
<body>

<div id="draggable" class="ui-widget-content">
  <p>움직이는 사이드바</p>
</div>
 
 
</body>
</html>