<%@page
	import="org.springframework.web.multipart.MultipartHttpServletRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="keywords" content="Bootstrap, Landing page, Template, Registration, Landing">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="author" content="Grayrids">
<title>산책하개</title>

<link rel="stylesheet" href="<c:url value="/resources/css/mypage/slider.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/mypage/datepicker.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/mypage/font-awesome.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/mypage/fonts.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/mypage/heyModal.min.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/mypage/jquery.selectlist.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/mypage/layout.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/mypage/mobile.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/mypage/reset.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/mypage/tablet.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/mypage/webslidemenu.css"/>">
<style type="text/css">
input[type="checkbox"] {
	display: none;
}

.label__on-off {
	overflow: hidden;
	position: relative;
	display: inline-block;
	width: 58px;
	height: 26px;
	-webkit-border-radius: 13px;
	-moz-border-radius: 13px;
	border-radius: 13px;
	background-color: #ed4956;
	color: #fff;
	font-weight: bold;
	cursor: pointer;
	-webkit-transition: all .3s;
	-moz-transition: all .3s;
	-ms-transition: all .3s;
	-o-transition: all .3s;
	transition: all .3s;
}

.label__on-off>* {
	vertical-align: middle;
	-webkit-transition: all .3s;
	-moz-transition: all .3s;
	-ms-transition: all .3s;
	-o-transition: all .3s;
	transition: all .3s;
	font-size: 14px;
}

.label__on-off .marble {
	position: absolute;
	top: 1px;
	left: 1px;
	display: block;
	width: 24px;
	height: 24px;
	background-color: #fff;
	-webkit-border-radius: 50%;
	-moz-border-radius: 50%;
	border-radius: 50%;
	-webkit-box-shadow: 0 0 10px rgba(0, 0, 0, .3);
	-moz-box-shadow: 0 0 10px rgba(0, 0, 0, .3);
	box-shadow: 0 0 10px rgba(0, 0, 0, .3);
}

.label__on-off .on {
	display: none;
	padding-left: 12px;
}

.label__on-off .off {
	padding-left: 30px;
	line-height: 25px;
}

.input__on-off:checked+.label__on-off {
	background-color: #0bba82;
}

.input__on-off:checked+.label__on-off .on {
	display: inline-block;
	color: white;
}

.input__on-off:checked+.label__on-off .off {
	display: none;
	color: white;
}

.input__on-off:checked+.label__on-off .marble {
	left: 33px;
}
.mp_box1 {
	height : 98%;
	margin-bottom:10px;
} 
.item-boxes2 {
	text-align: center;
	border-radius: 4px;
	webkit-transition: all 0.3s ease 0s;
	-moz-transition: all 0.3s ease 0s;
	transition: all 0.3s ease 0s;
	padding: 0px;
	margin-bottom: 0px;
}

.item-boxes2 .icon {
	width: 60px;
	height: 60px;
	text-align: center;
	border: 1px solid #dd4d42;
	display: inline-block;
	border-radius: 5px;
	margin-top: 10px;
	margin-bottom: 15px;
	webkit-transition: all 0.3s ease-in-out;
	-webkit-transition: all 0.3s ease-in-out;
	transition: all 0.3s ease-in-out;
}

.item-boxes2 .icon i {
	font-size: 30px;
	line-height: 60px;
	color: #dd4d42;
}

.item-boxes2 h4 {
	font-size: 20px;
	font-weight: 600;
	margin-bottom: 10px;
}

.item-boxes2:hover {
	background: #fff;
	box-shadow: 0 8px 48px 0 rgba(0, 0, 0, 0.15);
}

.blog-item-text a {
	color: white;
}

.pricing-details {
	padding-top: 20px;
}

.mypage-section {
	background: white;
}

.row:nth-child(2) .col-50 {
	width: 37%;
}

.mp_box2 {
	height: 240px;
}

.mp_box3 {
	width: 500px;
	height: 230px;
}

.mp_box4 .mp_box3 {
	width: 500px;
	height: 230px;
}

.h4 {
	font-family: 'Noto Sans KR';
}
</style>


</head>





