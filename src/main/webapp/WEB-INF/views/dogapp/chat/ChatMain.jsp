<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<title>강아지를 부탁해</title>
	
</head>
<body>
	<jsp:include page="/WEB-INF/views/templates/Top.jsp"/>
	<section id="services" class="section" style="padding-top:200px ; height: 400px ;background-image: url('<c:url value="/resources/img/background/dogwithwoman.jpg"/>');">
      <div class="container" >
        <div class="section-header">          
          <h2 class="section-title wow fadeIn" data-wow-duration="1000ms" data-wow-delay="0.3s">채팅 <span>리스트</span></h2>
          <hr class="lines wow zoomIn" data-wow-delay="0.3s">
          <p class="section-subtitle wow fadeIn" data-wow-duration="1000ms" data-wow-delay="0.3s">돌보미 페이지에서 돌보미 신청을 하실 수 있습니다.</p>
        </div>
      </div>
    </section>
	<div class="container">
	<hr/>
		대화 상대를 존중해주세요
	<hr/>
	<div class="messaging">
      <div class="inbox_msg">
        <div class="inbox_people" style="width: 100%; background: white;">
          <div class="headind_srch" >
            	<div>
            		<button id="cnoMsgBtn" class="btn btn-common" style="color:#F57D41; background-color: white;">받은 신청</button>
              		<button id="tnoMsgBtn" class="btn btn-common">보낸 신청</button>
              	</div>
          </div>
          <div class="inbox_chat" id="cnoMsgBox">
            <c:if test="${empty cnoList }" var="isEmpty">
				<div >등록된 게시물이 없어요</div>
			</c:if>
			<c:if test="${not isEmpty }">
				<c:forEach items="${cnoList }" var="item" varStatus="loop">
					<div class="chat_list">
		              <div class="chat_people" style="cursor: pointer; height: 100px;"  onclick="location.href='<c:url value="/Chat/ChatView.do?care_no=${item.CARE_NO }&t_no=${item.T_NO }"/>'">
		                <div class="chat_img"> <img src="<c:url value="/upload/${item.T_PHOTO }"/>" alt="sunil"> </div>
		                <div class="chat_ib">
		                  <h5 style="color: black; font-size: 1.5em; font-weight: bold">${item.CARE_TITLE } <span class="chat_date" style="font-family: serif;"><fmt:formatDate value="${item.CHAT_POSTDATE }" pattern="yy-MM-dd HH시mm분"/></span></h5>
		                  <p style="color: black; font-size: 1.2em">${item.NICKNAME }</p>
		                  <span style="color: black; font-size: 1.2em">${item.CHAT_CONTENT }</span>
		                  <c:if test="${item.FROM_ID != sessionScope.id && item.READ_ == 1}">
		                  	<span style="color: red;">새로운 메시지</span>
		                  </c:if>
		                </div>
		              </div>
		            </div>
				</c:forEach>
			</c:if>
          </div>
          <div class="inbox_chat" style="display: none;" id="tnoMsgBox">
            <c:if test="${empty tnoList }" var="isEmpty">
				<div >등록된 게시물이 없어요</div>
			</c:if>
			<c:if test="${not isEmpty }">
				<c:forEach items="${tnoList }" var="item" varStatus="loop">
					<div class="chat_list">
		              <div class="chat_people" style="cursor: pointer; height: 100px;"  onclick="location.href='<c:url value="/Chat/ChatView.do?care_no=${item.CARE_NO }&t_no=${item.T_NO }"/>'">
		                <div class="chat_img"> <img src="<c:url value="/upload/${item.PIC_NAME }"/>" alt="sunil"> </div>
		                <div class="chat_ib">
		                  <h5 style="color: black; font-size: 1.5em; font-weight: bold">${item.CARE_TITLE } <span class="chat_date">${item.CHAT_POSTDATE }</span></h5>
		                  <p style="color: black; font-size: 1.2em">${item.NICKNAME }</p>
		                  <span style="color: black; font-size: 1.2em">${item.CHAT_CONTENT }</span>
		                  <c:if test="${item.FROM_ID != sessionScope.id && item.READ_ == 1}">
		                  	<span style="color: red;">새로운 메시지</span>
		                  </c:if>
		                </div>
		              </div>
		            </div>
				</c:forEach>
			</c:if>
          </div>
        </div>
      </div>
    </div></div>
	<!-- 실제 내용 끝 -->
	<!--  푸터 시작 -->
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
	<!-- 푸터 끝 -->
	<script>
	$(function(){
		$('#cnoMsgBtn').on('click',function(){
			$('#cnoMsgBtn').css('backgroundColor', 'white').css('color', '#F57D41');
			$('#tnoMsgBtn').css('backgroundColor', '#F57D41').css('color', 'white');
			$('#cnoMsgBox').css('display',"");
			$('#tnoMsgBox').css('display',"none");
		});
		$('#tnoMsgBtn').on('click',function(){
			$('#tnoMsgBtn').css('backgroundColor', 'white').css('color', '#F57D41');
			$('#cnoMsgBtn').css('backgroundColor', '#F57D41').css('color', 'white');
			$('#cnoMsgBox').css('display',"none");
			$('#tnoMsgBox').css('display',"");
		});
	});
		
	</script>
</body>
</html>