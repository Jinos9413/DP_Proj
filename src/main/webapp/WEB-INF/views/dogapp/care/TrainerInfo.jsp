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
    <title>강아지를 부탁해</title>
  </head>
  <style>
  .checked {
  	color: orange;
	}
  </style>
  <body>
  	<jsp:include page="/WEB-INF/views/templates/Top.jsp"/>
  	<!-- Header Section Start -->
	<section id="services" class="section" style="padding-top:200px ; height: 400px ;background-image: url('<c:url value="/resources/img/background/doghug.jpg"/>');">
      <div class="container" >
        <div class="section-header">          
          <h2 class="section-title wow fadeIn" data-wow-duration="1000ms" data-wow-delay="0.3s">돌보미 정보<span>내 정보</span></h2>
          <hr class="lines wow zoomIn" data-wow-delay="0.3s">
          <p class="section-subtitle wow fadeIn" data-wow-duration="1000ms" data-wow-delay="0.3s">돌보미 정보를 확인할 수 있습니다.</p>
        </div>
      </div>
    </section>
    <div class="page-title" style="background-color: #f5efb4; text-align: center;">
    	<a class="on" href="<c:url value="/Care/TrainerInfo.do"/>">돌보미 정보</a>
    	<a href="<c:url value="/Care/TrainerMain.do"/>"> 대리산책</a>
   		<a href="<c:url value="/Care/CareServiceMap.do"/>">대리산책지도(지도)</a>
   		<a href="<c:url value="/Care/TrainerDoing.do"/>">진행중인 서비스</a>
    </div>
     <section id="blog" class="section">
      <!-- Container Starts -->
      <div class="container">

		<div class="row">
			<div class="col-md-12">
				<table class="table table-bordered table-striped">
					<tr>
						<th colspan="2" style="text-align: center;">
							<span class="lnr lnr-chevron-left" id="prevImage" style="height: 150px; cursor: pointer;"></span>
							<c:forEach items="${trainer_images }" var="image" varStatus="loop">
								<img style="width: 150px; height: 150px; display: none;" src="<c:url value="/upload/${image }"/>" id="image${loop.index }" class="image" >
							</c:forEach>
							<span class="lnr lnr-chevron-right" id="nextImage" style="height: 150px; cursor: pointer;"></span>
						</th>
					</tr>
					<tr>
						<th class="col-md-2 text-center">닉네임</th>
						<td>${trainer.NICKNAME }</td>
					</tr>
					<tr>
						<th class="col-md-2 text-center">인사말</th>
						<td>${trainer.T_TITLE }</td>
					</tr>
					<tr>
						<th class="text-center">자기소개</th>
						<td>${trainer.T_CONTENT }</td>
					</tr>
					<tr>
						<th class="text-center">서비스 횟수</th>
						<td>${reviewList.size() }</td>
					</tr>
					<tr>
						<th class="text-center">별점</th>
						<td>
							<c:if test="${avgOfRate >= 1 && avgOfRate < 2 }">
								<i class="fa fa-star checked"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>
							</c:if>
							<c:if test="${avgOfRate >= 2 && avgOfRate < 3 }">
								<i class="fa fa-star checked"></i><i class="fa fa-star checked"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>
							</c:if>
							<c:if test="${avgOfRate >= 3 && avgOfRate < 4 }">
								<i class="fa fa-star checked"></i><i class="fa fa-star checked"></i><i class="fa fa-star checked"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>
							</c:if>
							<c:if test="${avgOfRate >= 4 && avgOfRate < 5 }">
								<i class="fa fa-star checked"></i><i class="fa fa-star checked"></i><i class="fa fa-star checked"></i><i class="fa fa-star checked"></i><i class="fa fa-star"></i>
							</c:if>
							<c:if test="${avgOfRate == 5 }">
								<i class="fa fa-star checked"></i><i class="fa fa-star checked"></i><i class="fa fa-star checked"></i><i class="fa fa-star checked"></i><i class="fa fa-star checked"></i>
							</c:if>
							<c:if test="${reviewList.size() != 0}">
								(<fmt:formatNumber value="${avgOfRate }" pattern="0.#"/>점)
							</c:if>
							<c:if test="${reviewList.size() == 0}">
								후기가 없습니다
							</c:if>
						</td>
					</tr>
					<tr>
						<th class="text-center" colspan="2">후기</th>
					</tr>
				</table>
				<section id="portfolios" class="section" style="padding: 30px;">
			      <!-- Container Starts -->
			      <div class="container" >
			        <div class="row">          
			          <div class="col-md-11">
			            <!-- Portfolio Recent Projects -->
			            
			            <div id="portfolio" class="row wow fadeInUp" data-wow-delay="0.1s">
			              <c:if test="${empty reviewList }">
			              		등록된 후기가 없습니다.
			              </c:if>
			              <c:forEach items="${reviewList }" var="item" >
			              
							<div class="col-sm-6 col-md-4 col-lg-4 col-xl-4" style="margin-bottom: 10px;">
								<div class="portfolio-item">
									<div class="shot-item" style="font-size: 1.2em; padding: 20px;">
										<img src="<c:url value="/upload/${item.PIC_NAME }"/>" style="width: 10%; margin: 10px;"/>
										<span style="margin-right: 30px;">${item.NICKNAME }</span><span style="font-size: 0.8em"><fmt:formatDate value="${item.T_R_POSTDATE }" pattern="yyyy-MM-dd"/></span>
										<p>
											<c:if test="${item.TRAINER_RATE == 1 }">
												<i class="fa fa-star checked"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>
											</c:if>
											<c:if test="${item.TRAINER_RATE == 2 }">
												<i class="fa fa-star checked"></i><i class="fa fa-star checked"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>
											</c:if>
											<c:if test="${item.TRAINER_RATE == 3 }">
												<i class="fa fa-star checked"></i><i class="fa fa-star checked"></i><i class="fa fa-star checked"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>
											</c:if>
											<c:if test="${item.TRAINER_RATE == 4 }">
												<i class="fa fa-star checked"></i><i class="fa fa-star checked"></i><i class="fa fa-star checked"></i><i class="fa fa-star checked"></i><i class="fa fa-star"></i>
											</c:if>
											<c:if test="${item.TRAINER_RATE == 5 }">
												<i class="fa fa-star checked"></i><i class="fa fa-star checked"></i><i class="fa fa-star checked"></i><i class="fa fa-star checked"></i><i class="fa fa-star checked"></i>
											</c:if>
										</p>
										<p>${item.T_R_CONTENT }</p>
									</div>               
								</div>
							</div>
			              
			              </c:forEach>
			            </div>
			          </div>
			        </div>
			      </div>
			      <!-- Container Ends -->
			    </section>
			</div>
		</div>
		 
		<!-- row -->
		<div class="row">
			<div class="col-md-offset-2 col-md-8" style="text-align: center;">
				<a href="<c:url value='/Care/TrainerMain.do?nowPage=${param.nowPage}'/>" class="btn btn-common">목록</a>
			</div>
		</div>	
	</div>
    </section>
    
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
	</script>
  </body>
</html>