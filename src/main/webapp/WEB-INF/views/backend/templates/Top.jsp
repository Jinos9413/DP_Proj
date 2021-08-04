<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<link href="https://fonts.googleapis.com/css?family=Muli:300,300i,400,400i,600,600i,700,700i%7CComfortaa:300,400,700" rel="stylesheet">
    <link href="https://maxcdn.icons8.com/fonts/line-awesome/1.1/css/line-awesome.min.css" rel="stylesheet">
    <!-- BEGIN VENDOR CSS-->
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/theme-assets/css/vendors.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/theme-assets/vendors/css/charts/chartist.css"/>">
    <!-- END VENDOR CSS-->
    <!-- BEGIN CHAMELEON  CSS-->
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/theme-assets/css/app-lite.css"/>">
    <!-- END CHAMELEON  CSS-->
    <!-- BEGIN Page Level CSS-->
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/theme-assets/css/core/menu/menu-types/vertical-menu.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/theme-assets/css/core/colors/palette-gradient.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/theme-assets/css/pages/dashboard-ecommerce.css"/>">
    <!-- END Page Level CSS-->
    <!-- BEGIN Custom CSS-->
    <!-- END Custom CSS-->
<!-- fixed-top-->
    <nav class="header-navbar navbar-expand-md navbar navbar-with-menu navbar-without-dd-arrow fixed-top navbar-semi-light">
      <div class="navbar-wrapper">
        <div class="navbar-container content">
          <div class="collapse navbar-collapse show" id="navbar-mobile">
            <ul class="nav navbar-nav mr-auto float-left">
              <li class="nav-item d-block d-md-none"><a class="nav-link nav-menu-main menu-toggle hidden-xs" href="#"><i class="ft-menu"></i></a></li>
            </ul>
            <ul class="nav navbar-nav float-right">
              <li class="dropdown dropdown-user nav-item"><a class="dropdown-toggle nav-link dropdown-user-link" href="#" data-toggle="dropdown">             
              	<span class="avatar avatar-online">
              	<img src="<c:url value="/resources/img/basicperson.png"/>">
              	<i></i></span></a>
                <div class="dropdown-menu dropdown-menu-right">
                  <div class="arrow_box_right"><a class="dropdown-item" href="#">
                  	<span class="avatar avatar-online"><img src="<c:url value="/resources/img/basicperson.png"/>" alt="avatar">
                  	<span class="user-name text-bold-700 ml-1">John Doe</span></span></a>
                    <div class="dropdown-divider"></div>
	                    <a class="dropdown-item" href="#"><i class="ft-user"></i> Edit Profile</a>
	                    <a class="dropdown-item" href="#"><i class="ft-mail"></i> My Inbox</a>
	                    <a class="dropdown-item" href="#"><i class="ft-check-square"></i> Task</a>
	                    <a class="dropdown-item" href="#"><i class="ft-message-square"></i> Chats</a>
	                    
                    <div class="dropdown-divider"></div>
                    	<a class="dropdown-item" href="#"><i class="ft-power"></i> Logout</a>
                  </div>
                </div>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </nav>

    <!-- ////////////////////////////////////////////////////////////////////////////-->


    <div class="main-menu menu-fixed menu-light menu-accordion    menu-shadow " data-scroll-to-active="true" data-img="theme-assets/images/backgrounds/02.jpg">
      <div class="navbar-header">
        <ul class="nav navbar-nav flex-row">       
          <li class="nav-item mr-auto">
          	  <a class="navbar-brand" href="<c:url value="/"/>">
          	  <img class="brand-logo" style="width: 10%;" src="<c:url value="/resources/img/paw.png"/>"/>
              <p class="brand-text" style="color: black;">강아지를 부탁해</p></a>
          </li>
          <li class="nav-item d-md-none"><a class="nav-link close-navbar"><i class="ft-x"></i></a></li>
        </ul>
      </div>
      <div class="main-menu-content">
        <ul class="navigation navigation-main" id="main-menu-navigation" data-menu="menu-navigation">
          <li class=" nav-item">
          	<a href="<c:url value="/Backend/Home.do"/>"><i class="ft-home"></i><span style="font-family: sans-serif;">관리자 홈</span></a>
          </li>
          <li class=" nav-item">
          	<a href="<c:url value="/Backend/Charts.do"/>"><i class="ft-pie-chart"></i><span style="font-family: sans-serif;">통계</span></a>
          </li>
          <li class=" nav-item">
          	<a href="<c:url value="/Backend/member.do"/>"><i class="la la-user"></i><span style="font-family: sans-serif;">회원 관리</span></a>
          </li>
          <li class=" nav-item">
          	<a href="<c:url value="/Backend/Trainer.do"/>"><i class="la la-users"></i><span style="font-family: sans-serif;">돌보미 관리</span></a>
          </li>
          <li class=" nav-item">
          	<a href="<c:url value="/Backend/P_Report.do"/>"><i class="la la-warning"></i><span style="font-family: sans-serif;">신고</span></a>
          </li>
           <li class=" nav-item">
          	<a href="<c:url value="/Backend/FCM.do"/>"><i class="la la-warning"></i><span style="font-family: sans-serif;">푸시 알림</span></a>
          </li>
        </ul>
      </div>
    </div>