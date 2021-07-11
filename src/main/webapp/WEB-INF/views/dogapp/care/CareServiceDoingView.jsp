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
   .checked {
  	color: orange;
	}
	label{
		cursor: pointer;
	}
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
    	<a class="menuItem1" href="<c:url value="/Care/CareServiceMain.do"/>">돌봄 신청현황</a>
   		<a class="menuItem2" href="<c:url value="/Care/CareServiceDoing.do"/>">진행중인 돌봄</a>
   		<a class="menuItem3" href="<c:url value="/Care/CareServiceDone.do"/>">종료된 돌봄</a>
    </div>
     <section id="blog" class="section">
     <input type="hidden" id="checkDoingView" value="Yes">
      <!-- Container Starts -->
      <div class="container">

		<div class="row">
			<div class="col-md-12">
				<table class="table table-bordered table-striped">
					<tr>
						<th colspan="2">
							<div id="carousel" class="carousel slide col-md-offset-4 col-md-4 " >
							  <ol class="carousel-indicators" >
							    <c:forEach items="${care_images }" var="image" varStatus="loop">
							    	<c:if test="${loop.index == 0 }">
							    		<li data-target="#carousel" data-slide-to="${loop.index }" class="active"></li>
							    	</c:if>
							    	<c:if test="${loop.index != 0 }">
							    		<li data-target="#carousel" data-slide-to="${loop.index }"></li>
							    	</c:if>
							    </c:forEach>
							  </ol>
							  <div class="carousel-inner" role="listbox">
							  	<c:forEach items="${care_images }" var="image" varStatus="loop">
							  		<c:if test="${loop.index == 0 }" var="indexFlag">
							  			<div class="item active">
											<img src="<c:url value="/upload/${image }"/>" style="height:200px; width:100%;">
										</div>
							  		</c:if>
							  		<c:if test="${!indexFlag }">
							  			<div class="item">
											<img src="<c:url value="/upload/${image }"/>" style="height:200px; width:100%;">
										</div>
							  		</c:if>
								</c:forEach>
							  </div>
							</div>
						</th>
					</tr>
					<tr>
						<th class="col-md-2 text-center">번호</th>
						<td>${record.care_no}</td>
					</tr>
					<tr>
						<th class="text-center">닉네임</th>
						<td>${record.care_title}</td>
					</tr>
					<tr>
						<th class="text-center">작성자</th>
						<td>${record.name}</td>
					</tr>
					<tr>
						<th class="text-center">등록일</th>
						<td>${record.care_postdate}</td>
					</tr>
					<tr>
						<th class="text-center">산책일시</th>
						<td>${record.care_datepicker}${record.care_timepicker}</td>
					</tr>
					<tr>
						<th class="text-center">가격</th>
						<td>${record.care_price}원</td>
					</tr>
					<tr>
						<th class="text-center" colspan="2">내용</th>
					</tr>
					<tr>
						<td colspan="2">${record.care_content}</td>
					</tr>
					
				</table>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6"><div id="drawingMap"></div></div>
	  		<div class="col-md-6"><div id="map" style="display:none;"><span></span></div></div>
			<div class="col-md-6"><div id="mapStop" style="background-color: gray; text-align: center; line-height: 350px"><span>위치 공유 전입니다.</span></div></div>
		</div>
		<!-- row -->
		<div class="row">
			<div >
				<!-- .center-block 사용시 해당 블락의 크기를 지정하자 -->
				<ul id="pillMenu" class="nav nav-pills center-block" style="width: fit-content;">
					<c:if test="${sessionScope.id == record.id }">
						<li><a href="javascript:finishService();" class="btn btn-success">서비스 종료</a></li>
						<li><a href="<c:url value='/Care/CareServiceDoing.do?nowPage=${param.nowPage}'/>" class="btn btn-common">목록</a></li>
					</c:if>
					<c:if test="${sessionScope.id != record.id }">
						<li><a class="btn btn-success locationResearch">위치 전송</a></li>
						<li><a class="btn btn-warning locationStop" style="display: none;">전송 중지</a></li>
						<li><a href="<c:url value='/Care/TrainerMain.do?nowPage=${param.nowPage}'/>" class="btn btn-common">목록</a></li>
					</c:if>
				</ul>
			</div>
		</div>	
		</div>
    </section>
    <div class="modal  fade" id="payModal" data-backdrop="static" >
   		<div class="modal-dialog">
   			<div class="modal-content" style="padding: 20px;">
   				<div class="modal-header">
   					<button class="close" data-dismiss="modal"><span>&times;</span></button>
   					<p class="modal-title" style="text-align: center; font-size: 2em;">결제 선택</p>
   				</div>
   				<div class="modal-body" style="font-size: 1.5em;padding-left: 10px;">
					<div class="row">
						<div class="col-xs-6">
							<div class="item-boxes">
								<div class="icon">
									<i class="lnr lnr-paw"></i>
								</div>
								<h4>바로 결제</h4>
								<p>결제창으로 이동합니다</p>
								<a href="javascript:finishServicePay();" class="btn btn-common">바로 결제</a>
				            </div>						
						</div>
						<div class="col-xs-6">
							<div class="item-boxes">
								<div class="icon">
									<i class="lnr lnr-user"></i>
								</div>
								<h4>직접 결제</h4>
								<p>후기 등록으로 이동합니다</p>
								<a href="javascript:finishServiceReview();" class="btn btn-common">직접 결제</a>
							</div>
						</div>
					</div>
   				</div>
   			</div>    		
   		</div>    	
   	</div>
    <div class="modal  fade" id="reviewModal"  >
   		<div class="modal-dialog">
   			<div class="modal-content" style="padding: 20px;">
   				<div class="modal-header">
   					<button class="close" data-dismiss="modal"><span>&times;</span></button>
   					<p class="modal-title" style="text-align: center; font-size: 2em;">후기 작성</p>
   				</div>
   				<div class="modal-body" style="font-size: 1.5em;padding-left: 10px;">
   					<form method="post" action="<c:url value="/Care/CareServiceRating.do"/>">
   						<input type="hidden" name="care_no" value="${record.care_no }">
   						<input type="hidden" name="t_no" value="${record.t_no }">
   						별점(<span id="ratingScore">0</span>점)
   						<div>
   							<label class="fa fa-star" for="rating1" id="star1"></label>
						    <input type="radio" name="trainer_rate" id="rating1" value="1" style="display: none;">
						    <label class="fa fa-star" for="rating2" id="star2"></label>
						    <input type="radio" name="trainer_rate" id="rating2" value="2" style="display: none;">
						    <label class="fa fa-star" for="rating3" id="star3"></label>
						    <input type="radio" name="trainer_rate" id="rating3" value="3" style="display: none;">
						    <label class="fa fa-star" for="rating4" id="star4"></label>
						    <input type="radio" name="trainer_rate" id="rating4" value="4" style="display: none;">
						    <label class="fa fa-star" for="rating5" id="star5"></label>
						    <input type="radio" name="trainer_rate" id="rating5" value="5" style="display: none;">
   						</div>
   						후기 작성
   						<div>
   							<textarea name="t_r_content" rows="8" placeholder="후기를 작성해주세요" style="width: 100%"></textarea>
   						</div>
   						<div class="modal-footer" style="text-align: center;">
		   					<input class="btn btn-common" type="submit" value="완료">
		   				</div>
   					</form>
   				</div>
   			</div>    		
   		</div>    	
   	</div>
    <jsp:include page="/WEB-INF/views/templates/Foot.jsp"/>

    

    <!-- jQuery first, then Tether, then Bootstrap JS. -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <script src="<c:url value="/resources/js/tether.min.js"/>"></script>
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
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <jsp:include page="/WEB-INF/views/templates/Notice.jsp"/>
    <script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=d963a4891fae00b5fd892884ae34a387"></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<!-- 푸터 끝 -->
	<script>
		$(function(){
			
			if(${record.care_state}==1){
				$('.menuItem1').addClass('on');
			}
			if(${record.care_state}==2){
				$('.menuItem2').addClass('on');
			}
			if(${record.care_state}==3){
				$('.menuItem3').addClass('on');
			}

			$('input[name=trainer_rate]').on('click',function(){
				$('.fa-star').removeClass('checked');
				for(var i = 1; i<=$(this).val(); i++){
					$('#star'+i).addClass('checked');
				}
				$('#ratingScore').html($(this).val());
			});
		});

		function finishService(){
			if(confirm("서비스를 종료하시겠습니까?")){
				$('#payModal').modal('show');
			}
		}
		function finishServiceReview(){
			$('#payModal').modal('hide');
			$('#reviewModal').modal('show');
		}
		function finishServicePay(){
			var IMP = window.IMP; // 생략가능
			var price = '${record.care_price}'.replaceAll(',', '');
			IMP.init('imp56439562'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사
			IMP.request_pay({
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : '주문명:결제테스트',
			    amount : price,
			    buyer_name : '구매자이름',
			    buyer_tel : '010-7379-7653'
			    //m_redirect_url : 'https://www.yourdomain.com/payments/complete' //모바일 결제
			}, function(rsp) {
			    if ( rsp.success ) {
			        var msg = '결제가 완료되었습니다.';
			        finishServiceReview();
			    } else {
			        var msg = '결제에 실패하였습니다.';
			    }
			    alert(msg);
			});
		}
		
		//지도
		var mapContainer = document.getElementById('drawingMap'),
		mapOptions = { 
		    center: new kakao.maps.LatLng(${record.care_clickLineP}.test[0].Ma, ${record.care_clickLineP}.test[0].La), // 지도의 중심좌표
		    level: 3 // 지도의 확대 레벨
		};
		
		// 지도 div와 지도 옵션으로 지도를 생성합니다
		var drawingMap = new kakao.maps.Map(mapContainer, mapOptions),
		overlays = []; // 지도에 그려진 도형을 담을 배열
		var json;
		$(function(){
			json = ${record.care_clickLineP};
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
		           var distance = parseInt(${record.care_clickLineL}), // 선의 총 거리를 계산합니다
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
		   
		   var localTrack;
		   $('.locationStop').on('click', function(){
			   if(confirm('위치 전송을 중지하시겠습니까?')){
					$('.locationResearch').css('display', '');
					$('.locationStop').css('display', 'none');
					$('#mapStop').css('display', '');
					$('#map').css('display', 'none');
					clearInterval(localTrack);
					sendMessage('${record.id}${record.care_no}locationStop&');
			   }
		   });
		   $(window).bind("beforeunload", function (){
			   sendMessage('${record.id}${record.care_no}locationStop&');
			});
		   $('.locationResearch').on('click', function(){
			   	if(confirm('위치 전송을 시작하시겠습니까?')){
			   		$('.locationResearch').css('display', 'none');
			   		$('.locationStop').css('display', '');
			   		$('#mapStop').css('display', 'none');
			   		$('#map').css('display', '');
			   		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				    mapOption = {
				        center: new kakao.maps.LatLng(37.5559, 126.9723), // 지도의 중심좌표
				        level: 3 // 지도의 확대 레벨
				    };  
					// 지도를 생성합니다    
					var map = new kakao.maps.Map(mapContainer, mapOption); 
					localTrack = setInterval(function() {
						if (navigator.geolocation) {
						    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
						    navigator.geolocation.getCurrentPosition(function(position) {
						        var lat = position.coords.latitude, // 위도
						            lon = position.coords.longitude; // 경도
						        var data = '${record.id}${record.care_no}locationStart&'+lat+'&'+lon;
						        sendMessage(data);
						        var locPosition = new kakao.maps.LatLng(lat, lon);
						        displayMarker(locPosition);    
						      });
						} 
						else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
						    var locPosition = new kakao.maps.LatLng(37.5559, 126.9723);
						    displayMarker(locPosition);
						}
						// 지도에 마커를 표시하는 함수입니다
						function displayMarker(locPosition) {
						    // 마커를 생성합니다
						    var marker = new kakao.maps.Marker({  
						        map: map, 
						        position: locPosition
						    }); 
						    map.setCenter(locPosition);      
						}
					}, 2000);	
			   	}
		   });
		   
		   function sendMessage(data){
				wsocket.send(data);
			}
				
		   
	</script>
  </body>
</html>