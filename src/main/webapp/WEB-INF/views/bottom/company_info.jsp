<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="visual_title">
	<div class="img_area">
		<img src="./images/bnr_company_main.jpg" title="회사 이미지" alt="회사 이미지" />
	</div>
	<div class="visual_gon">
		<ul class="title_inner_a">
			<li>
				<p class="descr" designElement="text" textIndex="1" >TRENDY LIVING IDEA /</p> 
				<h2><span designElement="text" textIndex="2" >TOWNHOUSE LOGO</span></h2>
			</li>
		</ul>
	</div>
</div>
<div class="service_section v3">
	<h3 class="title1"><span designElement="text">CONTACT</span></h3>
	<p designElement="text"> <a href="https://map.kakao.com/link/map/37.4966521, 126.84690"><br>서울시 구로구 오류동 라인아파트</p></a>
    <p designElement="text">t. 010-4227-1125</p>
    <p designElement="text">operation hour. 09:00 ~ 18:00 (토,일 휴무)</p>
	<p>
    <div id='page-title-bar-area'>
        <div id='map' style="width:300px;height:300px;">
        <!--지도 API 출력 부분-->
        </div>
        
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=69cce8b8bc86a7f19e1e185470434789&libraries=services,clusterer,drawing"></script>
<script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(37.4966521, 126.846901),
			level: 3
		};

		var map = new kakao.maps.Map(container, options);
		
		// 마커가 표시될 위치입니다 
		var markerPosition  = new kakao.maps.LatLng(37.4966521, 126.846901); 

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
</script>
    </div>
    </p>
    </div>
