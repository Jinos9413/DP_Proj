<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<style>
.blog-item-img :nth-child(1) {
	display: flex;
	justify-content: center;
}
</style>
</head>

<script type="text/javascript">
	window.onload = function(){
		document.getElementById('submit').onclick = function(){
			document.getElementById('profilemodiform').submit();
			return false;
		}	
	}
</script>

<body>


	<jsp:include page="/WEB-INF/views/templates/Top.jsp" />

	<section id="contact" class="section" style="background-color: white;">
		<div class="container" style="width: 100%">
			<div class="row col-md-12">
				<div class="col-md-12 wow fadeInDown" data-wow-duration="1000ms"
					data-wow-delay="0.3s">
					<div class="contact-block">
						<div class="section-header">
							<h2 class="section-title wow fadeIn" data-wow-duration="1000ms"
								data-wow-delay="0.3s">
								회원정보 <span>MyProfile</span>
							</h2>
							<hr class="lines wow zoomIn" data-wow-delay="0.3s">
							<h6 data-wow-duration="0.3s"
								style="color: gray; padding-top: 10px;">회원정보 페이지입니다.</h6>
						</div>

						<!-- ///////////////////////////////////////////// -->


						<!-- Header End -->
						<div id="wrapper">
							<div class="containerWrap mypage-all-wrap">

								<div class="content">
									<div class="inner-contents">
										<div class="mypage-section" style="background-color: white">
											<div class="leftBlock">
												<div class="user-thumb">
													<div class="ratio4 thumbnail-wrapper">
														<div class="thumbnail">
															<div class="centered">
																<img
																	style="width: 200px; height: 200px; border-radius: 100px;"
																	src="<c:url value="/upload/${member.PIC_NAME}"/>"
																	class="landscape">
															</div>
														</div>
													</div>
												</div>
												<div class="user-info">
													<div class="name">
														<span>${member.NICKNAME}</span>
													</div>
													<div class="id">(${member.NAME})님</div>
													<div class="infobtn">
														<a href='<c:url value="/Member/MyProfile.do"/>'>내 정보</a> <a
															href='<c:url value="/Member/MyPet.do"/>'>반려견 정보</a>
													</div>
												</div>
												<div class="menu-link">
													<ul>
														<li><a href=""><i class="fa fa-shopping-cart"
																aria-hidden="true"></i>구직 현황</a></li>
														<!--<li><a href="#"><i class="fa fa-shopping-cart" aria-hidden="true"></i>과거내역보기</a></li>-->
														<li><a href="../../ "><i class="fa fa-tag"
																aria-hidden="true"></i>게시글 관리</a></li>
														<li><a href="../../ "><i class="fa fa-database"
																aria-hidden="true"></i>신고 및 결재 내역</a></li>
													</ul>
												</div>
												<div class="menu-link">
													<ul>
														<li><a href="../../ "><i class="fa fa-play"
																aria-hidden="true"></i>1:1문의</a></li>
														<li><a href="../../ "><i class="fa fa-group"
																aria-hidden="true"></i>공지사항</a></li>
													</ul>
												</div>
												<div class="menu-link">
													<ul>
														<li><a href="../../ "><i class="fa fa-comments"
																aria-hidden="true"></i>고객센터</a></li>
														<li><a href="../../ "><i class="fa fa-commenting"
																aria-hidden="true"></i>돌보미 현황</a></li>
													</ul>
												</div>
											</div>

											<div class="rightBlock">
												<div class="moidify">
													<form action="<c:url value="/Member/MyProfileModi.do"/>"
														method="post" id="profilemodiform"
														enctype="multipart/form-data">
														<!-- 	<input type="hidden" name="hidden_idx" value="74239">
									<input type="hidden" name="login_go" value="/html/common_ui/mypage/profile-modify.php">
									<input type="hidden" name="hidden_auth_number" id="hidden_auth_number" value="502525">
									<input type="hidden" name="hidden_auth_gubun" id="hidden_auth_gubun" value="m">
									<input type="hidden" name="auth_check" id="auth_check"> -->
														<div class="mypage-modifyWrap">
															<div class="lesson-title">
																<h2>내 정보</h2>
															</div>
															<div class="loginArea">
																<div class="loginBoxArea">
																	<div class="userInfo">
																		<h4>이름</h4>
																		<div class="loginInput mb-20">
																			<div class="fullInput disable">${member.NAME}</div>
																		</div>

																		<h4>아이디</h4>
																		<div class="loginInput mb-20">
																			<input type="hidden" name="id" value="${member.ID}">
																			<div class="fullInput disable">${member.ID}</div>
																		</div>
																		<h4>비밀번호</h4>
																		<div class="loginInput2 mb-20">
																			<input type="password" class="user_pw fullInput mb-5"
																				name="pwd" id="pwd"
																				placeholder="4-10자의 영문, 특수문자, 숫자"
																				value="${member.PWD}"> <input
																				type="password" class="user_pw fullInput"
																				name="pwdCheck" id="pwdCheck" placeholder="비밀번호 확인"
																				value="${member.PWD}">
																		</div>
																		<div>
																			<span stype=backgroundColor:"red">
																				<div class="alert alert-success" id="alert-success">비밀번호가
																					일치합니다.</div>
																				<div class="alert alert-danger" id="alert-danger">비밀번호가
																					일치하지 않습니다.</div>
																			</span>
																		</div>

																		<h4>닉네임</h4>
																		<div class="address">
																			<div class="addressSrch mb-5">
																				<input type="text" class="fullInput" name="nickname"
																					id="nickname" value="${member.NICKNAME}"
																					placeholder=""> <a
																					href="javascript:fn_nickChk();" id="nicknameChk"
																					type="button" class="roundBtn whiteBtn">중복 확인</a>
																			</div>
																		</div>



																		<h4>성별</h4>
																		<div class="gender mb-20">
																			<div class="radioArea">
																				<input type="radio" name="gender" id="man"
																					value="man"
																					<c:if test="${member.GENDER=='man' }" > checked</c:if> />
																				<label for="man" class="radio mr-20">남자</label> <input
																					type="radio" name="gender" id="woman" value="woman"
																					<c:if test="${member.GENDER=='woman' }" > checked</c:if> />
																				<label for="woman" class="radio mr-20">여자</label>
																			</div>
																		</div>
																		<h4>생년월일</h4>
																	<!-- 	<input type="hidden" class="form-control" name="joindate"> -->
																		<div class="loginInput mb-20">
																			<input  class="fullInput" type="text" name="birth" value="<fmt:formatDate value="${member.BIRTH}" pattern="yyyy년 MM월 dd일"/>" readonly="readonly">
																		</div>
										

																	</div>
																</div>
															</div>
															<div class="agreeBoxArea">
																<div class="userInfo pb-20">
																	<h4>주소</h4>
																	<div class="address">
																		<div class="addressSrch mb-5">
																			<input type="text" class="fullInput"
																				value="${member.POSTCODE}" name="postcode"
																				id="postcode" placeholder=""> <a
																				href="javascript:sample6_execDaumPostcode();"
																				class="roundBtn whiteBtn">우편번호 찾기</a>
																		</div>
																		<input type="text" class="fullInput mb-5" name="addr"
																			id="addr" value="${member.ADDR}" readonly="readonly" />
																		<input type="text" class="fullInput" name="addr2"
																			id="addr2" value="${member.ADDR2}" />
																	</div>
																</div>

																<div class="uploadArea no-border">
																	<h4>프로필 사진</h4>

																	<!--  -->

																	<div class="upload">
																		<div class="upload-thumb">

																			<div class="form-group" id="imagePreview">
																				<img
																					style="height: 150px; width: 150px; border: 1px solid gray"
																					id="imagePreview" class="landscape"
																					src="<c:url value="/upload/${member.PIC_NAME }"/>">

																			</div>
																		</div>

																		<a href="#" onClick="$('#pic_name').click();" type="button" for="pic_name">파일 첨부</a>
																		<input type="hidden" name="originPic" value="${member.PIC_NAME }">
																		<input type="file" name="pic_name" id="pic_name" accept="image/gif, image/jpeg, image/png"
																			style="display: none; text-align: 'inherit'';">
																	</div>
																	<div class="txt">
																		<span class="blue">* 가로 200px*세로200px</span> 이상의 사진을
																		찍어 업로드 해주세요.
																	</div>
																</div>
															</div>
															<div class="btn">
																<a href="javascript:submit();" id="submit"
																	class="roundBtn blueBtn">회원정보수정</a> <a
																	href="joinOut.php" class="joinOutBtn">회원 탈퇴신청</a>
															</div>
														</div>
													</form>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- footer Start -->

						<!-- //////////////////////////////////////////// -->

					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Contact Section End -->

	<jsp:include page="/WEB-INF/views/templates/Foot.jsp" />

	<!-- jQuery first, then Tether, then Bootstrap JS. -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
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
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<jsp:include page="/WEB-INF/views/templates/Notice.jsp"/>
	<script>
	
	  

	$("#alert-success").hide();
	$("#alert-danger").hide();
	
	$(function() {
		$("#datepicker").datepicker({
			changeMonth : true,
			changeYear : true,
			yearRange : 'c-99:c+99'
			
		});
		$( "#datepicker" ).datepicker( "option", "dateFormat", "yy/mm/dd" );
	});
	
	$("input").keyup(function() {
		var pwd1 = $("#pwd").val();
		var pwd2 = $("#pwdCheck").val();
		if (pwd1 != "" || pwd2 != "") {
			if (pwd1 == pwd2) {
				$("#alert-success").show();
				$("#alert-danger").hide();
				$("#submit").removeAttr("disabled");
			} else {
				$("#alert-success").hide();
				$("#alert-danger").show();
				$("#submit").attr("disabled", "disabled");
			}
		}
	});
	
	$('#pic_name').on('change',readImage);
    function readImage(input) {
        if(input.target.files[0]) {
            const reader = new FileReader()
            reader.onload = e => {
                $('#imagePreview').html('<img style="height: 150px; width: 150px;" src='+e.target.result+' />');
            }
            reader.readAsDataURL(input.target.files[0])
        }
    }
    


	function fn_nickChk() {
		if($("#nickname").val().trim()=="") {
			alert("닉네임을 입력해주세요.");
			$("#nickname").focus();
			return;
		}
		$.ajax({
			url : '<c:url value="/Member/nickChk.do"/>',
			type : "post",
			dataType : "json",
			data : {
				"nickname" : $("#nickname").val()
			},
			success : function(data) {
				if (data == 1) {
					alert("중복된 닉네임입니다.");
				} else if (data == 0) {
					$("#nicknameChk").attr("value", "Y");
					alert("사용가능한 닉네임입니다.");
				}
			}
		})
	}////////////////닉네임중복확인	    

	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g
											.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName
										: data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr
										+ ')';
							}
							// 조합된 참고항목을 해당 필드에 넣는다.
							document.getElementById("addr2").value = extraAddr;

						} else {
							document.getElementById("addr2").value = '';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('postcode').value = data.zonecode;
						document.getElementById("addr").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("addr2")
								.focus();
					}
				}).open();
	}
	</script>
</body>
</html>