<body>
	<jsp:include page="/WEB-INF/views/templates/Top.jsp" />
	<!-- Header Section Start -->



	<section id="blog" class="section">
		<!-- Container Starts -->



		<div class="container">
			<div class="section-header">
				<h2 class="section-title wow fadeIn" data-wow-delay="0.1s">
					MY<span>PAGE</span>
				</h2>
				<hr class="lines wow zoomIn" data-wow-delay="0.1s">
				<p class="section-subtitle wow fadeInDown" data-wow-delay="0.1s">
					마이페이지</p>
			</div>
			<div class="row">
				<div id="wrapper">
					<div class="containerWrap mypage-all-wrap">
						<div class="content" >
							<div class="inner-contents" >
								<div class="mypage-section">
									<div class="mypage_index">
										<div class="container">
											<div class="row">
												<div class="col-md-5" >
													<div class="mp_box1">
														<div class="user-thumb">
															<img style="width: 150px; height:150px; border-radius:150px;" src="<c:url value="/upload/${member.PIC_NAME}"/>" />
														</div>
														<div class="user-info">
															<div class="name">
																<span> ${member.NICKNAME}</span>
															</div>
															<div class="id">(${member.NAME})님</div>
														</div>
														<div class="plan-button">
															<a href='<c:url value="/Member/MyProfile.do"/>'
																class="btn btn-common">내 정보 관리</a> <a
																href='<c:url value="/Member/MyPet.do"/>'
																class="btn btn-common">반려견 정보 관리</a>
														</div>
													</div>
												</div>
												<div class="col-md-7" >
														<div class="row">
															<div class="col-md-6">
																<div class="item-boxes2" data-wow-delay="0.2s">
																	<div class="mp_box2" onclick="#';">
																		<div class="icon">
																			<i class="lnr lnr-briefcase"></i>
																		</div>
																		<h4>내 구직현황</h4>
																		<p>돌봄 및 산책 현황을 확인할 수 있습니다.</p>
																	</div>
																</div>
															</div>
															<div class="col-md-6">
																<div class="item-boxes2" data-wow-delay="0.2s">
																	<div class="mp_box2" onclick="#';">
																		<div class="icon">
																			<i class="lnr lnr-briefcase"></i>
																		</div>
																		<h4>게시글 관리</h4>
																		<p>작성한 글과 후기글을 확인 할 수 있습니다.</p>
																	</div>
																</div>
															</div>
														</div>
														<div class="row">
															<div class="col-md-6">
																<div class="item-boxes2" data-wow-delay="0.2s">
																	<div class="mp_box2" onclick="#';">
																		<div class="icon">
																			<i class="lnr lnr-briefcase"></i>
																		</div>
																		<h4>신고 및 결재내역</h4>
																		<p></p>
																	</div>
																</div>
															</div>
															<div class="col-md-6">
																<div class="item-boxes2" data-wow-delay="0.2s">
																	<div class="mp_box2" onclick="#';">
																		<div class="icon">
																			<i class="lnr lnr-briefcase"></i>
																		</div>
																		<h4>1:1문의/챗봇</h4>
																		<p></p>
																	</div>
																</div>
															</div>
														</div>
													</div>
											</div>
											<div class="row">
												<div class="col-md-5">
													<div class="mp_box3" onclick="location.href='myLesson.php';" style="padding-top: 0">
														<h4>
															<a href="myLesson.php">공지사항 <i
																class="fa fa-angle-right" aria-hidden="true"></i>
															</a>
														</h4>

														<ul>
															<!--171106_추가-->
															<!-- 수강중인 영상 교육이 없을때 -->
															<li class="no-data">
																<div class="text">공지된 사항이 없습니다.</div> <a
																href="myLesson.php" class="roundBtn">더 보기</a>
															</li>
															<!--//171106_추가-->
														</ul>
													</div>
												</div>
												<div class="col-md-7">
													<div class="mp_box4" onclick="location.href='lessonStatus.php';" style="padding-top: 0">
														<h4>
															<a href="lessonStatus.php">고객센터<i
																class="fa fa-angle-right" aria-hidden="true"></i></a>
														</h4>
														<ul>
															<li>
																<div>문의글</div> <strong>0</strong>
															</li>
															<li>
																<div>답변글</div> <strong>0</strong>
															</li>
															<li>
																<div>무슨글</div> <strong>0</strong>
															</li>
															<li>
																<div>어떤글</div> <strong>0</strong>
															</li>
														</ul>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


	</section>
	<!-- blog Section End -->

	<jsp:include page="/WEB-INF/views/templates/Foot.jsp" />



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