<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="<c:url value="/resources/css/font-awesome.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/line-icons.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/owl.carousel.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/owl.theme.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/nivo-lightbox.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/magnific-popup.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/animate.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/menu_sideslide.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/main.css"/>">    
    <link rel="stylesheet" href="<c:url value="/resources/css/responsive.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/colors/orange.css"/>">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="<c:url value="/resources/css/chat.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/page-title.css"/>">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
    	.nav-item:hover{
    		text-decoration: underline;
    		font-weight: bold;
    		font-size: 1.2em;
    	}

    </style>
 <nav class="navbar navbar-default navbar-fixed-top" style="background-color: white" id="fixedNavbar">	
	<div class="container-fluid " style="height: 70px; width: 80%;" >
		<div class="navbar-header">
			<!--화면 크기가 작을때 보여지는 네비게이션바(모바일용)  -->
			<button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#collapse-menu" style="font-size: 2em;">
				<span class="icon-bar"></span> <span class="icon-bar"></span> 
				<span class="icon-bar"></span>
			</button>
			<!-- CI표시 -->
			<a class="navbar-brand" href="<c:url value="/"/>" style="font-size: 2em; color: #F57D41;">
				<span style="color: #F57D41;" class="lnr lnr-paw"></span> <strong>강아지를 부탁해</strong>
			</a>
		</div>
		<!-- 화면 크기가 클때 상단에 보여지는 네비게이션바(데스크탑용) -->
		<div class="collapse navbar-collapse" id="collapse-menu" style="background-color: white;">
			<ul class="nav navbar-nav navbar-right" >
				<li class="nav-item">
                	<a href="<c:url value="/"/>">Home</a>
              	</li>
              	<c:if test="${empty sessionScope.id }" var="Login">
              	<li class="nav-item">
              		<a href="<c:url value="/Auth/Login.do"/>">로그인</a>
              	</li>
              	</c:if>
              	<c:if test="${!Login }">
              	<li class="nav-item">
              	<a href="<c:url value="/Auth/Logout.do"/>">로그아웃</a>
              	</li>
              	<li class="nav-item">
	            	<a href="<c:url value="/Member/MyPage.do"/>"> 마이페이지</a>
		      	</li>
              	</c:if>
			  	<li class="nav-item">
                	<a href="<c:url value="/Chat/ChatMain.do"/>">채팅</a>
              	</li>  
              	<li class="nav-item">
                	<a href="<c:url value="/Care/CareMain.do"/>">돌봄 및 산책</a>
              	</li>                            
              	<li class="nav-item">
                	<a href="<c:url value="/Community/Photo/P_Main.do"/>">커뮤니티</a>
              	</li>
              	<c:if test="${sessionScope.power == 1}">
              	<li class="nav-item">
                	<a href="<c:url value="/PetSitter/PetSitterMain.do"/>" style="font-weight: bold;">돌보미 지원</a>
              	</li>
              	</c:if>
			</ul>
		</div>
	</div>
	<div class="col-md-offset-8 col-md-3">
		<div id="dialog" title="새로운 메세지" style="display: none;overflow:hidden; ">
			<div class="row">
				<div class="col-xs-4" id="dialogImage">
					<img src="<c:url value="/resources/img/basicperson.png"/>">
				</div>
				<div class="col-xs-8">
					<p id="dialogNickname" style="font-weight: bold;"></p>
					<p id="dialogMessage"></p>
				</div>
			</div>
		</div>
	</div>
</nav>
