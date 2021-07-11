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

  </head>
  <body>
  	<jsp:include page="/WEB-INF/views/templates/Top.jsp"/>
  	<!-- Header Section Start -->

    <header id="video-area" data-stellar-background-ratio="0.5">    
      <div id="block" data-vide-bg="<c:url value="/resources/video/video.mp4"/>"></div>
      <div class="overlay overlay-2"></div>      
      <div class="container">
        <div class="row justify-content-md-center">
          <div class="col-md-12">
            <div class="contents text-center">
              <p class="lead  wow fadeIn" data-wow-duration="1000ms" data-wow-delay="400ms">최고의 반려동물 파트너</p>
              <h1 class="wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="0.3s">강아지를 부탁해</h1>
              <c:if test="${empty sessionScope.id }" var="Login">
              	<a href="<c:url value="/Auth/Login.do"/>" class="btn btn-common wow fadeInUp" data-wow-duration="1000ms" data-wow-delay="400ms"><i class="lnr lnr-user"></i> 로그인</a>
              </c:if>
             <c:if test="${!Login }">
              	<a href="<c:url value="/Auth/Logout.do"/>" class="btn btn-common wow fadeInUp" data-wow-duration="1000ms" data-wow-delay="400ms"><i class="lnr lnr-user"></i> 로그아웃</a>
              	<a href="<c:url value="/Member/MyPage.do"/>" class="btn btn-common wow fadeInUp" data-wow-duration="1000ms" data-wow-delay="400ms"><i class="lnr lnr-user"></i> 마이페이지</a>
              	<c:if test="${sessionScope.power == 10 || sessionScope.power == 5 }">
              	<a href="<c:url value="/Backend/Home.do"/>" class="btn btn-common wow fadeInUp" data-wow-duration="1000ms" data-wow-delay="400ms"><i class="lnr lnr-user"></i> 관리자페이지</a>
              	</c:if>
              </c:if>
            </div>
          </div>
        </div> 
      </div>      
    </header> 
    <!-- Features Section Start -->
    <section id="features" class="section" data-stellar-background-ratio="0.2">
      <div class="container">
        <div class="section-header">          
          <h2 class="section-title wow fadeIn" data-wow-duration="1000ms" data-wow-delay="0.3s">강아지를 <span>부탁해</span></h2>
          <hr class="lines wow zoomIn" data-wow-delay="0.3s">
        </div>
        <div class="row">
          <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
            <div class="content-left text-right wow fadeInLeft animated" data-wow-offset="10">
              <div class="box-item left">
                <span class="icon">
                  <i class="lnr lnr-rocket"></i>
                </span>
                <div class="text">
                  <h4>반려동물 인구 1000만 시대</h4>
                  <p>반려동물 시장규모는 2027년까지 6조원까지</p>
                </div>
              </div>
              <div class="box-item left">
                <span class="icon">
                  <i class="lnr lnr-laptop-phone"></i>
                </span>
                <div class="text">
                  <h4>아이 대신 반려동물, 딩펫족</h4>
                  <p>반려동물 양육 가구의 85.6%는</p>
                  <p>반려동물을 가족처럼 생각</p>
                </div>
              </div>
              <div class="box-item left">
                <span class="icon">
                  <i class="lnr lnr-cog"></i>
                </span>
                <div class="text">
                  <h4>1인 가구의 증가</h4>
                  <p>1인 가구 증가와 함께</p>
                  <p>반려동물 시장 및 산업이 급성장</p>
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
            <div class="show-box wow fadeInDown animated" data-wow-offset="10">
              <img src="<c:url value="/resources/img/dog/dogs.png"/>" alt="">
            </div>
          </div>
          <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
            <div class="content-right text-left wow fadeInRight animated" data-wow-offset="10">
              <div class="box-item right">
                <span class="icon">
                  <i class="lnr lnr-camera-video"></i>
                </span>
                <div class="text">
                  <h4>커뮤니티 제공</h4>
                  <p>사진 및 산책로 공유</p>
                </div>
              </div>
              <div class="box-item right">
                <span class="icon">
                  <i class="lnr lnr-magic-wand"></i>
                </span>
                <div class="text">
                  <h4>정보 제공</h4>
                  <p>챗봇과 크롤링을 통한</p>
                  <p> 손쉬운 정보 검색</p>
                </div>
              </div>
              <div class="box-item right">
                <span class="icon">
                  <i class="lnr lnr-spell-check"></i>
                </span>
                <div class="text">
                  <h4>대리 산책 서비스</h4>
                  <p>대리 산책 신청자와</p>
                  <p>돌보미를 매칭</p>
                </div>
              </div>
            </div>
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
  </body>
</html>