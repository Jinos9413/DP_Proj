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

  </head>
  <body>
  	<jsp:include page="/WEB-INF/views/templates/Top.jsp"/>
  	<!-- Header Section Start -->

    <section id="services" class="section" style="padding-top:200px ; height: 400px ;background-image: url('<c:url value="/resources/img/background/dogwithwoman.jpg"/>');">
      <div class="container" >
        <div class="section-header">          
          <h2 class="section-title wow fadeIn" data-wow-duration="1000ms" data-wow-delay="0.3s">산책하개 <span>돌보미</span></h2>
          <hr class="lines wow zoomIn" data-wow-delay="0.3s">
          <p class="section-subtitle wow fadeIn" data-wow-duration="1000ms" data-wow-delay="0.3s">산책하개와 함께하는 돌보미</p>
        </div>
      </div>
    </section>
    <!-- Features Section Start -->
    <section id="features" class="section" data-stellar-background-ratio="0.2">
      <div class="container">
        <div class="row">
          <div class="col-lg-7 col-md-7 col-sm-7 col-xs-12">
            <div class="content-left text-right wow fadeInLeft animated" data-wow-offset="10">
              <div class="box-item left" style="margin-top: 30px;">
                <div class="section-header">          
		          <h2 class="section-title wow fadeIn" data-wow-duration="1000ms" data-wow-delay="0.3s">강아지를 부탁해의 동반자</h2>
		          <h2 class="section-title wow fadeIn" data-wow-duration="1000ms" data-wow-delay="0.3s">돌보미에 지원해주세요</h2>
		        </div>
              </div>
              <div class="box-item left" style="margin-top: 30px;">
                <div class="text" style="text-align: center;">
                  <h4>반려동물을 사랑하는 분을 모십니다</h4>
                  <h4>저희와 함께 행복한 선물을 전해주세요</h4>
                </div>
              </div>
              <div class="box-item left" style="margin-top: 30px;">
                <div class="text" style="text-align: center;">
                	<c:if test="${t_no == -1 && power == 1 }">
                		<a href="<c:url value="/PetSitter/PetSitterForm.do"/>" class="btn btn-common" style="font-size: 2em;">지원하기<span class="lnr lnr-paw"></span></a>
                	</c:if>
                	<c:if test="${t_no != -1 && power == 1 }">
                		<a class="btn btn-common" style="font-size: 2em;">심사 중<span class="lnr lnr-paw"></span></a>
                	</c:if>
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-5 col-md-5 col-sm-5 col-xs-12">
            <div class="show-box wow fadeInDown animated" data-wow-offset="10">
              <img src="<c:url value="/resources/img/dog/dogs.png"/>" alt="">
            </div>
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
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<jsp:include page="/WEB-INF/views/templates/Notice.jsp"/>
  </body>
</html>