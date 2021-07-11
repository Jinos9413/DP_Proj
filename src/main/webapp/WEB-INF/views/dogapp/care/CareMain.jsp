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

   <section id="services" class="section" style="padding-top:200px ; height: 400px ;background-image: url('<c:url value="/resources/img/background/doghug.jpg"/>');">
      <div class="container" >
        <div class="section-header">          
          <h2 class="section-title wow fadeIn" data-wow-duration="1000ms" data-wow-delay="0.3s">돌봄 <span>산책 서비스</span></h2>
          <hr class="lines wow zoomIn" data-wow-delay="0.3s">
          <p class="section-subtitle wow fadeIn" data-wow-duration="1000ms" data-wow-delay="0.3s">돌보미 페이지에서 돌보미 신청을 하실 수 있습니다.</p>
        </div>
      </div>
    </section>
	<section id="services" class="section" >
      <div class="container" >
        <div class="row">
          <div class="col-md-6 col-sm-6" >
            <div class="item-boxes wow fadeInDown" data-wow-delay="0.2s" >
              <div class="icon">
                <i class="lnr lnr-paw"></i>
              </div>
              <h4>돌봄 서비스 신청 현황</h4>
              <p>돌봄 서비스를 신청하시거나 <br/>진행 중인 서비스를 확인하실 수 있습니다.</p>
              <a href="<c:url value="/Care/CareServiceMain.do"/>" class="btn btn-common">이동</a>
            </div>
          </div>
          <div class="col-md-6 col-sm-6" >
            <div class="item-boxes wow fadeInDown" data-wow-delay="0.4s" style="height: 400px; padding-top: 50px;">
              <div class="icon">
                <i class="lnr lnr-user"></i>
              </div>
              <h4>돌보미</h4>
              <p>돌보미 등록 후 이용하실 수 있습니다.<br/>돌보미가 되어주세요</p>
              <a href="<c:url value="/Care/TrainerMain.do"/>" class="btn btn-common">이동</a>
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