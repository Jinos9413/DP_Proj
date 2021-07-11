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
    <title>산책하개</title>
    <style>
    .titleClick:hover,.commentDelete:hover{		
		text-decoration:underline;
	}	
	.titleClick,.commentDelete{
		color:lightblue;
		cursor:pointer;
	}
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
    		<a href="<c:url value="/Community/Photo/P_Main.do"/>">사진 게시판</a>
    		<a class="on" href="<c:url value="/Community/Recommendation/R_Main.do"/>">추천 산책로</a>
    </div>
     <section id="blog" class="section">
      <!-- Container Starts -->
      <div class="container">
		<div class="page-header">
			<h1>
				한줄 메모 게시판<small>상세보기 페이지</small>
			</h1>
		</div>
		<div class="row">
			<div class="col-md-12">
				<table class="table table-bordered table-striped">
					<tr>
						<th>이미지</th>
						<td>
							<button class="btn btn-common" id="prevImage">이전</button>
							<c:forEach items="${images }" var="image" varStatus="loop">
								<img style="width: 150px; height: 150px; display: none;" src="<c:url value="/upload/${image }"/>" id="image${loop.index }" class="image" >
							</c:forEach>
							<button class="btn btn-common" id="nextImage">다음</button>
						</td>
					</tr>
					<tr>
						<th class="col-md-2 text-center">번호</th>
						<td>${record.cno}</td>
					</tr>
					<tr>
						<th class="text-center">제목</th>
						<td>${record.ctitle}</td>
					</tr>
					<tr>
						<th class="text-center">작성자</th>
						<td>${record.name}</td>
					</tr>
					<tr>
						<th class="text-center">등록일</th>
						<td>${record.cpostDay}</td>
					</tr>
					<tr>
						<th class="text-center">산책일시</th>
						<td>${record.datepicker}${record.timepicker}</td>
					</tr>
					<tr>
						<th class="text-center">가격</th>
						<td>${record.board_price}원</td>
					</tr>
					<tr>
						<th class="text-center" colspan="2">내용</th>
					</tr>
					<tr>
						<td colspan="2">${record.ccontent}</td>
					</tr>
					
				</table>
			</div>
		</div>
  		 <div id="drawingMap"></div>
		 
		<!-- row -->
		<div class="row">
			<div class="col-md-offset-2 col-md-8">
				<!-- .center-block 사용시 해당 블락의 크기를 지정하자 -->
				<ul id="pillMenu" class="nav nav-pills center-block"
					style="width: 200px; margin-bottom: 10px">
					
					<c:if test="${sessionScope.id == record.id }">
						<li><a
							href="<c:url value='/Care/CareEdit.do?cno=${record.cno}'/>"
							class="btn btn-success">수정</a></li>
						<li><a href="javascript:isDelete();" class="btn btn-success">삭제</a></li>
					</c:if>
					
					<li><a href="<c:url value='/Care/CareServiceMain.do?nowPage=${param.nowPage}'/>" class="btn btn-success">목록</a></li> 
				</ul>
				<c:if test="${sessionScope.id != record.id }">
						<a href="<c:url value='/Chat/ChatView.do?cno=${record.cno}'/>" class="btn btn-success">채팅으로 신청하기</a>
				</c:if>
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
    <script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=d963a4891fae00b5fd892884ae34a387"></script>
	<!-- 푸터 끝 -->
	<script>
		$(function(){
			var imageNum = 0;
			var imageCount = $('.image').length;
			
			$('#image0').css("display","");
			$('#nextImage').on('click',function(){
				if(imageNum < imageCount-1){
					$('#image'+imageNum+'').css("display","none");
					imageNum++;
					$('#image'+imageNum+'').css("display","");
				}
			});
			$('#prevImage').on('click',function(){
				if(imageNum > 0){
					$('#image'+imageNum+'').css("display","none");
					imageNum--;
					$('#image'+imageNum+'').css("display","");
				}
			});
		});

		
	function isDelete(){
		if(confirm("정말로 삭제 할래?")){
			location.replace("<c:url value="/Care/CareDelete.do?cno=${record.cno}"/>");
		}
	}
	
	
	//지도
	var mapContainer = document.getElementById('drawingMap'),
	mapOptions = { 
	    center: new kakao.maps.LatLng(${record.clickLineP}.test[0].Ma, ${record.clickLineP}.test[0].La), // 지도의 중심좌표
	    level: 3 // 지도의 확대 레벨
	};
	
	// 지도 div와 지도 옵션으로 지도를 생성합니다
	var drawingMap = new kakao.maps.Map(mapContainer, mapOptions),
	overlays = []; // 지도에 그려진 도형을 담을 배열
	var json;
	$(function(){
		json = ${record.clickLineP};
		getDataFromDrawingMap();
	});
	
	function getDataFromDrawingMap() {
	    // 아래 지도에 그려진 도형이 있다면 모두 지웁니다
	    removeOverlays();
	    // 지도에 가져온 데이터로 도형들을 그립니다
	    drawPolyline(json);
	}
	
	// 아래 지도에 그려진 도형이 있다면 모두 지웁니다
	function removeOverlays() {
	    var len = overlays.length, i = 0;
	    for (; i < len; i++) {
	        overlays[i].setMap(null);
	    }
	    overlays = [];
	}
	
	// Drawing Manager에서 가져온 데이터 중 선을 아래 지도에 표시하는 함수입니다
	   function drawPolyline(json) {
			var array = new Array();
			for(var i = 0; i < json.test.length; i++){
				array[i] = new kakao.maps.LatLng(json.test[i].Ma,json.test[i].La);
			}
	       var polyline = new kakao.maps.Polyline({
	           map: drawingMap,
	           path: array,
	           strokeWeight: 3, // 선의 두께입니다 
	           strokeColor: '#db4040', // 선의 색깔입니다
	           strokeOpacity: 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
	           strokeStyle: 'solid' // 선의 스타일입니다
	       });
	       overlays.push(polyline);
	       if (array.length > 1) {
	         var clickLineL=Math.round(array);
	         var clickLineP=array.toString();
	           var distance = parseInt(${record.clickLineL}), // 선의 총 거리를 계산합니다
	               content = getTimeHTML(distance); // 커스텀오버레이에 추가될 내용입니다
	           var distanceOverlays = new kakao.maps.CustomOverlay({
	                   map: drawingMap, // 커스텀오버레이를 표시할 지도입니다
	                   content: content,  // 커스텀오버레이에 표시할 내용입니다
	                   position: array[array.length-1], // 커스텀오버레이를 표시할 위치입니다.
	                   xAnchor: 0,
	                   yAnchor: 0,
	                   zIndex: 3  
	            });
	       }
	       
	       for ( i = 0; i < array.length; i++ ){
	    	   if(i==0)
	          		displayCircleDotsStart(array[i]);
	          if(i==array.length-1)
	        	  displayCircleDotsEnd(array[i]);
	       }
	   }
	   function displayCircleDotsStart(position) {
	       // 클릭 지점을 표시할 빨간 동그라미 커스텀오버레이를 생성합니다
	       var circleOverlays = new kakao.maps.CustomOverlay({
	          map: drawingMap,
	          content: '<span class="lnr lnr-paw" style="color: orange;font-size: 20px; background-color: black;"></span>',
	           position: position,
	           zIndex: 1
	       });
	   }
	   function displayCircleDotsEnd(position) {
	       // 클릭 지점을 표시할 빨간 동그라미 커스텀오버레이를 생성합니다
	       var circleOverlays = new kakao.maps.CustomOverlay({
	          map: drawingMap,
	          content: '<span class="lnr lnr-flag" style="color: orange;font-size: 20px; background-color: black;"></span>',
	           position: position,
	           zIndex: 1
	       });
	   }
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
		    content += '        <span class="label" style="color:black;">총거리</span><span class="number">' + distance + '</span>m';
		    content += '    </li>';
		    content += '    <li>';
		    content += '        <span class="label" style="color:black;">도보</span>' + walkHour + walkMin;
		    content += '    </li>';
		    content += '</ul>'

		    return content;
		}
	</script>
  </body>
</html>