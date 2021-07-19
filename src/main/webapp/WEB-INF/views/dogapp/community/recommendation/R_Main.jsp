<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	   .drawingMap, #map {width: 100%;height: 300px;}
	   .Maps{width:100%;height:300px;}
	   #map {margin-top: 10px;}
	  
	  table{margin: 20px; width: 100%; border: 1px solid #bcbcbc;}
	  td{border: 1px solid #bcbcbc; padding:10px}
	  th{border: 1px solid #bcbcbc;}
	  .btnView:hover{
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
	          <h2 class="section-title wow fadeIn" data-wow-duration="1000ms" data-wow-delay="0.3s">추천 <span>산책로</span></h2>
	          <hr class="lines wow zoomIn" data-wow-delay="0.3s">
	          <p class="section-subtitle wow fadeIn" data-wow-duration="1000ms" data-wow-delay="0.3s">새로운 산책로를 찾아보세요</p>
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
		      	<div class="row">
		      		<div class="col-md-9">
		        		<p style="font-size: 2em; font-weight: bold;">추천산책로 게시판입니다</p>
		        		<p style="color: gray;">집주위 산책로를 찾을 수 있습니다~!</p>
					</div>
					<div class="col-md-3" style="text-align: right;">
						<a href="<c:url value="/Community/Recommendation/R_Write.do"/>" class="btn btn-common">추천산책로 등록</a>
					</div>
				</div>
				<hr/>
		        <div class="row">
		        	<c:if test="${empty listPagingData.lists }" var="isEmpty">
						<div >등록된 게시물이 없어요</div>
					</c:if>
					<c:if test="${not isEmpty }">
						<c:forEach items="${listPagingData.lists }" var="item" varStatus="loop">
							
							
							<div class="col-sm-12 col-md-4 blog-item">
					            <!-- Blog Item Starts -->
					            
					            <div class="blog-item-wrapper wow fadeInUp" data-wow-delay="0.1s">
					            	<a href="<c:url value="#?R_NO=${item.R_NO}&nowPage="/><c:out value="${param.nowPage}" default="1"/>" style="display: block;" >
					              		
					              	</a>
			
					              	<div class="drawingMap" id="drawingMap${loop.index}"></div>
					              	
					              <div class="blog-item-text btnView" id="btnView&${item.R_NO }" style="text-align: center; padding-top: 10px;"> 
					                <p style="color: black; font-size: 1.5em;">${item.R_TITLE }</p>
					                <span style="color:black">시작지:${item.R_CLICKLINEA }</span><br/>
  								  </div>
  								 <!-- 좋아요 댓글 수 -->
  								 <div class="panel-footer" style="background-color: white;">
									<c:if test="${likeList[loop.index]==0 }" var="flag">
										<a href="javascript:"><span class="likeSpan fa fa-heart-o" style="color: black; font-size: 20px;" id="like${item.R_NO}">&nbsp;${item.R_LIKECOUNT}</span></a>&nbsp;&nbsp;
									</c:if>
									<c:if test="${!flag }">
										<a href="javascript:"><span class="likeSpan fa fa-heart" style="color: red; font-size: 20px;" id="like${item.R_NO}">&nbsp;${item.R_LIKECOUNT}</span></a>&nbsp;&nbsp;
									</c:if>
										<span class="fa fa-comment-o" style="color: black; font-size: 20px;" id="maincomment${item.R_NO}">&nbsp;${item.R_COMMENTCOUNT}</span>
					
									<button class="btn btn-info btnreport" id="btnreport${item.R_NO }" data-backdrop="static" data-keyboard="true">신고하기</button>
									<button class="btn btn-info btnreportFinish" id="btnreportFinish${item.R_NO }" data-backdrop="static" data-keyboard="true" style="display:none">신고완료</button>
								</div>
   								
   					
					          </div>
					         </div>  
						</c:forEach>
					</c:if>
		        </div>
			<div class="row" style="text-align: center;">
			
			${listPagingData.pagingString}
		</div>
      </div>
	</section>
	
	<!-- 자세히보기 모달 -->
	<div class="modal fade" id="basic_modal" data-backdrop="static">
   		<div class="modal-dialog" style="width: 1000px; display: table;" >
   			<div class="modal-content">
   				<div class="modal-header ">
   					<button class="close" data-dismiss="modal"><span>&times;</span></button>
   					<h2 class="modal-title text-center"><p id="R_TITLE" style="font-size: 0.9em;"></p></h2>
   				</div>
   				<div class="modal-body">
   					<div class="row">
   						<div class="col-md-7">
		   					<div>
		   						<div class="Maps" id="Maps"></div>
		   					</div>
		   					<hr/>
		   					<div style="margin-bottom: 10px;">
			   					<a href="javascript:"><span class="fa fa-heart-o" id ="R_LIKECOUNT" style="color: black; font-size: 20px;"></span></a>&nbsp;&nbsp;
	   							<span class="textSpan fa fa-comment-o" style="color: black; font-size: 20px;" id ="R_COMMENTCOUNT"></span><br/>
		   					</div>
		   					<div class="row">
				   					<!-- 사진 -->
				   					<div data-ride="carousel"class="col-md-5" style="text-align: center;">
					   					<div id="viewImages" style="width: 100%; height: 120px; overflow: hidden;"></div>
		   								<div>
			   								<span class="lnr lnr-chevron-left" id="prevImage" style="cursor: pointer;"></span>
											<span class="lnr lnr-chevron-right" id="nextImage" style="cursor: pointer;"></span>
		   								</div>
		   							</div>
		   							<div class="col-md-6">
		   								<span id="NICKNAME"></span><br/>
		   								<div style="font-size: 0.5em; margin: 10px;">
		   								주소: <span id="R_CLICKLINEA" ></span><br/>
		   								거리: <span id="R_CLICKLINEL" ></span><br/>
		   								</div>
		   								<span id="R_CONTENT"></span>
		   							</div>
   							</div>
   							<input type="hidden" name="R_NO" id="R_NO"/> 
   						</div>
   						<!-- 댓글 리스트 -->				
						<div class="col-md-5">
							<div class="text-left">​
								
				            	<!-- 댓글 입력창 -->
				            	<div class="text-left" style="padding: 0">​
									<!-- 한줄 코멘트 입력 폼-->
									<div style="height: 380px; margin: 0; overflow-y: scroll;" id="memoDiv">
										<ul class="listUl" >
										</ul>
									</div>
					            	<!-- 댓글 입력창 -->
			   						<div class="input-group" style="text-align: center;" >
						          		 <input type="text" id="input"class="form-control textInput" style="color: black; margin-top: 10px;">
							          	 <span class="input-group-btn">
							         	   	<button class="showBtn btn btn-default" type="button" style="color:#050099; height: 38px;">게시</button>
							         	 </span>
				        			</div>
								</div>
							</div>
						</div>
					</div>
   				</div>
   				<div class="modal-footer1" style="text-align: center;">
   					<button class="btn btn-info" data-dismiss="modal">닫기</button>
   					<span class ="modalset"></span>
   				</div>
   			</div>    		
   		</div>    	
   	</div>

	<!-- 신고모달 -->
	<div class="modal fade" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header text-center">
					<a class="glyphicon glyphicon-alert" href="#" >게시물 신고 페이지</a>
				</div>
				<!-- body -->
				<div class="modal-body text-center">
					<form>
						<input type="hidden" name="R_NO" id="ReportR_NO" /> 
			          <div class="form-group">
			          	<div style="text-align: left;">
			            	<label for="recipient-name" class="control-label" >신고 제목:</label><div id="message1" style="color: red;"></div>
			            </div>
			            <input type="text" class="form-control" id="R_R_TITLE" placeholder="제목을 입력하세요" style="color:black">
			          </div>
			          <div class="form-group">
			            <div style="text-align: left;">
			            	<label for="message-text" class="control-label" >신고 내용:</label><div id="message2" style="color: red;"></div>
			            </div>
			            <textarea class="form-control" id="R_R_COMMENT" placeholder="내용을 입력하세요"style="color:black"></textarea>
			          </div>
			        </form>
				</div>
				<div class="modal-footer" id="mfooter">
					<input class="btn btn-success " id="reportSubmit" type="button" value="신고 등록" />
					<a href="javascript:" class="btn btn-success" data-dismiss="modal">취소</a><br/>
				</div>
			</div>
		</div>
	</div>
	
	<div id="up" style="height:100px; width:35%; left:40%; top:40%; background-color: black; position: fixed; display: none; z-index: 10000000000000000000000;">
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
    <script src='<c:url value="/resources/lib/main.js"/>'></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=d963a4891fae00b5fd892884ae34a387"></script>
    <script>
    
//모달창 내용  
	var rNo="";
    $('.btnView').on('click',function(){
    	console.log(this.id);
    	console.log(this.id.split('&')[1]);
    	rNo= this.id.split('&')[1];
    	var rId = "${sessionScope.id}";
    	
	   	$('#R_NO').val(rNo);
	   	console.log("rNo : "+rNo);
	   	//append 비워주기
	   	$('.modalset').html("");
	   	$(".listUl").html("");
    	$('#viewImages').html("");
    	$.ajax({
			url:"<c:url value="/Community/SelectOneView.do" />",//요청할 서버의 URL 주소
			type:"post",//데이터 전송방식(디폴트는 get방식)
			dataType:'json',//서버로부터 받을 응답 데이터의 형식 설정
			data:
				{
					r_no:rNo
				},
			success:function(data){//서버로부터 정상적인 응답(200)을 받았을 때 호출되는 콜백함수
				
				
				console.log(data);
				console.log(data.R_NO);
				console.log(data.R_CLICKLINEA);
				console.log(data.R_CLICKLINEP);
				console.log(JSON.parse(data.R_CLICKLINEP).test[0].Ma);
				console.log(JSON.parse(data.R_CLICKLINEP).test[0].La);
			
				//이미지 캐러셀
				var images=(data.R_IMAGES).split("/")
				for(var i = 0; i<images.length-1 ; i++){
					$('#viewImages').append('<img style="width: 90%; display: none;" src="<c:url value="/upload/'+images[i]+'"/>" id="image'+i+'" class="image" >')
					$('.image').mouseenter(function(){
						   $('#up').css('display','');
						   $('#up').html('<img style="width: 100%;height:"100%"" src="'+this.src+'">');
					});
					$('.image').mouseleave(function(){
						   $('#up').css('display','none'); 
					});
				}
				
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
				
				//지도시작
				var mapContainer = document.getElementById('Maps'),
				mapOptions = { 
				    center: new kakao.maps.LatLng(JSON.parse(data.R_CLICKLINEP).test[0].Ma - (-0.00280914180383),JSON.parse(data.R_CLICKLINEP).test[0].La - (0.00610461162369)), // 지도의 중심좌표
				    level: 4 // 지도의 확대 레벨
				    
				};
				
				// 지도 div와 지도 옵션으로 지도를 생성합니다
				var Maps = new kakao.maps.Map(mapContainer, mapOptions),
				overlays = []; // 지도에 그려진 도형을 담을 배열
				var json;
					json =JSON.parse(data.R_CLICKLINEP);
					getDataFromDrawingMap();
					setTimeout( function() {
						window.dispatchEvent(new Event('resize'));
					}, 200);
					
				function getDataFromDrawingMap() {
				    // 아래 지도에 그려진 도형이 있다면 모두 지웁니다
				    removeOverlays();
				    // 지도에 가져온 데이터로 도형들을 그립니다
				    drawPolyline(json);
				}
				
				// 아래 지도에 그려진 도형이 있다면 모두 지웁니다
				function removeOverlays() {
				    var len = overlays.length, j = 0;
				    for (; j < len; j++) {
				        overlays[j].setMap(null);
				    }
				    overlays = [];
				}
				
				// Drawing Manager에서 가져온 데이터 중 선을 아래 지도에 표시하는 함수입니다
				   function drawPolyline(json) {
						var array = new Array();
						for(var k = 0; k < json.test.length; k++){
							array[k] = new kakao.maps.LatLng(json.test[k].Ma,json.test[k].La);
						}
				       var polyline = new kakao.maps.Polyline({
				           map: Maps,
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
				         
				           var distance = parseInt(data.R_CLICKLINEL), // 선의 총 거리를 계산합니다
				               content = getTimeHTML(distance); // 커스텀오버레이에 추가될 내용입니다
				           var distanceOverlays = new kakao.maps.CustomOverlay({
				                   map: Maps, // 커스텀오버레이를 표시할 지도입니다
				                   content: content,  // 커스텀오버레이에 표시할 내용입니다
				                   position: array[array.length-1], // 커스텀오버레이를 표시할 위치입니다.
				                   xAnchor: 0,
				                   yAnchor: 0,
				                   zIndex: 3  
				            });
				       }
				       
				       for ( l = 0; l < array.length; l++ ){
				    	   if(l==0)
				          		displayCircleDotsStart(array[l]);
				          if(l==array.length-1)
				        	  displayCircleDotsEnd(array[l]);
				       }
				   }
				  
				   function displayCircleDotsStart(position) {
				       // 클릭 지점을 표시할 빨간 동그라미 커스텀오버레이를 생성합니다
				       var circleOverlays = new kakao.maps.CustomOverlay({
				          map: Maps,
				          content: '<span class="lnr lnr-paw" style="color: orange;font-size: 20px; background-color: black;"></span>',
				           position: position,
				           zIndex: 1
				       });
				   }
				  
				   function displayCircleDotsEnd(position) {
				       // 클릭 지점을 표시할 빨간 동그라미 커스텀오버레이를 생성합니다
				       var circleOverlays = new kakao.maps.CustomOverlay({
				          map: Maps,
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
				
				
				$('#R_NO').val(data.R_NO);
				$('#R_TITLE').html(data.R_TITLE);
				$('#R_CONTENT').html(data.R_CONTENT);
				$('#R_CLICKLINEA').html(data.R_CLICKLINEA);
				$('#R_CLICKLINEL').html(data.R_CLICKLINEL);
				$('#NICKNAME').html(data.NICKNAME);
				$('#R_LIKECOUNT').html(" "+data.R_LIKECOUNT);
				$('#R_COMMENTCOUNT').html(" "+data.R_COMMENTCOUNT);
				
				//삭제 수정 추가 ----------수정 필요 ajax로
				if(data.ID == rId){
					$('.modalset').append('<a href="javascript:isDelete();" class="btn btn-success">삭제</a>');
					/* $('.modal-footer1').append('<button class="btn btn-info" id="btnreport" data-backdrop="static" data-keyboard="true">신고하기</button>')
					$('.modal-footer1').append('<button class="btn btn-info" data-dismiss="modal">닫기</button>') */
					<!--신고완료-->
   					<!-- <button class="btn btn-info" id="btnreportFinish" data-backdrop="static" data-keyboard="true"  style="display: none;"disabled="disabled">신고완료</button> -->
				} 
				/*
				function isDelete(){
					if(confirm("정말로 삭제 하시겠습니까?")){
						location.replace("<c:url value="/Community/RecommendationDelete.do?care_no=${record.care_no}"/>");
					}
				}
				*/
				//좋아요 체크 
				var check = data.check;
				console.log("check::::::"+check);
				if(check == 1){
					$('#R_LIKECOUNT').removeClass("fa fa-heart-o")
		             .addClass("fa fa-heart")
		             .css("color", "red");
				}
				else{
					$('#R_LIKECOUNT').removeClass("fa fa-heart")
		             .addClass("fa fa-heart-o")
		             .css("color", "black");
				}
				//댓글 체크
				$.ajax({
					url:"<c:url value="/Community/SelectOneView2.do" />",//요청할 서버의 URL 주소
					type:"post",//데이터 전송방식(디폴트는 get방식)
					dataType:'json',//서버로부터 받을 응답 데이터의 형식 설정
					data:
						{
							r_no:rNo
						},
					success:function(data){//서버로부터 정상적인 응답(200)을 받았을 때 호출되는 콜백함수
						console.log("commentlist : "+data);
						console.log(data.length);
						var comment = data;
						if(data.length == 0){
							$(".listUl").html("<span id='defaultComment'>등록된 댓글이 없어요.</span>")
						}
						else{
							for(var i = 0; i<data.length ; i++){
								if(data[i].ID == rId){
									$(".listUl").append('<div><li class="comment" id="comment'+data[i].R_C_NO+'"><strong>'+data[i].NICKNAME+'</strong>&nbsp;'+data[i].R_COMMENT+'<div style="text-align:right;"><button class="r_commentdelete" type="button" id="delete'+data[i].R_C_NO+'"style="border:none;font-size:0.2em;">삭제</button></div></li></div>');
								}
								else{
									$(".listUl").append('<div><li class="comment" id="comment'+data[i].R_C_NO+'"><strong>'+data[i].NICKNAME+'</strong>&nbsp;'+data[i].R_COMMENT+'</li></div>');
								}
							}/////////for
						}///////////else
					}/////////succes
				});////////////////ajax		
				//뷰 호출
				$('#basic_modal').modal('show');
			},
			error: function(error){//서버로부터 비정상적인 응답을 받았을 때 호출되는 콜백함수
			}
		});
    });
	function isDelete(){
		console.log("rNO:"+rNo);
		if(confirm("정말로 삭제 하시겠습니까?")){
			location.replace("<c:url value="/Community/RecommendationDelete.do?r_no=rNO"/>");
		}
	}
    var json9='${jsonString}';
    var json8=json9.replaceAll('\"{','{');
    var json7=json8.replaceAll('}\"','}');
    console.log("json7 : "+json7);
    //var jsondata = JSON.stringify(json);
    var jsonjson = JSON.parse(json7);
   	console.log("jsonjsonRNO : "+jsonjson[0].R_NO);

 

//지도
	for(i=0;i<jsonjson.length;i++){
		
	 	var R_json=jsonjson[i];
	 	
		var mapContainer = document.getElementById('drawingMap'+i),
		mapOptions = { 
		    center: new kakao.maps.LatLng(R_json.R_CLICKLINEP.test[0].Ma, R_json.R_CLICKLINEP.test[0].La), // 지도의 중심좌표
		    level: 4 // 지도의 확대 레벨
		};
		
		console.log(R_json.R_CLICKLINEP.test[0].Ma);
		console.log(R_json.R_CLICKLINEP.test[0].La);
		
		// 지도 div와 지도 옵션으로 지도를 생성합니다
		var drawingMap = new kakao.maps.Map(mapContainer, mapOptions),
		overlays = []; // 지도에 그려진 도형을 담을 배열
		var json;
		console.log(R_json.R_CLICKLINEP);
			json = R_json.R_CLICKLINEP;
			getDataFromDrawingMap();
		
		
		function getDataFromDrawingMap() {
		    // 아래 지도에 그려진 도형이 있다면 모두 지웁니다
		    removeOverlays();
		    // 지도에 가져온 데이터로 도형들을 그립니다
		    drawPolyline(json);
		}
			
		// 아래 지도에 그려진 도형이 있다면 모두 지웁니다
		function removeOverlays() {
		    var len = overlays.length, j = 0;
		    for (; j < len; j++) {
		        overlays[j].setMap(null);
		    }
		    overlays = [];
		}
		
		// Drawing Manager에서 가져온 데이터 중 선을 아래 지도에 표시하는 함수입니다
		   function drawPolyline(json) {
				var array = new Array();
				for(var k = 0; k < json.test.length; k++){
					array[k] = new kakao.maps.LatLng(json.test[k].Ma,json.test[k].La);
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
		         
		           var distance = parseInt(R_json.R_CLICKLINEL), // 선의 총 거리를 계산합니다
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
		       
		       for ( l = 0; l < array.length; l++ ){
		    	   if(l==0)
		          		displayCircleDotsStart(array[l]);
		          if(l==array.length-1)
		        	  displayCircleDotsEnd(array[l]);
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
	}//지도

	//댓글 쓰면 li요소에 출력
	 $(".showBtn").click(function(){
		var rNo = $('#R_NO').val();
		var content = $('#input').val();
			var inputMsg = $(this).parent().parent().find(".textInput").val()
			//ajax로 요청]			
			$.ajax({
			    url: "<c:url value="/Community/R_C_Write.do"/>",
				data: {
					r_no:rNo,
					r_comment:content
				},
				dataType:"text",
				type:"post",
				success:function(data){//댓글 입력 성공 
					console.log("서버로부터 받은 데이타:"+data);
					var nickname = data.split('&')[0];
					var no =  data.split('&')[1];
					var commentCount =  data.split('&')[2];
					$('.listUl').append('<div><li class="comment" id="comment'+no+'"><strong>'+nickname+'</strong>&nbsp;'+content+'<div style="text-align:right;"><button class="r_commentdelete" type="button" id="delete'+no+'"style="border:none;font-size:0.2em;">삭제</button></div></li></div>');
					$('#input').val("");
					$('#defaultComment').html('');
					//입력시 끝
					$("#R_COMMENTCOUNT").html("&nbsp;"+commentCount);
					$("#maincomment"+rNo).html("&nbsp;"+commentCount);
					$("#memoDiv").scrollTop($("#memoDiv")[0].scrollHeight);
				}				
			});			
		}); 
	//댓글 삭제 클릭시 삭제처리하기
	$(document).on('click','.r_commentdelete',function(){
		if(confirm("정말로 삭제하시겠습니까?")){
			var r_c_no2 = this.id.split('e')[3];
			var r_no2 = $('#R_NO').val();
				//ajax로 요청]			
				$.ajax({
				    url: "<c:url value="/Community/R_C_Delete.do"/>",
					data: {
						r_c_no : r_c_no2,
						r_no : r_no2
					},
					dataType:"text",
					type:"post",
					success:function(data){//댓글 입력 성공 
						console.log("서버로부터 받은 데이타:"+data);
						//입력시 끝
						$('#comment'+r_c_no2).remove();
						$("#R_COMMENTCOUNT").html("&nbsp;"+data);
						$("#maincomment"+r_no2).html("&nbsp;"+data);
					}				
				});			
		}
	});
	
			
	
	 //모달 속 좋아요
	$("#R_LIKECOUNT").click(function(){
		var rNo = $('#R_NO').val();
		console.log("@@@@@@@@@@@@@@ R_NO : "+rNo);
         console.log($(this).css('color'));
         if($(this).css('color')=='rgb(0, 0, 0)'){
        	 $(this)
        	 .removeClass("fa fa-heart-o")
             .addClass("fa fa-heart")
             .css("color", "red");
             
        	 $.ajax({
                 url: "<c:url value="/Community/R_LikeInsert.do"/>",
                     type: "post",
                     dataType:"json",
                     data: {
                         r_no: rNo
                     },
                     success: function (data) {
                   	  console.log("rNo");
                      $("#like"+rNo).removeClass("fa fa-heart-o").addClass("fa fa-heart").css("color", "red");
                      $("#like"+rNo).html("&nbsp;"+data);
                      $("#R_LIKECOUNT").html("&nbsp;"+data);
                      console.log(data);
                     }
              });
         }
         else{
        	 $(this)
             .removeClass("fa fa-heart")
             .addClass("fa fa-heart-o")
             .css("color", "black");
        	 
        	  $.ajax({
                  url: "<c:url value="/Community/R_LikeDelete.do"/>",
                      type: "post",
                      dataType:"json",
                      data: {
                          r_no: rNo
                      },
                      success: function (data) {
                       $("#like"+rNo).removeClass("fa fa-heart").addClass("fa fa-heart-o").css("color", "black");
                       $("#like"+rNo).html("&nbsp;"+data);
                       $("#R_LIKECOUNT").html("&nbsp;"+data);
                      }
               })////////ajax
         }
      }); 
	  //좋아요 체크 시작         
      //하트 버튼 및 북마트 버튼 판단 변수   
      //하트 버튼 작동 및 좋아요 카운트
      $(".likeSpan").click(function(){
          var r_no1 = this.id.split('e')[1];
         console.log($(this).css('color'));
         if($(this).css('color')=='rgb(0, 0, 0)'){
        	 $(this)
        	 .removeClass("fa fa-heart-o")
             .addClass("fa fa-heart")
             .css("color", "red");
        	 $.ajax({
                 url: "<c:url value="/Community/R_LikeInsert.do"/>",
                     type: "POST",
                     data: {
                         r_no: r_no1
                     },
                     success: function (data) {
                      $("#like"+r_no1).html("&nbsp;"+data);
                        console.log(data);
                     },
              });
         }
         else{
        	 $(this)
             .removeClass("fa fa-heart")
             .addClass("fa fa-heart-o")
             .css("color", "black");
        	 
        	  $.ajax({
                  url: "<c:url value="/Community/R_LikeDelete.do"/>",
                      type: "POST",
                      data: {
                          r_no: r_no1
                      },
                      success: function (data) {
                       $("#like"+r_no1).html("&nbsp;"+data);
                         console.log(data);
                      },
               })
         }
      });
   	 //신고
   	 $('.btnreport').on('click',function(){
   		var rNo = this.id.split('port')[1]
		console.log("report R_NO : "+rNo);
       	$("#myModal").modal('show');
       	$('#ReportR_NO').val(rNo);   	
   	 });
   	
   	 $('#reportSubmit').on('click',function(){
		var rNo = $('#ReportR_NO').val();
		console.log("report R_NO2 : "+rNo);
   		 var rrtitle=$("#R_R_TITLE").val();
   		 console.log(rrtitle);
   		 var rrcomment=$("#R_R_COMMENT").val();
   		 console.log(rrcomment);
   		 if(rrtitle==""){
   			 $("#message1").html("신고 제목을 작성해주세요");
   			 return;
   		 }
   		 $("#message1").html("");
   		 if(rrcomment==""){
   			 $("#message2").html("신고 내용을 작성해주세요");
   			 return;
   		 }
   		 $("#message2").html("");
   		 
   		 $.ajax({
   				url:"<c:url value="/Community/R_ReportInsert.do"/>", // 서버에 전달할 파일명
   				dataType: 'text',
   				type: 'post',
   				data: {
   					r_no : rNo,
   					r_r_title: rrtitle,
   					r_r_content : rrcomment
   				},
   				success: function(data) {
   				     alert('Success');// 성공시 코드 
   				     }
   			});
  		$('#myModal').modal('hide');
  		$('#btnreportFinish'+rNo).css('display', '');
  		$('#btnreport'+rNo).css('display','none');	
   	 });
    </script>
  </body>
</html>