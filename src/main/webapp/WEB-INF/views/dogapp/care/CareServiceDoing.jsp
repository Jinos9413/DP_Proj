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

  </head>
  <body>
  	<jsp:include page="/WEB-INF/views/templates/Top.jsp"/>

  	<!-- Header Section Start -->
		<section id="services" class="section" style="padding-top:200px ; height: 400px ;background-image: url('<c:url value="/resources/img/background/doghug.jpg"/>');">
	      <div class="container" >
	        <div class="section-header">          
	          <h2 class="section-title wow fadeIn" data-wow-duration="1000ms" data-wow-delay="0.3s">돌봄 및 산책 <span>진행중인 돌봄</span></h2>
	          <hr class="lines wow zoomIn" data-wow-delay="0.3s">
	          <p class="section-subtitle wow fadeIn" data-wow-duration="1000ms" data-wow-delay="0.3s">내가 신청한 현황 중 state = 2</p>
	        </div>
	      </div>
	    </section>
	    <div class="page-title" style="background-color: #f5efb4; text-align: center;">
	   		<a href="<c:url value="/Care/CareServiceMain.do"/>">돌봄 신청현황</a>
	   		<a class="on" href="<c:url value="/Care/CareServiceDoing.do"/>">진행중인 돌봄</a>
	   		<a href="<c:url value="/Care/CareServiceDone.do"/>">종료된 돌봄</a>
	    </div>
   		
     	<section id="blog" class="section">
      <!-- Container Starts -->
      		<div class="container">
		      	<div class="row">
		      		<div class="col-md-9">
		        		<p style="font-size: 2em; font-weight: bold;">돌봄 및 산책 신청현황입니다</p>
		        		<p style="color: gray;">확정된 공고를 임의로 삭제시 불이익이 발생할 수 있습니다</p>
					</div>
					<div class="col-md-3" style="text-align: right;">
						<a href="<c:url value="/Care/CareWrite.do"/>" class="btn btn-common">공고등록</a>
					</div>
				</div>
				<hr/>
		        <div class="row">
		        	<c:if test="${empty listPagingData.lists }" var="isEmpty">
						<div >등록된 게시물이 없어요</div>
					</c:if>
					<c:if test="${not isEmpty }">
						<c:forEach items="${listPagingData.lists }" var="item" varStatus="loop">
							<c:if test="${item.care_state == state && item.id == sessionScope.id }">
								<div class="col-sm-12 col-md-4 blog-item">
						            <!-- Blog Item Starts -->
						            <div class="blog-item-wrapper wow fadeInUp" data-wow-delay="0.1s">
						            	<a href="<c:url value="/Care/CareServiceDoingView.do?care_no=${item.care_no}&nowPage="/><c:out value="${param.nowPage}" default="1"/>" style="display: block;">
						              		<div class="blog-item-img" style="height: 200px; overflow:hidden;" >
						                		<img style="width: 100%;" src="<c:url value="/upload/${fn:split(item.care_images,'/')[0] }"/>">             
						              		</div>
						              	</a>
						              <div class="blog-item-text" style="text-align: center; padding-top: 10px;">    
						                <p style="color: black; font-size: 1.5em;">${item.care_title }</p>
						                <span style="color:black">${item.care_clickLineA }<br/>${item.care_datepicker } ${item.care_timepicker }</span>
										<div>&nbsp;</div>
										<div style="font-size: 1.5em">
											<span class="lnr lnr-heart">${likeList[loop.index] }</span>
											<button class="lnr lnr-envelope chatClick" style="background: none; border: none; cursor: pointer;" id="${item.care_no }">${chatList[loop.index] }</button>
										</div>
						                <hr/>
					                	<p style="font-size: 1.5em; font-weight: bold;">${item.care_price }원</p>
						              </div>
						            </div>
						           </div>
					           </c:if>
						</c:forEach>
					</c:if>
		        </div>
			<div class="row" style="text-align: center;">
			${listPagingData.pagingString}
		</div>
      </div>
	
    </section>
	<div class="modal  fade" id="chatModal" >
    		<div class="modal-dialog">
    			<div class="modal-content" style="padding: 20px;">
    				<div class="modal-header">
    					<button class="close" data-dismiss="modal"><span>&times;</span></button>
    					<p class="modal-title" style="text-align: center; font-size: 2em;">대화 목록</p>
    				</div>
    				<div class="modal-body" style="font-size: 1.5em;padding-left: 10px;">
    					
    				</div>
    				<div class="modal-footer">
    					<button class="btn btn-common" data-dismiss="modal">닫기</button>
    				</div>
    			</div>    		
    		</div>    	
    	</div>
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
    <script>
    $(function(){
    	$('.chatClick').click(function(){
    		var cnoChat = this.id;
    		var arrchat;
    		var arr;
    		$('.modal-body').html("");
    		$.ajax({
				url:"<c:url value="/Chat/CnoChatList.do" />",//요청할 서버의 URL 주소
				type:"post",//데이터 전송방식(디폴트는 get방식)
				dataType:'json',//서버로부터 받을 응답 데이터의 형식 설정
				data:
					{
						care_no:cnoChat
					},
				success:function(data){//서버로부터 정상적인 응답(200)을 받았을 때 호출되는 콜백함수
					var count = 0;
					for(var i = 0 ; i<data.length; i++){
						var read = false;
						if(data[i].READ_ == 1) read = true;
						if(data[i].CARE_NO == cnoChat){
							if(read && data[i].FROM_ID != '${sessionScope.id}'){
								$('.modal-body').append('<a href="<c:url value="/Chat/ChatView.do?care_no='+cnoChat+'&t_no='+data[i].T_NO+'"/>">'+data[i].NICKNAME+'<span style="color: black;"> : '+data[i].CHAT_CONTENT+'</span><span style="color: red;font-size:1em;">새로운 메시지</span></a>');
							}
							else{
								$('.modal-body').append('<a href="<c:url value="/Chat/ChatView.do?care_no='+cnoChat+'&t_no='+data[i].T_NO+'"/>">'+data[i].NICKNAME+'<span style="color: black;"> : '+data[i].CHAT_CONTENT+'</span></a>');
							}
							count++;
						}
		    		}
					if(count == 0){
						$('.modal-body').append('<p>대화 신청 목록이 없습니다</p>');
					}
					$('#'+cnoChat+'').html(count);
					$('#chatModal').modal('show');
				},
				error: function(error){//서버로부터 비정상적인 응답을 받았을 때 호출되는 콜백함수
				}
			});
    	});
    });//'+data[i].FROM_ID+' != sessionScope.id &&
    </script>
  </body>
</html>