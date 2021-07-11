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
	
    <section id="contact" class="section" style="background-color: white;">
      <div class="container">
        <div class="row justify-content-md-center"  >          
          <div class="col-md-offset-2 col-md-8 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="0.3s">            
            <div class="contact-block" style="background-color: #f3f3f3;">
              <div class="section-header">          
                <h2 class="section-title wow fadeIn" data-wow-duration="1000ms" data-wow-delay="0.3s">돌보미 <span>지원양식</span></h2>
              </div>
              <form action="<c:url value="/PetSitter/PetSitterFormProcess.do"/>" method="post" id="frm" enctype="multipart/form-data">
                <div class="row">
                  <div class="col-md-12" style="text-align: center;">
                  		<div id="imagePreview" >
							<img style="width: 150px; height: 150px;" src='<c:url value="/resources/img/basicperson.png"/>' />
						</div>
						<label class="btn" style="color: orange;" for="real-input">사진 선택</label>
                  		<input style="display: none;" type="file" name="t_photo" id="real-input" multiple="multiple">
                  </div>
                  <div class="offset-md-1 col-md-2">
                     <div class="form-group" style="line-height: 50px;">
                        <span style="color: orange; font-size: 1.5em;">제목</span><br/>
                        <span style="color: orange; font-size: 1.5em;">자기소개</span>
                     </div>                     
                  </div>
                  
                  <div class="col-md-6">
                    <div class="form-group">
                      <input style="color: black;" type="text" class="form-control" name="t_title" placeholder="제목">                      
                      <textarea rows="10" cols="50"  name="t_content" placeholder="자기소개"></textarea>
                    </div>                                 
                  </div>
                  
                  <div class="col-md-12">
                    <div class="submit-button text-center">
                      
                      <input class="btn btn-common" id="submit" type="submit" value="제출하기"/>
                    </div>
                  </div>
                </div>            
              </form>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- blog Section End -->
	
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
    <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.3/dist/jquery.validate.min.js"></script>
	<jsp:include page="/WEB-INF/views/templates/Notice.jsp"/>
	<script>
	    $(function(){
	       $("#frm").validate({
	          rules:{
	             ctitle:"required",
	             ccontent:"required",
	             images:"required"
	          },
	          messages:{
	             ctitle:"제목을 입력하세요",
	             ccontent:"자기소개를 입력하세요",
	             images:"사진을 추가하세요"
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
			            reader.readAsDataURL(input.target.files[i])
			        }
		        }	
		    }
	      
	    });
    </script>
    
  </body>
</html>