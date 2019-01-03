<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=lz0e8vpjrz5ApswJPUqL&submodules=geocoder"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<jsp:include page="/WEB-INF/view/user/include/mainheader.jsp" />
<style>
	    body{ background-color: #fafafa; }
		header{ padding-top: 0px; border: 0px solid #fafafa; }
		ul{ list-style:none; }
		
</style>

<section id="servicecenter" style= margin-top: 170px; "> 
	<div id="wrap" style="color: #272829;">
		<div class="container row">
		  <div class="login_div">
		<div class="main_left col-md-3" style="    margin-bottom: -83px;
		    position: relative;
		    background: #fff;
		    border: 0.1px solid white;
		    box-shadow: 0 12px 15px 0 rgba(0, 0, 5, 0.15);
		    margin-left: 0px;
		    margin-top: 25px; 
		    border-radius: 15px;">
    
    
		<div class="login_div" >
			<ul style="margin-bottom: 768px;">
			<h2 style="color: #387cb8; font-size: 20px; ">정보</h2>
			<li><a target="asd" style="font-size: 20px; background-color: ; color: black; " href="${pageContext.request.contextPath}/company_info">회사소개</a></li>
			<h2 style="color: #387cb8; font-size: 20px; ">법무</h2>
			<li><a target="asd" style="font-size: 20px; background-color: ; color: black; " href="${pageContext.request.contextPath}/policy">개인정보정책</a></li>
			<li><a target="asd" style="font-size: 20px; background-color: ; color: black; " href="${pageContext.request.contextPath}/tos">이용약관</a></li>
			<h2 style="color: #387cb8; font-size: 20px; ">고객센터</h2>
			<li><a target="asd" style="font-size: 20px; background-color: ; color: black; " href="${pageContext.request.contextPath}/notice">공지·건의사항</a>
			</li>
			</ul>
		</div>
	</div>





			
			
		 
			<div class="main_right col-md-9">
			
               
                
                
                		<div class="item" style="    padding: 85px;
    margin-bottom: 22px;
    position: relative;
    background: #fff;
    border: 0.1px solid white;
    box-shadow: 0 12px 15px 0 rgba(0, 0, 5, 0.15);
    margin-left: 11px;
    margin-top: 25px;
    border-radius: 15px; ">
     <h1 id="about-us" style="font-size: 30px; color: #3f80ba; margin-left: 41px;
     ">Jin Seol</h1><br>
			    		<ul style="margin-bottom: 0px;">
			    		<h3>진설의 고객은<em style="color:red;">여러분입니다.</em><br><br><br>	</h3>
			<p>전국을 향해 끊임없이 도전하여 
            No.1 문화관광 유통그룹으로  나아가겠습니다.<br>
            진설는 국내에서 약 4,500명(자회사 포함)이 넘는 직원이 여행서비스를 제공하는 국내 최대 여행기업으로, 20년 연속 여행 및 항공권 판매<br> 1위를 달성하고 있는 1등 여행종합기업입니다.<br>
            진설는 최고의 여행전문 인력과 국내 30여개의 법인과 지사등 현지 네트워크를 통해 한 차원 높은 여행서비스를 제공함으로써 여행산업의 질적 양적 성장을  동시에 이끌어왔으며, 고객 만족도와 여행사 선호도 조사에서 확고한 선두 지위를 확보하고 있습니다.<br>
            No.1
문화관광 유통그룹으로 성장하고자 합니다. 인적자원의 글로벌 역량을 강화하고, 문화관광 유통 관련 사업의 역량을 강화하여 고객에게 국내 최고의 문화관광 유통 서비스를 제공하는 기업으로 성장하겠습니다.
            <br><br><br>
             </p>
             
             <h2 style="font-size: 30px;">오시는길</h2>
             <div class="campusleftbox"><!--왼쪽박스-->
						<span></span>
						<div class="campusleftbox2">
								<p>서울특별시 종로구 삼일대로 17길51 스타골드빌딩 3, 4,5층</p>
								<em>[1호선] 종각역 9번 10번 출구 바로 뒤 스타벅스 골목 100M직진 스타골드빌딩(1층 세븐일레븐) 4층</em>
								<dl>
									<dd>Tel.<strong>02-738-5001</strong></dd>
									<dd>Fax.<strong>02-738-5002</strong></dd>
								</dl>
						</div>
						<div class="campusmap">
							<div id="map" class="map" style="width: 450px; height: 330px; position: relative; overflow: hidden; background: url(&quot;http://i1.daumcdn.net/dmaps/apis/loading_n.png&quot;);"><div style="position: absolute; left: 0px; top: 0px; width: 100%; height: 100%; touch-action: none; cursor: url(&quot;http://i1.daumcdn.net/dmaps/apis/cursor/openhand.cur.ico&quot;) 7 5, url(&quot;http://i1.daumcdn.net/dmaps/apis/cursor/openhand.cur.ico&quot;), default;"><div style="position: absolute; left: 0px; top: 0px;"><div style="position: absolute; z-index: 1; left: 0px; top: 0px;"><img src="http://map2.daumcdn.net/map_2d_hd/1810uis/L8/61/26.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: -148px; top: 231px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="http://map3.daumcdn.net/map_2d_hd/1810uis/L8/61/27.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 108px; top: 231px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="http://map0.daumcdn.net/map_2d_hd/1810uis/L8/61/28.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 364px; top: 231px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="http://map2.daumcdn.net/map_2d_hd/1810uis/L8/62/26.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: -148px; top: -25px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="http://map3.daumcdn.net/map_2d_hd/1810uis/L8/62/27.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 108px; top: -25px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="http://map0.daumcdn.net/map_2d_hd/1810uis/L8/62/28.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 364px; top: -25px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="http://map2.daumcdn.net/map_2d_hd/1810uis/L8/63/26.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: -148px; top: -281px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="http://map3.daumcdn.net/map_2d_hd/1810uis/L8/63/27.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 108px; top: -281px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="http://map0.daumcdn.net/map_2d_hd/1810uis/L8/63/28.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 364px; top: -281px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"></div><div style="position: absolute; z-index: 0; left: 0px; top: 0px;"><img src="http://map2.daumcdn.net/map_2d_hd/1810uis/L7/124/54.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 107.5px; top: 103.5px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 128px; height: 128px;"><img src="http://map3.daumcdn.net/map_2d_hd/1810uis/L7/124/55.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 235.5px; top: 103.5px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 128px; height: 128px;"><img src="http://map0.daumcdn.net/map_2d_hd/1810uis/L7/124/56.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 363.5px; top: 103.5px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 128px; height: 128px;"><img src="http://map2.daumcdn.net/map_2d_hd/1810uis/L7/125/54.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 107.5px; top: -24.5px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 128px; height: 128px;"><img src="http://map3.daumcdn.net/map_2d_hd/1810uis/L7/125/55.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 235.5px; top: -24.5px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 128px; height: 128px;"><img src="http://map0.daumcdn.net/map_2d_hd/1810uis/L7/125/56.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 363.5px; top: -24.5px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 128px; height: 128px;"><img src="http://map2.daumcdn.net/map_2d_hd/1810uis/L7/126/54.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 107.5px; top: -152.5px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 128px; height: 128px;"><img src="http://map3.daumcdn.net/map_2d_hd/1810uis/L7/126/55.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 235.5px; top: -152.5px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 128px; height: 128px;"><img src="http://map0.daumcdn.net/map_2d_hd/1810uis/L7/126/56.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 363.5px; top: -152.5px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 128px; height: 128px;"></div><div style="position: absolute; z-index: 1;"></div><div style="width: 450px; height: 330px; position: absolute; z-index: 1;"></div><div style="position: absolute; z-index: 1;"><svg version="1.1" style="stroke: none; stroke-dashoffset: 0.5; stroke-linejoin: round; fill: none; transform: translateZ(0px); position: absolute; left: -900px; top: -660px; width: 2250px; height: 1650px;" viewBox="0 0 2250 1650"><defs></defs></svg></div><div style="position: absolute; z-index: 1; width: 100%; height: 0px;"><div style="position: absolute; margin: -39px 0px 0px -13px; z-index: 0; left: 341px; top: 98px; display: block;"><img draggable="false" src="http://t1.daumcdn.net/localimg/localimages/07/mapjsapi/2x/default_marker.png" alt="" style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; clip: rect(0px, 40px, 42px, 0px); top: 0px; left: 0px; width: 40px; height: 42px;"><img src="http://i1.daumcdn.net/dmaps/apis/transparent.gif" alt="" draggable="false" usemap="#daum.maps.Marker.Area:b" style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; width: 40px; height: 42px;"><map id="daum.maps.Marker.Area:b" name="daum.maps.Marker.Area:b"><area href="javascript:void(0)" alt="" shape="poly" coords="13,42,9,27,7,23,0,16,0,10,4,4,9,0,17,0,22,4,26,10,26,16,19,23,17,27" title="" style="-webkit-tap-highlight-color: transparent;"></map></div></div></div></div><div style="position: absolute; cursor: default; z-index: 1; white-space: nowrap; font: 11px tahoma, sans-serif; color: rgb(85, 85, 85); left: 7px; bottom: 5px;"><a target="_blank" href="http://map.daum.net/" title="Daum 지도로 보시려면 클릭하세요." style="float: left; width: 38px; height: 17px; cursor: pointer;"><img src="http://t1.daumcdn.net/localimg/localimages/07/mapjsapi/2x/m_bi.png" alt="Daum 지도로 이동" style="width: 37px; height: 18px; border: none;"></a><div style="color: rgb(0, 0, 0); text-align: center; font-size: 10px; margin: 0px 2px; float: left; width: 64px;"><div style="color: rgb(0, 0, 0);">2km</div><div style="position: relative; overflow: hidden; height: 8px; margin-top: -4px;"><img src="http://t1.daumcdn.net/localimg/localimages/07/mapjsapi/2x/scalebar.png" alt="" style="position: absolute; width: 164px; height: 40px; max-width: none; top: -20px; left: -82px;"></div></div><div style="font: 11px tahoma, sans-serif; float: left; margin: 3px 2px 0px;">© Kakao<span></span></div></div><div style="cursor: auto; position: absolute; z-index: 2; left: 0px; top: 0px;"></div></div>
							
							<script>
								var container = document.getElementById('map');
								var options = {
									center: new daum.maps.LatLng(33.450701, 126.570667),
									level: 5
								};
								var map = new daum.maps.Map(container, options);

								// 주소-좌표 변환 객체를 생성합니다
								var geocoder = new daum.maps.services.Geocoder();
								// 주소로 좌표를 검색합니다
								geocoder.addressSearch('서울특별시 종로구 삼일대로 17길51', function(result, status) {

									// 정상적으로 검색이 완료됐으면 
									 if (status === daum.maps.services.Status.OK) {

										var coords = new daum.maps.LatLng(result[0].y, result[0].x);

										// 결과값으로 받은 위치를 마커로 표시합니다
										var marker = new daum.maps.Marker({
											map: map,
											position: coords
										});
										// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
										map.setCenter(coords);
									} 
								});
								
							</script>
						</div>
					</div>
					</ul>
             
             
             
			</div>
                
            
			
			</div>	
		
	</div>
	</div>
			</div>
</section>
<jsp:include page="/WEB-INF/view/user/include/mainfooter.jsp"/>



