<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
  <head>
    <!-- Required meta tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="keywords" content="Bootstrap, Landing page, Template, Registration, Landing">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="author" content="Grayrids">
    <title>산책하개</title>
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
          <h2 class="section-title wow fadeIn" data-wow-duration="1000ms" data-wow-delay="0.3s">커뮤니티 <span>자유게시판</span></h2>
          <hr class="lines wow zoomIn" data-wow-delay="0.3s">
          <p class="section-subtitle wow fadeIn" data-wow-duration="1000ms" data-wow-delay="0.3s">사랑해요</p>
        </div>
      </div>
    </section>
    <div class="page-title" style="background-color: #f5efb4; text-align: center;">
    			<a class="on" href="<c:url value="/Community/Photo/P_Main.do"/>">사진 게시판</a>
    		<a href="<c:url value="/Community/Recommendation/R_Main.do"/>">추천 산책로</a>
    </div>
     <section id="blog" class="section">
     <div class="container">
		<div class="page-header">
			<h1>한줄 메모 게시판<small>수정 페이지</small></h1>			
		</div>
		<div class="row">
		<div class="col-md-12">
			<form method="post" action="<c:url value='/Care/CareEditProcess.do'/>" method="post" id="frm" enctype="multipart/form-data">
				<input type="hidden" name="cno" value="${record.cno}"/>
				<input type="hidden" name="originImages" value="${record.images}"/>
				<div id="imagePreview" >
					<c:forEach items="${images }" var="image" varStatus="loop">
						<img style="width: 150px; height: 150px; " src="<c:url value="/upload/${image }"/>" id="image${loop.index }" class="image" >
					</c:forEach>
				</div>
				<input type="file" name="images" id="real-input" multiple="multiple">
				<div class="form-group">
					<label class="col-sm-2 control-label">제목</label>
					<div class="col-sm-4">
						<input style="color: black;" type="text" class="form-control" name="ctitle" placeholder="제목을 입력하세요?" value="${record.ctitle}">
					</div>
				</div>
				<div>
				금 액 :<input type="text" id="board_price" name="board_price" dir="rtl" placeholder="금액을 입력하세요" value="${record.board_price }"/> 원
				</div>
				<!--  데이타 타임 픽커-->
				날짜선택:<input type="text" name="datepicker" id="datepicker" dir="rtl"  placeholder="날짜선택" readonly="readonly" value="${record.datepicker }"/>
					    <select name="timepicker" id="timepicker">
					      <option disabled selected value="" >시간선택</option>
					      <option <c:if test="${record.timepicker == '8시30분' }">selected</c:if>>8시30분</option> 
					      <option <c:if test="${record.timepicker == '9시00분' }">selected</c:if>>9시00분</option>
					      <option <c:if test="${record.timepicker == '9시30분' }">selected</c:if>>9시30분</option>
					      <option <c:if test="${record.timepicker == '10시00분' }">selected</c:if>>10시00분</option>
					    </select>
 								
				<div class="form-group">
					<label class="col-sm-2 control-label">내용</label>
					
					<!-- 중첩 컬럼 사용 -->
					<div class="col-sm-10">
						<div class="row">
							<div class="col-sm-8">
								<textarea style="color: black;" rows="5" class="form-control" name="ccontent" placeholder="내용을 입력하세요">${record.ccontent }</textarea>
							</div>
						</div>
					</div>
				</div>
		
				  
				<div id="map"></div>
				<div class="form-group">
					<input type="hidden" id="testtext" name="clickLineL" ><!--  데이터 넘기기!!-->
					<input type="hidden" id="testtext2" name="clickLineP" >
					<input type="hidden" id="testtext3" name="clickLineA" >
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-primary">수정</button>
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
    <script src="<c:url value="/resources/js/menu.js"/>"></script>
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
	<!-- 푸터 끝 -->
	<script>//지도!!!!
	console.log(${record.clickLineP}.test[0].Ma);
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
	        center: new kakao.maps.LatLng(${record.clickLineP}.test[0].Ma, ${record.clickLineP}.test[0].La), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };
	
	   var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	 //주소-좌표 변환 객체를 생성합니다
	   var geocoder = new kakao.maps.services.Geocoder();

	   var detailAddr;
	   var drawingFlag = false; // 선이 그려지고 있는 상태를 가지고 있을 변수입니다
	   var moveLine; // 선이 그려지고 있을때 마우스 움직임에 따라 그려질 선 객체 입니다
	   var clickLine // 마우스로 클릭한 좌표로 그려질 선 객체입니다
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
	        
	        var distance = Math.round(clickLine.getLength() + moveLine.getLength()), // 선의 총 거리를 계산합니다
	            content = '<div class="dotOverlay distanceInfo">총거리 <span class="number">' + distance + '</span>m</div>'; // 커스텀오버레이에 추가될 내용입니다
	        
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
	        console.log({"test":testdata});
	        console.log(clickLineP);
	        
	        var json = JSON.parse(clickLineP);
	        console.log(json);
	        console.log(json.test);
	        
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
			}
		});
		
		$("#timepicker").click(function(){
			 var time=$("#timepicker").val();
			 if(time!=null){
			 console.log("시간선택:",time);
			 }
		});
		
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