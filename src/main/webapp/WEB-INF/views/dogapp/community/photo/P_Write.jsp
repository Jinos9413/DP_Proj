<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="keywords"
	content="Bootstrap, Landing page, Template, Registration, Landing">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="author" content="Grayrids">
<title>산책하개</title>
<style>
.dot {
	overflow: hidden;
	float: left;
	width: 12px;
	height: 12px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/mini_circle.png');
}

.dotOverlay {
	position: relative;
	bottom: 10px;
	border-radius: 6px;
	border: 1px solid #ccc;
	border-bottom: 2px solid #ddd;
	float: left;
	font-size: 12px;
	padding: 5px;
	background: #fff;
}

.dotOverlay:nth-of-type(n) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.number {
	font-weight: bold;
	color: #ee6152;
}

.dotOverlay:after {
	content: '';
	position: absolute;
	margin-left: -6px;
	left: 50%;
	bottom: -8px;
	width: 11px;
	height: 8px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white_small.png')
}

.distanceInfo {
	position: relative;
	top: 5px;
	left: 5px;
	list-style: none;
	margin: 0;
}

.distanceInfo .label {
	display: inline-block;
	width: 50px;
}

.distanceInfo:after {
	content: none;
}

#drawingMap, #map {
	width: 100%;
	height: 350px;
}

#map {
	margin-top: 10px;
}
label{
	text-align: center;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/templates/Top.jsp" />
	<!-- Header Section Start -->
	<section id="services" class="section"
		style="padding-top:200px ; height: 400px ;background-image: url('<c:url value="/resources/img/background/doghug.jpg"/>');">
		<div class="container">
			<div class="section-header">
				<h2 class="section-title wow fadeIn" data-wow-duration="1000ms"
					data-wow-delay="0.3s">
					커뮤니티 <span>자유게시판</span>
				</h2>
				<hr class="lines wow zoomIn" data-wow-delay="0.3s">
				<p class="section-subtitle wow fadeIn" data-wow-duration="1000ms"
					data-wow-delay="0.3s">사랑해요</p>
			</div>
		</div>
	</section>
	<div class="page-title"
		style="background-color: #f5efb4; text-align: center;">
		<a class="on" href="<c:url value="/Community/Photo/P_Main.do"/>">사진
			게시판</a> <a href="<c:url value="/Community/Recommendation/R_Main.do"/>">추천
			산책로</a>
	</div>
	<section id="blog" class="section">
		<!-- Container Starts -->
		<div class="container">
			<div class="page-header; padding:1000px"></div>
			<div class="row">
				<div class="col-md-12">
					<form method="post" action="<c:url value='/Community/Photo/P_Write.do'/>" method="post" id="frm" enctype="multipart/form-data">
						<div class="row">
							<div class="col-md-offset-1 col-md-2">
								<div class="form-group" style="line-height: 50px;">
									<span style="color: orange; font-size: 1.5em;">사진등록</span>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group" id="imagePreview" style="text-align: center;">
									<img style="height: 150px; width: 150px;" src="<c:url value="/resources/img/petprofile.png"/>">
								</div>
							</div>
							<div class="col-md-2">
								<div class="form-group">
									<label class="btn btn-common" for="real-input">파일선택</label>
									<input type="file" name="p_images" id="real-input" multiple="multiple" accept="image/gif, image/jpeg, image/png" style="display: none;">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-offset-1 col-md-2">
								<div class="form-group" style="line-height: 50px;">
									<span style="color: orange; font-size: 1.5em;">제목</span>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<input style="color: black;" type="text" class="form-control" name="p_title" placeholder="제목을 입력하세요?">
								</div>
							</div>
							<div class="col-md-2">
								<div class="form-group">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-offset-1 col-md-2">
								<div class="form-group" style="line-height: 50px;">
									<span style="color: orange; font-size: 1.5em;">내용</span>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<textarea class="col-sm-8" style="color: black; margin:10px; width: 100%;" rows="5" class="form-control " name="p_content" placeholder="내용을 입력하세요"></textarea>
								</div>
							</div>
							<div class="col-md-2">
								<div class="form-group">
								</div>
							</div>
						</div>
						<div class="col-md-12" style="text-align: center;">
							<button type="submit" class="btn btn-primary">등록</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="/WEB-INF/views/templates/Foot.jsp" />



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
	<script
		src="<c:url value="/resources/js/jquery.magnific-popup.min.js"/>"></script>
	<script src="<c:url value="/resources/js/waypoints.min.js"/>"></script>
	<script src="<c:url value="/resources/js/form-validator.min.js"/>"></script>
	<script src="<c:url value="/resources/js/contact-form-script.js"/>"></script>
	<script src="<c:url value="/resources/js/main.js"/>"></script>
	<script src='<c:url value="/resources/lib/main.js"/>'></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<script>
	
	//금액
	function getMoneyFormat(sFieldValue) {
	sFieldValue = ""+sFieldValue;
	var returnValue = "";
	var minus = "";
	var decimal = "";
	if(typeof sFieldValue != "undefined" && sFieldValue != null && sFieldValue != ""){
		if( sFieldValue.indexOf("-") == 0 ) minus = "-";
		var decimalIdx = sFieldValue.indexOf(".");
		if( decimalIdx >=0 ){
			decimal = sFieldValue.substring(decimalIdx);
			sFieldValue = sFieldValue.substring(0,decimalIdx);
		}
			
		sFieldValue = sFieldValue.replace(/\D/g,"");
		for(var i=sFieldValue.length-1;i>=0;i--){
			returnValue = sFieldValue.charAt(i) + returnValue;
			if( i!=0 && returnValue.replace(/\D/g,"").length % 3 == 0 ){
				returnValue = "," + returnValue;
			}
		}
	}
	return minus + returnValue + decimal;
	}
	
	$(function(){
		$("#board_price").val((("${boardVO.board_price}" == '') ? "" : getMoneyFormat("${boardVO.board_price}")));
		$("#board_price").on("propertychange change paste input", function() {
		$(this).val(getMoneyFormat($(this).val()));
	});
	
	});
	
	//금액 db저장
	function fnReplace(val) {
		var ret = 0;
		if(typeof val != "undefined" && val != null && val != ""){
			ret = Number(val.replace(/,/gi,''));
		}
		return ret;		
	}

	$("#board_price").val(fnReplace($("#board_price").val()));

	
	
	$(function(){
		//시간
		var today = new Date();
	
		$("#datepicker").datepicker({
			"dateFormat":"yy년 mm월 dd일",
			//showOtherMonths:true,
			//selectOtherMonths:true
			minDate:new Date(today.getFullYear(),today.getMonth(),today.getDate()),
			
			onSelect:function(date,inst){
				console.log('날짜 선택:',date);
				$("#display").html(date);
				console.log(inst);
				console.log("데이트 피커 객체의 getDate()메소드 호출:",$("#datepicker").datepicker("getDate"));
			}
		});
		
		$("#timepicker").click(function(){
			 var time=$("#timepicker").val();
			 if(time!=null){
			 console.log("시간선택:",time);
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
					reader.readAsDataURL(input.target.files[i]);
				}
			}	
		}
			  
	});
	
	
</script>
</body>
</html>