<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
  <head>
  <style type="text/css">
  .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
    
    .overlayImage{
    	float: left;
    	width: 30%;
    	height: 120px;
    }
  </style>
  
    <!-- Required meta tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="keywords" content="Bootstrap, Landing page, Template, Registration, Landing">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="author" content="Grayrids">
    <title>산책하개</title>
  </head>
  <body>
  	<jsp:include page="/WEB-INF/views/templates/Top.jsp"/>
  	<!-- Header Section Start -->
	<section id="services" class="section" style="padding-top:200px ; height: 400px ;background-image: url('<c:url value="/resources/img/background/doghug.jpg"/>');">
      <div class="container" >
        <div class="section-header">          
          <h2 class="section-title wow fadeIn" data-wow-duration="1000ms" data-wow-delay="0.3s">돌보미 <span>신청 지도</span></h2>
          <hr class="lines wow zoomIn" data-wow-delay="0.3s">
          <p class="section-subtitle wow fadeIn" data-wow-duration="1000ms" data-wow-delay="0.3s">신청공고를 지도로 보실 수 있습니다</p>
        </div>
      </div>
    </section>
    <div class="page-title" style="background-color: #f5efb4; text-align: center;">
		<a href="<c:url value="/Care/TrainerInfo.do"/>">돌보미 정보</a>
		<a href="<c:url value="/Care/TrainerMain.do"/>"> 대리산책</a>
		<a class="on" href="<c:url value="/Care/CareServiceMap.do"/>">대리산책지도(지도)</a>
		<a href="<c:url value="/Care/TrainerDoing.do"/>">진행중인 서비스</a>
    </div>
     <section id="blog" class="section">
      <!-- Container Starts -->
      <div class="container">
      	<div class="row">
      		<div class="col-md-9">
        		<p style="font-size: 2em; font-weight: bold;">진행중인 돌봄(지도)입니다</p>
        		<p style="color: gray;">집 주위 마커를 눌러서 공고를 확인하세요~</p>
			 	위치로 찾기:
			 	<input type="button" id="default" name="default" value="기본값(서울역)">
				<input type="button" id="nowlocation" name="nowlocation" value="현재위치로 찾기">
				<input type="button" id="addrlocation" name="addrlocation" value="주소지로 찾기">
				<p>
					지역으로 찾기:
					<select name="sido" id="sido" onchange="sidoChange(this)" style="width:120px;height:30px">
						      <option disabled selected value="">시/도 선택</option>
						      <option value="서울">서울</option>
						      <option value="인천">인천</option>
						      <option value="경기">경기</option>
						      <option value="강원">강원</option>
						      <option value="부산">부산</option>
					</select>
					<select name="sggu" id="sggu" style="width:120px;height:30px">
						      <option disabled selected value="">시/군/구 선택</option>
					</select>
					<input type="button" id="selectlocation" name="selectlocation" value="지역선택확인">
			</div>
			
			 <div id="map" style="width:100%;height:350px;"></div>
		</div>
        </div>
       
    </section>       
    
    <jsp:include page="/WEB-INF/views/templates/Foot.jsp"/>

    

    <!-- jQuery first, then Tether, then Bootstrap JS. -->
    <script src="<c:url value="/resources/js/jquery-min.js"/>"></script>
    <script src="<c:url value="/resources/js/tether.min.js"/>"></script>
    <script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
    <script src="<c:url value="/resources/js/classie.js"/>"></script>
    <script src="<c:url value="/resources/js/mixitup.min.js"/>"></script>
    <script src="<c:url value="/resources/js/nivo-lightbox.js"/>"></script>
    <script src="<c:url value="/resources/js/owl.carousel.min.js"/>"></script>    
    <script src="<c:url value="/resources/js/jquery.stellar.min.js"/>"></script>    
    <script src="<c:url value="/resources/js/jquery.nav.js"/>"></script>    
    <script src="<c:url value="/resources/js/smooth-scroll.js"/>"></script>   
    <script src="<c:url value="/resources/js/wow.js"/>"></script> 
    <script src="<c:url value="/resources/js/jquery.vide.js"/>"></script>
    <script src="<c:url value="/resources/js/jquery.counterup.min.js"/>"></script>    
    <script src="<c:url value="/resources/js/jquery.magnific-popup.min.js"/>"></script>    
    <script src="<c:url value="/resources/js/waypoints.min.js"/>"></script>    
    <script src="<c:url value="/resources/js/form-validator.min.js"/>"></script>
    <script src="<c:url value="/resources/js/contact-form-script.js"/>"></script>     
    <script src="<c:url value="/resources/js/main.js"/>"></script>
    <script src='<c:url value="/resources/lib/main.js"/>'></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
   <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d963a4891fae00b5fd892884ae34a387&libraries=services"></script>
   <script >
  		var N="";
  		var E="";
		var strArr = '${str}'.split("/");
		var ntrArr = '${ntr}'.split("/");
		var ptrArr = '${ptr}'.split("/");
		var ttr1Arr = '${ttr1}'.split("/");
		var ttr2Arr = '${ttr2}'.split("/");
		var itr='${itr}'.split("/");
		var arr = [];
		for(var i = 0; i<strArr.length-1;i++){
			var xpoint =(JSON.parse(strArr[i])).test[0].La;
			var ypoint =(JSON.parse(strArr[i])).test[0].Ma;
			var care_no=ntrArr[i];
			var care_price=ptrArr[i];
			var care_datepicker=ttr1Arr[i];
			var care_timepicker=ttr2Arr[i];
			arr[i] = {
					content:"\'"+care_no+"\'",
					latlng: new kakao.maps.LatLng(ypoint,xpoint)
					};
		}/////for
		
		function mapping(arr){	 
			var positions = arr;
			//[{latlng: new kakao.maps.LatLng(x,y)},];
		
			// 마커 이미지의 이미지 주소입니다
			var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
			var arr2 = [];
			var markArr = [];
			for (var i = 0; i < positions.length; i ++) {
			    
			    // 마커 이미지의 이미지 크기 입니다
			    var imageSize = new kakao.maps.Size(24, 35); 
			    
			    // 마커 이미지를 생성합니다    
			    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
			    
			    // 마커를 생성합니다
			    markArr[i] = new kakao.maps.Marker({
			        map: map, // 마커를 표시할 지도
			        position: positions[i].latlng, // 마커를 표시할 위치
			        image : markerImage // 마커 이미지 
		    });
		    
		    
		    var content = '<div class="wrap">' + 
							   	'	<div class= "info">'+
							    '    <div class="title">' + 
							    ntrArr[i]+"번째 게시물" +
					            '    </div>'+
						        '    <div class="body" >'+
						        '		<img class="overlayImage" src="<c:url value="/upload/'+itr[i]+'"/>">'+
						        '		일시: '+ttr1Arr[i]+"&nbsp;"+ttr2Arr[i]+
						        '<br/>'+
						        '		가격: '+ptrArr[i]+
						        '<br/>'+
						        '		<a href="<c:url value="/Care/CareView.do?care_no='+ntrArr[i]+'"/>">홈페이지 이동</a>' + 
						        '	 </div>'+
						        '	</div>'+
						        '</div>';
	       
	        
						     // 마커 위에 커스텀오버레이를 표시합니다
						     // 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
						     arr2[i] = new kakao.maps.CustomOverlay({
						         content: content,
						         map: map,
						         position: markArr[i].getPosition()       
						     });
						     arr2[i].setMap(null);
						     // 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
						     kakao.maps.event.addListener(markArr[i], 'click', function() {
						    	 if(arr2[markArr.indexOf(this)].getMap()==null){
						    	 arr2[markArr.indexOf(this)].setMap(map);}
						     else{arr2[markArr.indexOf(this)].setMap(null);
						    	 }
						     
						     });
					}
			     // 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
			     function closeOverlay(index) {
			    	 arr2[index].setMap(null);     
			     }
			}
		
		
		
		
		
		
		
		
		
