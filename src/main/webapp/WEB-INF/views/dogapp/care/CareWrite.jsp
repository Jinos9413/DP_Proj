<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <!-- Required meta tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="keywords" content="Bootstrap, Landing page, Template, Registration, Landing">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="author" content="Grayrids">
    <title>강아지를 부탁해</title>
    <style>
	   .dot {overflow:hidden;float:left;width:12px;height:12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/mini_circle.png');}    
	   .dotOverlay {position:relative;bottom:10px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;font-size:12px;padding:5px;background:#fff;}
	   .dotOverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}    
	   .number {font-weight:bold;color:#ee6152;}
	   .dotOverlay:after {content:'';position:absolute;margin-left:-6px;left:50%;bottom:-8px;width:11px;height:8px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white_small.png')}
	   .distanceInfo {position:relative;top:5px;left:5px;list-style:none;margin:0;}
	   .distanceInfo .label {display:inline-block;width:50px;}
	   .distanceInfo:after {content:none;}
	   #drawingMap, #map {width: 100%;height: 350px;}
	   #map {margin-top: 10px;}
	</style>
  </head>
  <body>
  	<jsp:include page="/WEB-INF/views/templates/Top.jsp"/>
  	<!-- Header Section Start -->
	<section id="services" class="section" style="padding-top:200px ; height: 400px ;background-image: url('<c:url value="/resources/img/background/doghug.jpg"/>');">
      <div class="container" >
        <div class="section-header">          
          <h2 class="section-title wow fadeIn" data-wow-duration="1000ms" data-wow-delay="0.3s">돌봄 및 산책 <span>신청 현황</span></h2>
          <hr class="lines wow zoomIn" data-wow-delay="0.3s">
          <p class="section-subtitle wow fadeIn" data-wow-duration="1000ms" data-wow-delay="0.3s">현재 신청 현황을 보실 수 있습니다</p>
        </div>
      </div>
    </section>
    <div class="page-title" style="background-color: #f5efb4; text-align: center;">
		<a class="on" href="<c:url value="/Care/CareServiceMain.do"/>">돌봄 신청현황</a>
   		<a href="<c:url value="/Care/CareServiceDoing.do"/>">진행중인 돌봄</a>
   		<a href="<c:url value="/Care/CareServiceDone.do"/>">종료된 돌봄</a>
    </div>
     <section id="blog" class="section">
      <!-- Container Starts -->
      <div class="container">
		<div class="page-header; padding:1000px" >
				
		</div>
		<div class="row">
		<div class="col-md-12">
		
			<form method="post" action="<c:url value='/Care/CareWrite.do'/>" method="post" id="frm" enctype="multipart/form-data">
				<div class="row">
					<div class="col-md-offset-1 col-md-2">
						<div class="form-group" style="line-height: 50px;">
							<span style="color: orange; font-size: 1.5em;">사진등록</span>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group" id="imagePreview" style="text-align: center;">
							<img style="height: 150px; width: 150px;" src="<c:url value="/resources/img/basicperson.png"/>">
						</div>
					</div>
					<div class="col-md-2">
						<div class="form-group">
							<label class="btn btn-common" for="real-input">파일선택</label>
							<input type="file" name="care_images" id="real-input" multiple="multiple" 
								accept="image/gif, image/jpeg, image/png" style="display: none;">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-offset-1 col-md-2">
						<div class="form-group" style="line-height: 50px;">
							<span style="color: orange; font-size: 1.5em;">제목</span>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<input style="color: black;" type="text" class="form-control" name="care_title" placeholder="제목을 입력하세요?">
						</div>
					</div>
					<div class="col-md-2">
						<div class="form-group">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-offset-1 col-md-2">
						<div class="form-group" style="line-height: 50px;">
							<span style="color: orange; font-size: 1.5em;">금액</span>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group" style="width: 60%;">
							<input style="color: black;" type="text" class="form-control" id="board_price" name="care_price" placeholder="금액을 입력하세요" />
						</div>
					</div>
					<div class="col-md-2">
						<div class="form-group">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-offset-1 col-md-2">
						<div class="form-group" style="line-height: 50px;">
							<span style="color: orange; font-size: 1.5em;">날짜/시간</span>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group" >
							<input type="text" name="care_datepicker" id="datepicker"  placeholder="날짜선택" readonly="readonly"
								 style="width: 45%; margin-bottom: 15px; padding: 10px; font-size: 14px; border-radius: 4px;
								  border-color: #CCCCCC; border-style: solid; border-width: 1px;"/>
						    <select name="care_timepicker" id="timepicker" style="width: 45%; margin-bottom: 15px; padding: 10px;
						     	 font-size: 14px; border-radius: 4px; border-color: #CCCCCC;">
						      <option disabled selected value="">시간선택</option>
						      <option>7시</option><option>8시</option><option>9시</option><option>10시</option><option>11시</option>
						      <option>12시</option><option>13시</option><option>14시</option><option>15시</option><option>16시</option>
						      <option>17시</option><option>18시</option><option>19시</option><option>20시</option><option>21시</option><option>22시</option>
						    </select>
						</div>
					</div>
					<div class="col-md-2">
						<div class="form-group">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-offset-1 col-md-2">
						<div class="form-group" style="line-height: 50px;">
							<span style="color: orange; font-size: 1.5em;">내용</span>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group" >
							<textarea style="color: black;" rows="5" class="form-control" name="care_content" placeholder="내용을 입력하세요"></textarea>
						</div>
					</div>
					<div class="col-md-2">
						<div class="form-group">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-offset-1 col-md-10">
						<div id="map"></div>
					</div>
				</div> 
				<div class="form-group">
					<input type="hidden" id="testtext" name="care_clickLineL" ><!--  데이터 넘기기!!-->
					<input type="hidden" id="testtext2" name="care_clickLineP" >
					<input type="hidden" id="testtext3" name="care_clickLineA" >
					<div style="text-align: center;">
						<button type="submit" class="btn btn-primary">등록</button>
					</div>
				</div>
			</form>
		</div>
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
    <jsp:include page="/WEB-INF/views/templates/Notice.jsp"/>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d963a4891fae00b5fd892884ae34a387&libraries=services"></script>
   <script>
   
   		//지도:Cacao Map Api
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	    mapOption = { 
	        center: new kakao.maps.LatLng(37.5559, 126.9723), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };//

	   var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	   
	 //주소-좌표 변환 객체를 생성합니다
	   var geocoder = new kakao.maps.services.Geocoder();

	   geocoder.addressSearch('${addr.ADDR}', function(result, status) {
		     if (status === kakao.maps.services.Status.OK) {
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		        map.setCenter(coords);
		    } 
		});    
	   
	   var detailAddr;//care_clickLineA
	   var drawingFlag = false; // 선이 그려지고 있는 상태를 가지고 있을 변수입니다
	   var moveLine; // 선이 그려지고 있을때 마우스 움직임에 따라 그려질 선 객체 입니다
	   var clickLine; // 마우스로 클릭한 좌표로 그려질 선 객체입니다
	   var distanceOverlay; // 선의 거리정보를 표시할 커스텀오버레이 입니다
	   var dots = {}; // 선이 그려지고 있을때 클릭할 때마다 클릭 지점과 거리를 표시하는 커스텀 오버레이 배열입니다.
	   function searchDetailAddrFromCoords(coords, callback) {
		   // 좌표로 법정동 상세 주소 정보를 요청합니다
		   geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
		}
	   // 지도에 클릭 이벤트를 등록합니다
	   // 지도를 클릭하면 선 그리기가 시작됩니다 그려진 선이 있으면 지우고 다시 그립니다
	   kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
		   searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
    	       if (status === kakao.maps.services.Status.OK) {
    	           detailAddr = result[0].address.address_name;
    	   		   $('#testtext3').val(detailAddr);
    	       }
    	   });
	       // 마우스로 클릭한 위치입니다 
	       var clickPosition = mouseEvent.latLng;
	   
	       // 지도 클릭이벤트가 발생했는데 선을 그리고있는 상태가 아니면
	       if (!drawingFlag) {
	    	   

	           // 상태를 true로, 선이 그리고있는 상태로 변경합니다
	           drawingFlag = true;
	           
	           // 지도 위에 선이 표시되고 있다면 지도에서 제거합니다
	           deleteClickLine();
	           
	           // 지도 위에 커스텀오버레이가 표시되고 있다면 지도에서 제거합니다
	           deleteDistnce();
	   
	           // 지도 위에 선을 그리기 위해 클릭한 지점과 해당 지점의 거리정보가 표시되고 있다면 지도에서 제거합니다
	           deleteCircleDot();
	    
	           // 클릭한 위치를 기준으로 선을 생성하고 지도위에 표시합니다
	           clickLine = new kakao.maps.Polyline({
	               map: map, // 선을 표시할 지도입니다 
	               path: [clickPosition], // 선을 구성하는 좌표 배열입니다 클릭한 위치를 넣어줍니다
	               strokeWeight: 3, // 선의 두께입니다 
	               strokeColor: '#db4040', // 선의 색깔입니다
	               strokeOpacity: 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
	               strokeStyle: 'solid' // 선의 스타일입니다
	           });
	        
	           // 선이 그려지고 있을 때 마우스 움직임에 따라 선이 그려질 위치를 표시할 선을 생성합니다
	           moveLine = new kakao.maps.Polyline({
	               strokeWeight: 3, // 선의 두께입니다 
	               strokeColor: '#db4040', // 선의 색깔입니다
	               strokeOpacity: 0.5, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
	               strokeStyle: 'solid' // 선의 스타일입니다    
	           });
	       
	           // 클릭한 지점에 대한 정보를 지도에 표시합니다
	           displayCircleDot(clickPosition, 0);

	            
	       } 
	       else { // 선이 그려지고 있는 상태이면
	   
	           // 그려지고 있는 선의 좌표 배열을 얻어옵니다
	           var path = clickLine.getPath();
	   
	           // 좌표 배열에 클릭한 위치를 추가합니다
	           path.push(clickPosition);
	           
	           // 다시 선에 좌표 배열을 설정하여 클릭 위치까지 선을 그리도록 설정합니다
	           clickLine.setPath(path);
	   
	           var distance = Math.round(clickLine.getLength());
	           displayCircleDot(clickPosition, distance);
	      }
	   });
	    
	// 지도에 마우스무브 이벤트를 등록합니다
	// 선을 그리고있는 상태에서 마우스무브 이벤트가 발생하면 그려질 선의 위치를 동적으로 보여주도록 합니다
	kakao.maps.event.addListener(map, 'mousemove', function (mouseEvent) {

	    // 지도 마우스무브 이벤트가 발생했는데 선을 그리고있는 상태이면
	    if (drawingFlag){
	        
	        // 마우스 커서의 현재 위치를 얻어옵니다 
	        var mousePosition = mouseEvent.latLng; 

	        // 마우스 클릭으로 그려진 선의 좌표 배열을 얻어옵니다
	        var path = clickLine.getPath();
	        
	        // 마우스 클릭으로 그려진 마지막 좌표와 마우스 커서 위치의 좌표로 선을 표시합니다
	        var movepath = [path[path.length-1], mousePosition];
	        moveLine.setPath(movepath);    
	        moveLine.setMap(map);
	        
	     	// 선의 총 거리를 계산합니다
	        var distance = Math.round(clickLine.getLength() + moveLine.getLength()),
	        // 커스텀오버레이에 추가될 내용입니다
	            content = '<div class="dotOverlay distanceInfo">총거리 <span class="number">'+ distance + '</span>m</div>'; 
	        // 거리정보를 지도에 표시합니다
	        showDistance(content, mousePosition);   
	    }             
	});                 

	// 지도에 마우스 오른쪽 클릭 이벤트를 등록합니다
	// 선을 그리고있는 상태에서 마우스 오른쪽 클릭 이벤트가 발생하면 선 그리기를 종료합니다
	kakao.maps.event.addListener(map, 'rightclick', function (mouseEvent) {
	    // 지도 오른쪽 클릭 이벤트가 발생했는데 선을 그리고있는 상태이면
	    if (drawingFlag) {
	        // 마우스무브로 그려진 선은 지도에서 제거합니다
	        moveLine.setMap(null);
	        moveLine = null;  
	        // 마우스 클릭으로 그린 선의 좌표 배열을 얻어옵니다
	        var path = clickLine.getPath();
	        // 선을 구성하는 좌표의 개수가 2개 이상이면
	        if (path.length > 1) {
	            // 마지막 클릭 지점에 대한 거리 정보 커스텀 오버레이를 지웁니다
	            if (dots[dots.length-1].distance) {
	                dots[dots.length-1].distance.setMap(null);
	                dots[dots.length-1].distance = null;    
	            }
	            var distance = Math.round(clickLine.getLength()), // 선의 총 거리를 계산합니다
	                content = getTimeHTML(distance); // 커스텀오버레이에 추가될 내용입니다
	            // 그려진 선의 거리정보를 지도에 표시합니다
	            showDistance(content, path[path.length-1]);  
	         
	        } else {
	            // 선을 구성하는 좌표의 개수가 1개 이하이면 
	            // 지도에 표시되고 있는 선과 정보들을 지도에서 제거합니다.
	            deleteClickLine();
	            deleteCircleDot(); 
	            deleteDistnce();
	        }
	        $('#testtext').val(Math.round(clickLine.getLength()));
	        var testdata = clickLine.getPath();
	        console.log(testdata);
	        //var clickLineP=JSON.stringify(clickLine.getPath());
	        var clickLineP=JSON.stringify({"test":testdata});      
	        var json = JSON.parse(clickLineP);
	        
	        $('#testtext2').val(clickLineP);
	        $('#testtext3').val(detailAddr);
	        // 상태를 false로, 그리지 않고 있는 상태로 변경합니다
	        drawingFlag = false;          
	    }  
	});    

	// 클릭으로 그려진 선을 지도에서 제거하는 함수입니다
	function deleteClickLine() {
	    if (clickLine) {
	        clickLine.setMap(null);    
	        clickLine = null;        
	    }
	}

	// 마우스 드래그로 그려지고 있는 선의 총거리 정보를 표시하거
	// 마우스 오른쪽 클릭으로 선 그리가 종료됐을 때 선의 정보를 표시하는 커스텀 오버레이를 생성하고 지도에 표시하는 함수입니다
	function showDistance(content, position) {
	    if (distanceOverlay) { // 커스텀오버레이가 생성된 상태이면	        
	        // 커스텀 오버레이의 위치와 표시할 내용을 설정합니다
	        distanceOverlay.setPosition(position);
	        distanceOverlay.setContent(content);	        
	    } else { // 커스텀 오버레이가 생성되지 않은 상태이면        
	        // 커스텀 오버레이를 생성하고 지도에 표시합니다
	        distanceOverlay = new kakao.maps.CustomOverlay({
	            map: map, // 커스텀오버레이를 표시할 지도입니다
	            content: content,  // 커스텀오버레이에 표시할 내용입니다
	            position: position, // 커스텀오버레이를 표시할 위치입니다.
	            xAnchor: 0,
	            yAnchor: 0,
	            zIndex: 3  
	        });      
	    } 
	}

	// 그려지고 있는 선의 총거리 정보와 
	// 선 그리가 종료됐을 때 선의 정보를 표시하는 커스텀 오버레이를 삭제하는 함수입니다
	function deleteDistnce () {
	    if (distanceOverlay) {
	        distanceOverlay.setMap(null);
	        distanceOverlay = null;
	    }
	}

	// 선이 그려지고 있는 상태일 때 지도를 클릭하면 호출하여 
	// 클릭 지점에 대한 정보 (동그라미와 클릭 지점까지의 총거리)를 표출하는 함수입니다
	function displayCircleDot(position, distance) {

	    // 클릭 지점을 표시할 빨간 동그라미 커스텀오버레이를 생성합니다
	    var circleOverlay = new kakao.maps.CustomOverlay({
	        content: '<span class="dot"></span>',
	        position: position,
	        zIndex: 1
	    });
	    // 지도에 표시합니다
	    circleOverlay.setMap(map);
	    if (distance > 0) {
	        // 클릭한 지점까지의 그려진 선의 총 거리를 표시할 커스텀 오버레이를 생성합니다
	        var distanceOverlay = new kakao.maps.CustomOverlay({
	            content: '<div class="dotOverlay">거리 <span class="number">' + distance + '</span>m</div>',
	            position: position,
	            yAnchor: 1,
	            zIndex: 2
	        });
	        // 지도에 표시합니다
	        distanceOverlay.setMap(map);
	    }
	    // 배열에 추가합니다
	    dots.push({circle:circleOverlay, distance: distanceOverlay});
	}

	// 클릭 지점에 대한 정보 (동그라미와 클릭 지점까지의 총거리)를 지도에서 모두 제거하는 함수입니다
	function deleteCircleDot() {
	    var i;
	    for ( i = 0; i < dots.length; i++ ){
	        if (dots[i].circle) { 
	            dots[i].circle.setMap(null);
	        }
	        if (dots[i].distance) {
	            dots[i].distance.setMap(null);
	        }
	    }
	    dots = [];
	}

	// 마우스 우클릭 하여 선 그리기가 종료됐을 때 호출하여 
	// 그려진 선의 총거리 정보와 거리에 대한 도보, 자전거 시간을 계산하여
	// HTML Content를 만들어 리턴하는 함수입니다
	function getTimeHTML(distance) {
		
	    // 도보의 시속은 평균 4km/h 이고 도보의 분속은 67m/min입니다
	    var walkkTime = distance / 67 | 0;
	    var walkHour = '', walkMin = '';

	    // 계산한 도보 시간이 60분 보다 크면 시간으로 표시합니다
	    if (walkkTime > 60) {
	        walkHour = '<span class="number">' + Math.floor(walkkTime / 60) + '</span>시간 '
	    }
	    walkMin = '<span class="number">' + walkkTime % 60 + '</span>분'

	    // 거리와 도보 시간, 자전거 시간을 가지고 HTML Content를 만들어 리턴합니다
	    var content = '<ul class="dotOverlay distanceInfo">';
	    content += '    <li>';
	    content += '        <span class="label">총거리</span><span class="number">' + distance + '</span>m';
	    content += '    </li>';
	    content += '    <li>';
	    content += '        <span class="label">도보</span>' + walkHour + walkMin;
	    content += '    </li>';
	    content += '</ul>'
	    return content;   
	}
	
	
	//금액
	function getMoneyFormat(sFieldValue) {
	sFieldValue = ""+sFieldValue;
	var returnValue = "";
	var minus = "";
	var decimal = "";
	if(typeof sFieldValue != "undefined" && sFieldValue != null && sFieldValue != ""){
		if( sFieldValue.indexOf("-") == 0 ) minus = "-";
		var decimalIdx = sFieldValue.indexOf(".");
		if( decimalIdx >=0 ){
			decimal = sFieldValue.substring(decimalIdx);
			sFieldValue = sFieldValue.substring(0,decimalIdx);
		}
			
		sFieldValue = sFieldValue.replace(/\D/g,"");
		for(var i=sFieldValue.length-1;i>=0;i--){
			returnValue = sFieldValue.charAt(i) + returnValue;
			if( i!=0 && returnValue.replace(/\D/g,"").length % 3 == 0 ){
				returnValue = "," + returnValue;
			}
		}
	}
	return minus + returnValue + decimal;
	}
	
	$(function(){
		$("#board_price").val((("${boardVO.board_price}" == '') ? "" : getMoneyFormat("${boardVO.board_price}")));
		$("#board_price").on("propertychange change paste input", function() {
		$(this).val(getMoneyFormat($(this).val()));
	});
	
	});
	
	//금액 db저장
	function fnReplace(val) {
		var ret = 0;
		if(typeof val != "undefined" && val != null && val != ""){
			ret = Number(val.replace(/,/gi,''));
		}
		return ret;		
	}

	$("#board_price").val(fnReplace($("#board_price").val()));

	
	
	$(function(){
		//시간
		var today = new Date();
	
		$("#datepicker").datepicker({
			"dateFormat":"yy년 mm월 dd일",
			//showOtherMonths:true,
			//selectOtherMonths:true
			minDate:new Date(today.getFullYear(),today.getMonth(),today.getDate()),
			onSelect:function(date,inst){
				console.log('날짜 선택:',date);
				$("#display").html(date);
				console.log(inst);
				console.log("데이트 피커 객체의 getDate()메소드 호출:",$("#datepicker").datepicker("getDate"));
			},
			monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	        showMonthAfterYear: true,
	        yearSuffix: '년'
		});
		
		$("#timepicker").click(function(){
			 var time=$("#timepicker").val();
			 if(time!=null){
			 console.log("시간선택:",time);
			 }
		});
		
		
		//사진
		$('#real-input').on('change',readImage);
		function readImage(input) {
			// 인풋 태그에 파일이 있는 경우
			console.log(input.target.files);
			var imgString;
			console.log(input.target.files.length);
			$('#imagePreview').html("");
			for(var i = 0; i<input.target.files.length ;i++){
				if(input.target.files[i]) {
					// FileReader 인스턴스 생성
					const reader = new FileReader()
					// 이미지가 로드가 된 경우
					reader.onload = e => {
						$('#imagePreview').append('<img style="width: 150px; height: 150px;" src='+e.target.result+' />');
					}
					// reader가 이미지 읽도록 하기
					reader.readAsDataURL(input.target.files[i]);
				}
			}	
		}
			  
	});
	
	
</script>
  </body>
</html>