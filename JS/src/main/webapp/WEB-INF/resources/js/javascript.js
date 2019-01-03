$(document).ready(function() {

	$('.bxslider').bxSlider({

		mode : 'horizontal',// 가로 방향 수평 슬라이드

		speed : 500, // 이동 속도를 설정

		pager : true, // 현재 위치 페이징 표시 여부 설정

		moveSlides : 1, // 슬라이드 이동시 개수

		// slideWidth: 100, // 슬라이드 너비

		// minSlides: 3, // 최소 노출 개수

		// maxSlides: 3, // 최대 노출 개수

		// slideMargin: 5, // 슬라이드간의 간격

		auto : true, // 자동 실행 여부

		autoHover : true, // 마우스 호버시 정지 여부

		controls : true
	// 이전 다음 버튼 노출 여부

	});
});