//1]
			//1] 버튼 선택안했을시 처음 띄울 지도 위치(서울역)
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(37.5559, 126.9723), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };  
			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption); 
//2]		
			//2]디폴트 서울역
			$("#default").click(function(){
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = {
			        center: new kakao.maps.LatLng(37.5559, 126.9723), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    }
			  
				// 지도를 생성합니다    
				map = new kakao.maps.Map(mapContainer, mapOption); 
				
				
				mapping(arr);
			});
			
//3]			
			//3]지금 내위치기준 찾기
			$("#nowlocation").click(function(){
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = {
			        center: new kakao.maps.LatLng(37.5559, 126.9723), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };  
				// 지도를 생성합니다    
				map = new kakao.maps.Map(mapContainer, mapOption); 
				
				if (navigator.geolocation) {
				    
				    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
				    navigator.geolocation.getCurrentPosition(function(position) {
				        
				        var lat = position.coords.latitude, // 위도
				            lon = position.coords.longitude; // 경도
				        
				        var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
				            message = '<div style="padding:5px;">현재 위치</div>'; // 인포윈도우에 표시될 내용입니다
				        
				        // 마커와 인포윈도우를 표시합니다
				        displayMarker(locPosition, message);
				            
				      });
				} 
				else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
				    
				    var locPosition = new kakao.maps.LatLng(37.5559, 126.9723),    
				        message = 'geolocation을 사용할수 없어요..'
				        
				    displayMarker(locPosition, message);
				}

				// 지도에 마커와 인포윈도우를 표시하는 함수입니다
				function displayMarker(locPosition, message) {

				    // 마커를 생성합니다
				    var marker = new kakao.maps.Marker({  
				        map: map, 
				        position: locPosition
				    }); 
				    
				    var iwContent = message, // 인포윈도우에 표시할 내용
				        iwRemoveable = true;

				    // 인포윈도우를 생성합니다
				    var infowindow = new kakao.maps.InfoWindow({
				        content : iwContent,
				        removable : iwRemoveable
				    });
				    
				    // 인포윈도우를 마커위에 표시합니다 
				    infowindow.open(map, marker);
				    
				    // 지도 중심좌표를 접속위치로 변경합니다
				    map.setCenter(locPosition);      
				}
				
				mapping(arr);
			});	////nowlocation
				
