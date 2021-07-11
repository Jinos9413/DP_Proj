<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<link rel="stylesheet" href="<c:url value="/resources/css/mypage/common.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/mypage/main.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/mypage/slick.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/mypage/slick-theme.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/mypage/fonts.css"/>">
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
<style>
.blog-item-img :nth-child(1) {
	display: flex;
	justify-content: center;
}

.blog-item-img a img {
	display: flex;
	justify-content: center;
}
.mypage-section{
	background: white;
}
.container{
	width:100%;
}

.blueBtn{

	margin-left: 3px;
    width: 25%;	
}


.dogSelector{
	margin-bottom: 10px;
}

</style>

</head>
<body>


	<jsp:include page="/WEB-INF/views/templates/Top.jsp" />

	<section id="contact" class="section" style="background-color: white;">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="col-md-12 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="0.3s">
					<div class="contact-block">
						<div class="section-header">
							<h2 class="section-title wow fadeIn" data-wow-duration="1000ms" data-wow-delay="0.3s">
								강아지등록 <span>MyPet</span>
							</h2>
							<hr class="lines wow zoomIn" data-wow-delay="0.3s">
							<h6 data-wow-duration="0.3s" style="color: gray; padding-top: 10px;">반려견 등록 페이지입니다.</h6>
						</div>
					
					<!----------------------------------------------  -->
					
					<div class="content">
						<div class="inner-contents">
							<div class="mypage-section">
								<div class="leftBlock">
									<div class="user-thumb">
										<div class="ratio4 thumbnail-wrapper">
											<div class="thumbnail">
												<div class="centered">
													<img style="width: 200px; height:200px; border-radius: 100px;" src="<c:url value="/upload/${member.PIC_NAME}"/>" class="landscape">
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
											<a href='<c:url value="/Member/MyProfile.do"/>'>내 정보</a> 
											<a href='<c:url value="/Member/MyPet.do"/>'>반려견 정보</a>
										</div>
									</div>
									<div class="menu-link">
										<ul>
											<li><a href=""><i class="fa fa-shopping-cart" aria-hidden="true"></i>구직 현황</a></li>
											<!--<li><a href="#"><i class="fa fa-shopping-cart" aria-hidden="true"></i>과거내역보기</a></li>-->
											<li><a href="../../ "><i class="fa fa-tag" aria-hidden="true"></i>게시글 관리</a></li>
											<li><a href="../../ "><i class="fa fa-database" aria-hidden="true"></i>신고 및 결재 내역</a></li>
										</ul>
									</div>
									<div class="menu-link">
										<ul>
											<li><a href="../../ "><i class="fa fa-play" aria-hidden="true"></i>1:1문의</a></li>
											<li><a href="../../ "><i class="fa fa-group" aria-hidden="true"></i>공지사항</a></li>
										</ul>
									</div>
									<div class="menu-link">
										<ul>
											<li><a href="../../ "><i class="fa fa-comments" aria-hidden="true"></i>1:1문의</a></li>
											<li><a href="../../ "><i class="fa fa-commenting" aria-hidden="true"></i>돌보미 현황</a></li>
										</ul>
									</div>
								</div>

							<div class="rightBlock">
					 			<c:if test="${!flag}">
									<c:forEach items="${dogList}" var="dog" varStatus="loop">
										<button class="roundBtn whiteBtn dogSelector" style="height:40px;width:50px" id="dog${dog.PET_NO }">${fn:substring(dog.PET_NAME,0,3) }</button>
										&nbsp;
									</c:forEach>
									<button class="roundBtn dogRegi addDog" style="height:40px;width:200px" id="dogRegi">강아지 추가하기</button>
								</c:if>
							<div class="moidify">
								<div class="lesson-title">
									<h2>반려견 추가하기</h2>
								</div>
								<c:if test="${empty dogList }" var="flag">
									등록된 강아지가 없습니다.
								</c:if>
								<c:if test="${not empty dogList }">	
									<div class="add-dogInfo" id="dogListDiv">
										<div class="mypage-modifyWrap">
											<form action="<c:url value="/Member/PetModi.do"/>" method="post" enctype="multipart/form-data">
												<input type="hidden" name="id" value="${member.ID }">
												<input type="hidden" name="SEQ_PET" id="seq_pet" value="${dogList[0].PET_NO }">
												<input type="hidden" name="originPic" id="originPic" value="${dogList[0].PET_PROFILE}">
												<div class="loginArea">
													<div class="loginBoxArea">
														<div class="userInfo no-border">
															<h4>반려견 이름</h4>
															<div class="loginInput mb-20">
																<input type="text" id="dog_name" class="fullInput" name="dog_name" value="${dogList[0].PET_NAME}">
															</div>
															<h4>반려견 생일</h4>
															<div class="loginInput mb-20">																				
																<input  readonly="readonly" id="dog_birth" class="fullInput" style="color: black;" type="text" value="${dogList[0].PET_BIRTH} " name="dog_birth" >
															</div>
															<h4>성별</h4>
															<div class="gender mb-20">
																<div class="radioArea">
																	<input type="radio" class="dogGender" name="dog_gender" id="man" value="man"<c:if test="${dogList[0].PET_GENDER=='man' }"> checked</c:if>> 
																	<label for="man" class="radio mr-20">남아</label> 
																	<input type="radio" class="dogGender" name="dog_gender" id="woman" value="woman"<c:if test="${dogList[0].PET_GENDER=='woman' }" > checked</c:if>> 
																	<label for="woman" class="radio mr-20">여아</label>
																	<input type="radio" class="dogGender" name="dog_gender" id="neuter" value="neuter" <c:if test="${dogList[0].PET_GENDER=='neuter' }" > checked</c:if>> 
																	<label for="neuter" class="radio mr-20">중성화</label>
																</div>
															</div>
															<h4>몸무게</h4>
															<div class="loginInput mb-20">
																<input type="text" class="fullInput" name="dog_weight" id="dog_weight" value="${dogList[0].PET_WEIGHT }">
															</div>
														</div>		 
													</div>
												</div>
												<div class="agreeBoxArea">
													<div class="uploadArea pt-20">
														<h4>반려견 사진</h4>
														<div class="upload">
															<div class="upload-thumb">
																<div class="form-group" id="imagePreview">
																	<img style="height: 150px; width: 150px; border: 1px solid gray" src="<c:url value="/upload/${dogList[0].PET_PROFILE}"/>"> 
																</div>
															</div>		
															<a href="#" onClick="$('#petpic_name').click();" type="button"  for="petpic_name">파일 첨부</a>
															<input type="file" name="petpic_name" id="petpic_name" accept="image/gif, image/jpeg, image/png" style="display: none; text-align: inherit;">
														</div>
														<div class="txt">
															<span class="blue">* 가로 200px*세로200px</span> 반려견 사진을 찍어 업로드 해주세요. * 반려견 추가는 가입 후 회원정보 수정화면에서 하실 수 있습니다.
														</div>					 
													</div>
												</div>
												<div class="btn">
													<a href="javascript:history.go(-1);" class="roundBtn whiteBtn">취소하기</a>
													<input type="submit" value="저장하기" class="roundBtn blueBtn" >
												</div>
											</form><!--  수정-->
										</div>
									</div>
								</c:if>

								<c:if test="${empty dogList }" var="Dogfalg">
									<div class="add-dogInfo" id="dogAddDiv" >
								</c:if>
								<c:if test="${!Dogfalg }">
									<div class="add-dogInfo" id="dogAddDiv" style="display: none;" >
								</c:if>
								<div class="mypage-modifyWrap">
									<form action="<c:url value="/Member/PetJoin.do"/>" method="post" enctype="multipart/form-data">
										<input type="hidden" name="id" value="${member.ID }">
										<div class="loginArea">
											<div class="loginBoxArea">
												<div class="userInfo no-border">
													<h4>반려견 이름</h4>
													<div class="loginInput mb-20">
														<input type="text" class="fullInput" name="dog_name" id="dog_name2">
													</div>
													<h4>반려견 생일</h4>
													<div class="loginInput mb-20">
														<input type="hidden" class="form-control" name="joindate">
											         	<input style="color: black;" type="text" class="fullInput" id="datepicker" name="dog_birth"  placeholder="생년월일">
													</div>
													<h4>성별</h4>
													<div class="gender mb-20">
														<div class="radioArea">
															<input type="radio" name="dog_gender" id="man2" value="man"  > 
															<label for="man2" class="radio mr-20">남아</label> 
															<input type="radio" name="dog_gender" id="woman2" value="woman" > 
															<label for="woman2" class="radio mr-20">여아</label>
															<input type="radio" name="dog_gender" id="neuter2" value="neuter"> 
															<label for="neuter2" class="radio mr-20">중성화</label>
														</div>
													</div>
													<h4>몸무게</h4>
													<div class="loginInput mb-20">
														<input type="text" class="fullInput" name="dog_weight" id="dog_weight2">
													</div>
												</div>								 
											</div>
										</div>
										<div class="agreeBoxArea">
											<div class="uploadArea pt-20">
												<h4>반려견 사진</h4>
												<div class="upload">
													<div class="upload-thumb">											
														<div class="form-group" id="imageAddPreview">
															<img style="height: 150px; width: 150px; border: 1px solid gray" src="<c:url value="/resources/img/petprofile.png"/>"> 
										
														</div>
													</div>		
													<a href="#" onClick="$('#petpic_name_add').click();" type="button"  for="petpic_name_add">파일 첨부</a>
													<input type="file" name="petpic_name" id="petpic_name_add" accept="image/gif, image/jpeg, image/png" style="display: none; text-align: inherit;">
												</div>
												<div class="txt">
													<span class="blue">* 가로 200px*세로200px</span> 반려견 사진을 찍어 업로드 해주세요. * 반려견 추가는 가입 후 회원정보 수정화면에서 하실 수 있습니다.
												</div>		
											</div>
										</div>							
										<div class="btn">
											<a href="javascript:history.go(-1);" class="roundBtn whiteBtn">취소하기</a>
											<input type="submit" value="저장하기" class="roundBtn blueBtn" >
										</div>
									</form><!--  추가-->
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
	<!-- Contact Section End -->

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
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
	<script>
	
	$(function() {
		$("#datepicker").datepicker({
			"dateFormat":"yy년 mm월 dd일", 
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
	     
		//<button class="roundBtn whiteBtn dogSelector" style="height:40px;width:50px" id="dog"></button>
		$('.dogSelector').on('click',function(){
			$('#dogAddDiv').css('display', "none");
			$('#dogListDiv').css('display', "");
			
			console.log(this.id);
			var dogId = this.id.split('g')[1];
			console.log(dogId);
			$.ajax({
				url : '<c:url value="/Member/SelectDogOne.do"/>',
				type : "post",
				dataType : "json",
				data : {
					SEQ_PET : dogId
				},
				success : function(data) {
					console.log(data);
					$('#seq_pet').val(data.PET_NO);
					$('#dog_name').val(data.PET_NAME);
					$('#dog_weight').val(data.PET_WEIGHT);
					$('#dog_gender').val(data.PET_GENDER);			
					$('#dog_birth').val(data.PET_BIRTH);
					$('#originPic').val(data.PET_PROFILE);
					$('#imagePreview').html('<img style="height: 150px; width: 150px; border: 1px solid gray" src="<c:url value="/upload/'+data.PET_PROFILE+'"/>">');
					if(data.PET_GENDER == 'man'){
						$(".dogGender").removeAttr("checked");
						$('#man').prop("checked","checked"); 
						
					}
					else if(data.PET_GENDER == 'woman'){
						$(".dogGender").removeAttr("checked");
						$('#woman').prop("checked","checked");
					}
					else{
						$(".dogGender").removeAttr("checked");
						$('#neuter').prop("checked","checked");
					}
				}
			})
		});
		
		$('.addDog').on('click', function(){
			$('#dogAddDiv').css('display', "");
			$('#dogListDiv').css('display', "none");
		});
	});
	
	$("#alert-success").hide();
	$("#alert-danger").hide();
	

	
	$('#petpic_name').on('change',readImage);
    function readImage(input) {
        if(input.target.files[0]) {
            const reader = new FileReader()
            reader.onload = e => {
                $('#imagePreview').html('<img style="height: 150px; width: 150px;" src='+e.target.result+' />');
            }
            reader.readAsDataURL(input.target.files[0])
        }
    }
    
    $('#petpic_name_add').on('change',readImageAdd);
    function readImageAdd(input) {
        if(input.target.files[0]) {
            const reader = new FileReader()
            reader.onload = e => {
                $('#imageAddPreview').html('<img style="height: 150px; width: 150px;" src='+e.target.result+' />');
            }
            reader.readAsDataURL(input.target.files[0])
        }
    }
    
	$("#submit").on("click",function() {
	
		if ($("#dog_name").val() == "") {
			alert("강아지이름을 입력해주세요.");
			$("#dog_name").focus();
			return false;
		}
		if ($("#dog_gender").val() == "choice") {
			alert("성별을 선택해주세요.");
			$("#dog_gender").focus();
			return false;
		}
		
		if ($("#dog_weight").val() == "") {
			alert("몸무게를 입력해주세요.");
			return false;
		} 
		if ($("#datepicker").val() == "") {
			alert("생년월일을 선택해주세요.");
			$("#datepicker").focus();
			return false;
		}
	
		$("#petjoinform").submit();
	});///////////////////submit 

  

	</script>
</body>
</html>