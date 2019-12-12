<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>slide</title>

</head>
<body>
	<!-- 슬라이드 -->
	<div id="slider-wrap">
		<ul id="slider">
			<li>
				<div>
					
				</div> <img src="http://www.elandrs.com/upload/dspl/banner/10/973/00/191100000157973.jpg">
			</li>

			<li>
				<div>
					
				</div> <img src="http://www.elandrs.com/upload/dspl/banner/10/790/00/191000000156790.jpg">
			</li>

			<li>
				<div>
					
				</div> <img src="http://www.elandrs.com/upload/dspl/banner/10/897/00/191000000157897.jpg">
			</li>

			<li>
				<div>
					
				</div> <img src="http://www.elandrs.com/upload/dspl/banner/10/264/00/191000000155264.jpg">
			</li>

			<li>
				<div>
				</div> <img src="http://www.elandrs.com/upload/dspl/banner/10/893/00/191000000157893.jpg">
			</li>
		</ul>

		<div class="slider-btns" id="next">
			<span>▶</span>
		</div>
		<div class="slider-btns" id="previous">
			<span>◀</span>
		</div>

		<div id="slider-pagination-wrap">
			<ul>
			</ul>
		</div>
	</div>
	<br/><br/>
</body>
<script>
	//슬라이더
	//slide-wrap
	var slideWrapper = document.getElementById('slider-wrap');
	//current slideIndexition
	var slideIndex = 0;
	//items
	var slides = document.querySelectorAll('#slider-wrap ul li');
	//number of slides
	var totalSlides = slides.length;
	//get the slide width
	var sliderWidth = slideWrapper.clientWidth;
	//set width of items
	slides.forEach(function(element) {
		element.style.width = sliderWidth + 'px';
	})
	//set width to be 'x' times the number of slides
	var slider = document.querySelector('#slider-wrap ul#slider');
	slider.style.width = sliderWidth * totalSlides + 'px';

	// next, prev
	var nextBtn = document.getElementById('next');
	var prevBtn = document.getElementById('previous');
	nextBtn.addEventListener('click', function() {
		plusSlides(1);
	});
	prevBtn.addEventListener('click', function() {
		plusSlides(-1);
	});

	// hover
	slideWrapper.addEventListener('mouseover', function() {
		this.classList.add('active');
		clearInterval(autoSlider);
	});
	slideWrapper.addEventListener('mouseleave', function() {
		this.classList.remove('active');
		autoSlider = setInterval(function() {
			plusSlides(1);
		}, 2000);
	});

	function plusSlides(n) {
		showSlides(slideIndex += n);
	}

	function currentSlides(n) {
		showSlides(slideIndex = n);
	}

	function showSlides(n) {
		slideIndex = n;
		if (slideIndex == -1) {
			slideIndex = totalSlides - 1;
		} else if (slideIndex === totalSlides) {
			slideIndex = 0;
		}

		slider.style.left = -(sliderWidth * slideIndex) + 'px';
		pagination();
	}

	//pagination
	slides.forEach(function() {
		var li = document.createElement('li');
		document.querySelector('#slider-pagination-wrap ul').appendChild(li);
	})

	function pagination() {
		var dots = document.querySelectorAll('#slider-pagination-wrap ul li');
		dots.forEach(function(element) {
			element.classList.remove('active');
		});
		dots[slideIndex].classList.add('active');
	}

	pagination();
	var autoSlider = setInterval(function() {
		plusSlides(1);
	}, 2000);
</script>
</html>