//4]
			//4]주소값주위 맵 띄우기
			$("#addrlocation").click(function(){	
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = {
			        center: new kakao.maps.LatLng(37.5559, 126.9723), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };  
				// 지도를 생성합니다    
				map = new kakao.maps.Map(mapContainer, mapOption); 
		
				// 주소-좌표 변환 객체를 생성합니다
				var geocoder = new kakao.maps.services.Geocoder();
			
				// 주소로 좌표를 검색합니다
				geocoder.addressSearch("'"+'${records.ADDR}'+"'", function(result, status) {
				
				    // 정상적으로 검색이 완료됐으면 
				     if (status === kakao.maps.services.Status.OK) {
			
				        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			
				   
			
				        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				        map.setCenter(coords);
				    }
				 
				}); ///////geocoder 
				
				mapping(arr);
			});//addrlocation

		function sidoChange(e) {
			var sggu_a = ["종로구", "중구", "용산구", "성동구","광진구","마포구"];
			var sggu_b = ["강화군", "서구", "계양구", "남구","부평구"];
			var sggu_c = ["수원", "의왕", "남양주", "부천", "광주"];
			var sggu_d = ["춘천", "홍천", "횡성", "화천", "철원"];
			var sggu_e = ["강서구", "사하구", "사상구", "북구", "금정구"];
			var target = document.getElementById("sggu");
	
			if(e.value == "서울") var f = sggu_a;
			else if(e.value == "인천") var f = sggu_b;
			else if(e.value == "경기") var f = sggu_c;
			else if(e.value == "강원") var f = sggu_d;
			else if(e.value == "부산") var f = sggu_e;
	
			target.options.length = 0;
	
			for (x in f) {
				var opt = document.createElement("option");
				opt.value = f[x];
				opt.innerHTML = f[x];
				target.appendChild(opt);
			}	
		}/////////////지역 선택
		$(function(){
			$("#selectlocation").click(function(){
				 var sido=$("#sido").val();
				 var sggu=$("#sggu").val();
				 if(sggu!=null){
				 console.log("지역선택:",sido);
				 console.log("지역선택:",sggu);
				 if(sido=='서울' && sggu=='종로구'){N=37.5728;E=126.9792;}
				 if(sido=='서울' && sggu=='중구'){N=37.5639;E=126.9975;}
				 if(sido=='서울' && sggu=='용산구'){N=37.5327;E=126.9900;}
				 if(sido=='서울' && sggu=='성동구'){N=37.5635;E=127.0367;}
				 if(sido=='서울' && sggu=='광진구'){N=37.5388;E=127.0823;}
				 if(sido=='서울' && sggu=='마포구'){N=37.5672;E=126.9019;}
				 if(sido=='인천' && sggu=='강화군'){N=37.5728;E=126.9792;}
				 if(sido=='인천' && sggu=='서구'){N=37.5728;E=126.9792;}
				 if(sido=='인천' && sggu=='계양구'){N=37.5728;E=126.9792;}
				 if(sido=='인천' && sggu=='남구'){N=37.5728;E=126.9792;}
				 if(sido=='인천' && sggu=='부평구'){N=37.5728;E=126.9792;}
				 if(sido=='경기' && sggu=='수원'){N=37.5728;E=126.9792;}
				 if(sido=='경기' && sggu=='의왕'){N=37.5728;E=126.9792;}
				 if(sido=='경기' && sggu=='남양주'){N=37.5728;E=126.9792;}
				 if(sido=='경기' && sggu=='부천'){N=37.5728;E=126.9792;}
				 if(sido=='경기' && sggu=='광주'){N=37.5728;E=126.9792;}
				 if(sido=='강원' && sggu=='춘천'){N=37.5728;E=126.9792;}
				 if(sido=='강원' && sggu=='홍천'){N=37.5728;E=126.9792;}
				 if(sido=='강원' && sggu=='횡성'){N=37.5728;E=126.9792;}
				 if(sido=='강원' && sggu=='화천'){N=37.5728;E=126.9792;}
				 if(sido=='강원' && sggu=='철원'){N=37.5728;E=126.9792;}
				 if(sido=='부산' && sggu=='강서구'){N=37.5728;E=126.9792;}
				 if(sido=='부산' && sggu=='사하구'){N=37.5728;E=126.9792;}
				 if(sido=='부산' && sggu=='사상구'){N=37.5728;E=126.9792;}
				 if(sido=='부산' && sggu=='북구'){N=37.5728;E=126.9792;}
				 if(sido=='부산' && sggu=='금정구'){N=37.5728;E=126.9792;}
				 
				 var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				    mapOption = {
				        center: new kakao.maps.LatLng(N, E), // 지도의 중심좌표
				        level: 3 // 지도의 확대 레벨
				    };  
					// 지도를 생성합니다    
					map = new kakao.maps.Map(mapContainer, mapOption); 
				 
				 }
				 mapping(arr);
			});
		});///선택시 위도 경도 설정
		
		
	
		
		mapping(arr);
  	</script>
  </body>
</html>