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
  <body > 
  	<jsp:include page="/WEB-INF/views/templates/Top.jsp"/>
  	<section id="contact" class="section" style="padding-top: 150px; background-image: url('<c:url value="/resources/img/dog/dogLogin.jpg"/>');">
      <div class="container" >
        <div class="row justify-content-md-center">          
          <div class="col-md-offset-2 col-md-8 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="0.3s">            
            <div class="contact-block" >
              <div class="section-header">          
                <h2 class="section-title wow fadeIn" data-wow-duration="1000ms" data-wow-delay="0.3s">로그인 <span>LOGIN</span></h2>
                <hr class="lines wow zoomIn" data-wow-delay="0.3s">
                <h6 data-wow-duration="0.3s" style="color: gray; padding-top: 10px;">아이디가 없으시면 회원가입 후 이용해주세요</h6>
              </div>
              <form action="<c:url value="/Member/Login.do"/>" id="loginform" method="post">
                <div class="row">
                  <div class="col-md-offset-2 col-md-2">
                  	<div class="form-group" style="line-height: 50px;">
                  		<span style="color: orange; font-size: 1.5em;">아이디</span>
                  	</div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group">
                      <input style="color: black;" type="text" class="form-control" name="id" placeholder="아이디" id="id">
                    </div>                                 
                  </div>
                 </div>
                 <div class="row">
                  <div class="col-md-offset-2 col-md-2">
                  	<div class="form-group" style="line-height: 50px;">
                  		<span style="color: orange; font-size: 1.5em;">비밀번호</span>
                  	</div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group">
                      <input style="color: black;" type="password" class="form-control" name="pwd" placeholder="비밀번호" id="pwd">
                    </div> 
                  </div>
                  </div>
                  <div class="col-md-12">
                    <div class="text-center">
                      <span class="btn btn-common" id="submit" style="cursor: pointer;">로그인</span>
                      <a href="<c:url value="/Auth/Join.do"/>" class="btn btn-common">회원가입</a>
                    </div>
                    <div class="text-center">
                      <a href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=P1L9JVLRfyfHdnhZIBfG&state=${sessionScope.state }&redirect_uri=http://localhost:9090/dogapp/Auth/NaverLogin.do">
                      	<img src="<c:url value="/resources/img/naver/btnGLogin.png"/>" style="width: 230px; padding-bottom: 10px;">
                      </a>
                    </div>
                    <div class="text-center">
                      <a href="https://kauth.kakao.com/oauth/authorize?client_id=b5d0c752539c43e76387f10c79ce3df8&redirect_uri=http://localhost:9090/dogapp/Auth/KakaoLogin.do&response_type=code">
						  <img src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg" style="width: 230px"  />
					  </a>
                    </div>
                  </div>           
              </form>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- Contact Section End -->

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
    <script>
    $(function() {
	    $("#submit").on("click",function() {
			if ($("#id").val() == "") {
				alert("아이디를 입력해주세요.");
				$("#id").focus();
				return false;
			}
			if ($("#pwd").val() == "") {
				alert("비밀번호를 입력해주세요.");
				$("#pwd").focus();
				return false;
			}
			$.ajax({
				url : '<c:url value="/Member/isMember.do"/>',
				type : "post",
				dataType : "json",
				data : {
					"id" : $("#id").val().trim(),
					"pwd" : $("#pwd").val().trim()
				},
				success : function(data) {
					console.log(data);
					if (data==1) {
						$('#loginform').submit();
					} 
					else{
						alert("아이디와 비밀번호를 확인해주세요.");
					}
				}
			});
		});///////////////////submit
	    
    });
    </script>
  </body>
</html>