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

	<section id="contact" class="section" style="padding-top: 150px; background-image: url('<c:url value="/resources/img/dog/dogLogin.jpg"/>');">
		<div class="container">
			<div class="row justify-content-md-center">
				<div class="col-md-offset-1 col-md-10 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="0.3s">
					<div class="contact-block">
						<div class="section-header">
							<h2 class="section-title wow fadeIn" data-wow-duration="1000ms" data-wow-delay="0.3s">
								회원가입 <span>JOIN US</span>
							</h2>
							<hr class="lines wow zoomIn" data-wow-delay="0.3s">
							<h6 data-wow-duration="0.3s" style="color: gray; padding-top: 10px;">회원가입 페이지입니다.</h6>
						</div>
						
						<form action="<c:url value="/Member/Join.do"/>" method="post" id="joinform" enctype="multipart/form-data">
						<div class="row">
								
								<div class="col-md-offset-1 col-md-2">
									<div class="form-group" style="line-height: 50px;">
										<span style="color: orange; font-size: 1.5em;">프로필</span>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group" id="imagePreview" style="text-align: center;">
										<img style="height: 150px; width: 150px;" src="<c:url value="/resources/img/basicperson.png"/>">
									</div>
								</div>
								<div class="col-md-2">
									<div class="form-group">
										<label class="btn btn-common" for="pic_name">파일선택</label>
										<input type="file" name="pic_name" id="pic_name" accept="image/gif, image/jpeg, image/png" style="display: none;">
									</div>
								</div>
						</div>
						<div class="row">
								<div class="col-md-offset-1 col-md-2">
									<div class="form-group" style="line-height: 50px;">
										<span style="color: orange; font-size: 1.5em;">아이디</span>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<input style="color: black;" type="text" class="form-control" name="id" id="id" placeholder="아이디">
									</div>
								</div>
								<div class="col-md-2">
									<div class="form-group">
										<button class="btn btn-common" id="idChk" type="button" onclick="fn_idChk();" value="N">중복확인</button>
									</div>
								</div>
						</div>
						<div class="row">
								<div class="col-md-offset-1 col-md-2">
									<div class="form-group" style="line-height: 50px;">
										<span style="color: orange; font-size: 1.5em;">비밀번호</span>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<input style="color: black;" type="password" class="form-control" name="pwd" id="pwd" placeholder="비밀번호">
									</div>
								</div>
								<div class="col-md-2">
									<div class="form-group">
										<div>
											<span stype=backgroundColor:"red">
												<div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div>
												<div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
											</span>
										</div>
									</div>
								</div>
						</div>
						<div class="row">
								<div class="col-md-offset-1 col-md-2"></div>
								<div class="col-md-6">
									<div class="form-group">
										<input style="color: black;" type="password"class="form-control" name="pwdCheck" id="pwdCheck" placeholder="비밀번호 확인">
									</div>
								</div>
								<div class="col-md-2"></div>
						</div>
						<div class="row">
								<div class="col-md-offset-1 col-md-2">
									<div class="form-group" style="line-height: 50px;">
										<span style="color: orange; font-size: 1.5em;">닉네임</span>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<input style="color: black;" type="text" class="form-control" name="nickname" id="nickname" placeholder="닉네임">
									</div>
								</div>
								<div class="col-md-2">
									<div class="form-group">
										<button class="btn btn-common" id="nicknameChk" type="button" onclick="fn_nickChk();" value="N">중복확인</button>
									</div>
								</div>
						</div>
						<div class="row">
								<div class="col-md-offset-1 col-md-2">
									<div class="form-group" style="line-height: 50px;">
										<span style="color: orange; font-size: 1.5em;">이름</span>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<input style="color: black;" type="text" class="form-control" name="name" id="name" placeholder="이름">
									</div>
								</div>
								<div class="col-md-2"></div>
						</div>
						<div class="row">
								<div class="col-md-offset-1 col-md-2">
									<div class="form-group" style="line-height: 50px;">
										<span style="color: orange; font-size: 1.5em;">성별</span>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<select name="gender" id="gender" style="width: 100%; margin-bottom: 15px; padding: 18px; font-size: 14px; border-radius: 4px; border-color: gray;">
											<option value="">성별 선택</option>
											<option value="man">남자</option>
											<option value="woman">여자</option>
											<option value="noGender">선택안함</option>
										</select>
									</div>
								</div>
								<div class="col-md-2"></div>
						</div>
						<div class="row">
								<div class="col-md-offset-1 col-md-2">
									<div class="form-group" style="line-height: 50px;">
										<span style="color: orange; font-size: 1.5em;">주소</span>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<input style="color: black;" type="text" class="form-control" id="postcode" name="postcode" placeholder="우편번호" readonly="readonly">
									</div>
								</div>
								<div class="col-md-2">
									<div class="form-group">
										<button class="btn btn-common" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">우편번호 찾기</button>
									</div>
								</div>
						</div>
						<div class="row">
								<div class="col-md-offset-1 col-md-2"></div>
								<div class="col-md-6">
									<div class="form-group">
										<input style="color: black;" type="text" class="form-control" id="addr" name="addr" placeholder="주소" readonly="readonly">
									</div>
								</div>
								<div class="col-md-2"></div>
						</div>
						<div class="row">
								<div class="col-md-offset-1 col-md-2"></div>
								<div class="col-md-6">
									<div class="form-group">
										<input style="color: black;" type="text" class="form-control" id="addr2" name="addr2" placeholder="상세주소">
									</div>
								</div>
								<div class="col-md-2"></div>
						</div>
						<div class="row">
								<div class="col-md-offset-1 col-md-2">
									<div class="form-group" style="line-height: 50px;">
										<span style="color: orange; font-size: 1.5em;">생년월일</span>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<input type="hidden" class="form-control" name="joindate">
										<input style="color: black;" type="text" class="form-control" id="datepicker" name="birth" placeholder="생년월일" >
									</div>
								</div>
						</div>
								<div class="col-md-12">
									<div class="submit-button text-center">
										<button class="btn btn-common" id="submit">회원가입</button>
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
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
	  
	$(function() {
		$("#datepicker").datepicker({
			changeMonth : true,
			changeYear : true,
			yearRange: "1900:",
			minDate: new Date(1900, 1 - 1, 1),
			maxDate: new Date,
			monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	        showMonthAfterYear: true,
	        yearSuffix: '년'
		});
		$( "#datepicker" ).datepicker( "option", "dateFormat", "yy/mm/dd" );
	});
	
	$("#alert-success").hide();
	$("#alert-danger").hide();
	
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
		if ($("#pwdCheck").val() == "") {
			alert("비밀번호를 확인해주세요.");
			$("#pwdCheck").focus();
			return false;
		}
		if ($("#nickname").val() == "") {
			alert("닉네임을 입력해주세요.");
			$("#nickname").focus();
			return false;
		}
		if ($("#name").val() == "") {
			alert("성명을 입력해주세요.");
			$("#name").focus();
			return false;
		}
		if ($("#gender").val() == "choice") {
			alert("성별을 선택해주세요.");
			$("#gender").focus();
			return false;
		}
		
		if ($("#addr").val() == "") {
			alert("주소를 입력해주세요.");
			$("#addr").focus();
			return false;
		}
		if ($("#addr2").val() == "") {
			alert("상세주소를 입력해주세요.");
			$("#addr2").focus();
			return false;
		}
		if ($("#idChk").val() == "N") {
			alert("아이디를 중복확인해주세요.");
			return false;
		} 
		if ($("#datepicker").val() == "") {
			alert("생년월일을 선택해주세요.");
			$("#datepicker").focus();
			return false;
		}
		if ($("#nicknameChk").val() == "N") {
			alert("닉네임을 중복확인해주세요.");
			return false;
		}
		$("#joinform").submit();
	});///////////////////submit 

	function fn_idChk() {
		if($("#id").val().trim()=="") {
			alert("아이디를 입력해주세요.");
			$("#id").focus();
			return;
		}
		$.ajax({
			url : '<c:url value="/Member/idChk.do"/>',
			type : "post",
			dataType : "json",
			data : {
				"id" : $("#id").val().trim()
			},
			success : function(data) {
				if (data == 1) {
					alert("중복된 아이디입니다.");
				} else if (data == 0) {
					$("#idChk").attr("value", "Y");
					alert("사용가능한 아이디입니다.");
				}
			}
		});
	}////////////아이디중복확인

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