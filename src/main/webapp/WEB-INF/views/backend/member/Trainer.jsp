<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html class="loading" lang="en" data-textdirection="ltr">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta name="description" content="Chameleon Admin is a modern Bootstrap 4 webapp &amp; admin dashboard html template with a large number of components, elegant design, clean and organized code.">
    <meta name="keywords" content="admin template, Chameleon admin template, dashboard template, gradient admin template, responsive admin template, webapp, eCommerce dashboard, analytic dashboard">
    <meta name="author" content="ThemeSelect">
    <title>강아지를 부탁해</title>
    
  </head>
  <body class="vertical-layout vertical-menu 2-columns   menu-expanded fixed-navbar" data-open="click" data-menu="vertical-menu" data-color="bg-chartbg" data-col="2-columns">
	<jsp:include page="/WEB-INF/views/backend/templates/Top.jsp"/>
    <div class="app-content content">
      <div class="content-wrapper">
        <div class="content-wrapper-before"></div>
        <div class="content-header row">
          <div class="content-header-left col-md-4 col-12 mb-2">
            <h3 class="content-header-title">돌보미 관리</h3>
          </div>
          <div class="content-header-right col-md-8 col-12">
            <div class="breadcrumbs-top float-md-right">
              <div class="breadcrumb-wrapper mr-1">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="<c:url value="/Backend/Home.do"/>">관리자 사이트</a>
                  </li>
                  <li class="breadcrumb-item active">돌보미 관리
                  </li>
                </ol>
              </div>
            </div>
          </div>
        </div>
        <div class="content-body">

		<!-- Striped rows start -->
		<div class="row">
			<div class="col-12">
				<div class="card">
					<div class="card-header">
						<p class="card-title" style="font-size: 1.5em; font-weight: bold;">돌보미 신청 관리</p>
						<a class="heading-elements-toggle"><i class="la la-ellipsis-v font-medium-3"></i></a>
						<div class="heading-elements">
							<ul class="list-inline mb-0">
								<li><a data-action="collapse"><i class="ft-minus"></i></a></li>
								<li><a data-action="close"><i class="ft-x"></i></a></li>
							</ul>
						</div>
					</div>
					<div class="card-content collapse show">
						<div class="card-body">
							<p class="card-text">돌보미 신청 관리입니다.</p>
						</div>
						<div class="table-responsive">
							<table class="table table-striped  table-bordered ">
								<thead class="thead-dark">
									<tr>
										<th scope="col">no</th>
										<th scope="col">닉네임</th>
										<th scope="col">제목</th>
										<th scope="col">신청일</th>
										<th scope="col">확인</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach items="${trainerApplyList }" var="trainer" varStatus="loop">
									<tr>
										<th scope="row">${trainer.T_NO }</th>
										<td>${trainer.NICKNAME }</td>
										<td>${trainer.T_TITLE }</td>
										<td><fmt:formatDate value="${trainer.T_POSTDATE }" pattern="yyyy-MM-dd"/></td>
										<td>
											<button class="trainerApplyClick" id="trainerApply&${trainer.T_NO }">상세보기</button>
											<button class="btnTrainerApplyOk" id="trainerApplyOk&${trainer.T_NO }">승인</button>
											<button class="btnTrainerApplyNo" id="trainerApplyNo&${trainer.T_NO }">거부</button>
										</td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-12">
				<div class="card">
					<div class="card-header">
						<p class="card-title" style="font-size: 1.5em; font-weight: bold;">돌보미 관리</p>
						<a class="heading-elements-toggle"><i class="la la-ellipsis-v font-medium-3"></i></a>
						<div class="heading-elements">
							<ul class="list-inline mb-0">
								<li><a data-action="collapse"><i class="ft-minus"></i></a></li>
								<li><a data-action="close"><i class="ft-x"></i></a></li>
							</ul>
						</div>
					</div>
					<div class="card-content collapse show">
						<div class="card-body">
							<p class="card-text">승인된 돌보미 관리 페이지 입니다.</p>
						</div>
						<div class="table-responsive">
							<table class="table table-striped  table-bordered ">
								<thead class="thead-dark">
									<tr>
										<th scope="col">no</th>
										<th scope="col">닉네임</th>
										<th scope="col">제목</th>
										<th scope="col">서비스 횟수</th>
										<th scope="col">별점</th>
										<th scope="col">확인</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach items="${trainerList }" var="trainer" varStatus="loop">
									<c:if test="${trainer.POWER != 5 && trainer.POWER != 10 }">
									<tr>
										<th scope="row">${trainer.T_NO }</th>
										<td>${trainer.NICKNAME }</td>
										<td>
										<c:if test="${trainer.POWER == 3 }" var="powerFlage">
											<span id="trainerT_TITLENo${trainer.T_NO }" style="color: red;">자격 정지된 돌보미!</span>
											<span id="trainerT_TITLE${trainer.T_NO }" style="display: none;">${trainer.T_TITLE }</span>
										</c:if>
										<c:if test="${!powerFlage }">
											<span id="trainerT_TITLENo${trainer.T_NO }" style="color: red; display: none;">자격 정지된 돌보미!</span>
											<span id="trainerT_TITLE${trainer.T_NO }" >${trainer.T_TITLE }</span>											
										</c:if>
										</td>
										<td>${trainerCountOfReviewList[loop.index] }회</td>
										<td>
										<c:if test="${trainerCountOfReviewList[loop.index] == 0}" var="flag">
											0.0점
										</c:if>
										<c:if test="${!flag}">
											<fmt:formatNumber value="${trainerAvgOfRateList[loop.index] }" pattern="0.#"/>점
										</c:if>
										</td>
										<td>
											<button class="trainerClick" id="trainer&${trainer.T_NO }">상세보기</button>
											<c:if test="${powerFlage }">
												<button class="btnTrainerYes" id="trainerYesQ${trainer.T_NO }">자격복구</button>
												<button class="btnTrainerNo" id="trainerNoQ${trainer.T_NO }" style="display: none;">자격정지</button>
											</c:if>
											<c:if test="${!powerFlage }">
												<button class="btnTrainerYes" id="trainerYesQ${trainer.T_NO }" style="display: none;">자격복구</button>
												<button class="btnTrainerNo" id="trainerNoQ${trainer.T_NO }">자격정지</button>
											</c:if>
										</td>
									</tr>
									</c:if>
								</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		
    </div>
  </div>
</div>
	<div class="modal  fade" id="trainerApplyModal" >
   		<div class="modal-dialog ">
   			<div class="modal-content" style="padding: 20px;">
   				<div class="modal-header">
   					<button class="close" data-dismiss="modal"><span>&times;</span></button>
   				</div>
   				<div class="modal-body" style="padding-left: 10px;">
   					<div style="text-align: center;">
   						<img style="width: 100px; height: 100px;" id="trainerApplyPhoto" src="<c:url value="/resources/img/basicperson.png"/>" >
					</div>
					<p id="trainerApplyNickname" style="text-align: center;"></p>
					<p>이름</p>
	            	<p id="trainerApplyName"></p>
					<p>생년월일</p>
	            	<p id="trainerApplyBirth"></p>
	            	<p>신청일</p>
	            	<p id="trainerApplyPostdate"></p>
	            	<p>제목</p>
	            	<p id="trainerApplyTitle"></p>
	            	<p>자기소개</p>
	            	<p id="trainerApplyContent"></p>
   				</div>
   			</div>    		
   		</div>    	
   	</div>
	<div class="modal  fade" id="trainerModal" >
   		<div class="modal-dialog ">
   			<div class="modal-content" style="padding: 20px;">
   				<div class="modal-header">
   					<button class="close" data-dismiss="modal"><span>&times;</span></button>
   				</div>
   				<div class="modal-body" style="padding-left: 10px;">
   					<div style="text-align: center;">
   						<img style="width: 100px; height: 100px;" id="trainerPhoto" src="<c:url value="/resources/img/basicperson.png"/>" >
					</div>
					<p id="trainerNickname" style="text-align: center;"></p>
					<p>이름</p>
	            	<p id="trainerName"></p>
	            	<p>제목</p>
	            	<p id="trainerTitle"></p>
	            	<p>자기소개</p>
	            	<p id="trainerContent"></p>
	            	<p>서비스 횟수</p>
	            	<p id="trainerCountOfReview"></p>
	            	<p>별점</p>
	            	<p id="trainerAvgOfRate"></p>
   				</div>
   			</div>    		
   		</div>
   	</div>

    <!-- BEGIN VENDOR JS-->
    <script src="<c:url value="/resources/theme-assets/vendors/js/vendors.min.js"/>" type="text/javascript"></script>
    <!-- BEGIN VENDOR JS-->
    <!-- BEGIN PAGE VENDOR JS-->
    <!-- END PAGE VENDOR JS-->
    <!-- BEGIN CHAMELEON  JS-->
    <script src="<c:url value="/resources/theme-assets/js/core/app-menu-lite.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/theme-assets/js/core/app-lite.js"/>" type="text/javascript"></script>
    <!-- END CHAMELEON  JS-->
    <!-- BEGIN PAGE LEVEL JS-->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
    <!-- END PAGE LEVEL JS-->
  </body>
  <script>
  $(function(){
	$('.trainerApplyClick').click(function(){
		var tNo = this.id.split("&")[1];
		$.ajax({
			url:"<c:url value="/Backend/SelectOneTrainerApply.do" />",
			type:"post",
			dataType:'json',
			data:
				{
					t_no:tNo
				},
			success:function(data){
				console.log(data);
				var count = 0;
				$('#trainerApplyPhoto').attr('src', '<c:url value="/upload/'+data.T_PHOTO.split('/')[0]+'" />');
				$('#trainerApplyNickname').html(data.NICKNAME);
				$('#trainerApplyTitle').html(data.T_TITLE);
				$('#trainerApplyContent').html(data.T_CONTENT);
				$('#trainerApplyName').html(data.NAME);
				$('#trainerApplyBirth').html(moment(new Date(data.BIRTH)).format('YYYY-MM-DD'));
				$('#trainerApplyPostdate').html(moment(new Date(data.T_POSTDATE)).format('YYYY-MM-DD'));
				$('#trainerApplyModal').modal('show');
			},
			error: function(error){
			}
		});
  	});
	$('.btnTrainerApplyOk').click(function(){
		var tNo = this.id.split("&")[1];
		if(confirm("돌보미 신청을 승인하시겠습니까?")){
			$.ajax({
				url:"<c:url value="/Backend/TrainerApplyOk.do" />",
				type:"post",
				dataType:'json',
				data:
					{
						t_no:tNo
					},
				success:function(data){
					console.log(data);
					location.reload();
				},
				error: function(error){
				}
			});
		}
  	});
	$('.btnTrainerApplyNo').click(function(){
		var tNo = this.id.split("&")[1];
		if(confirm("돌보미 신청을 거부하시겠습니까?")){
			$.ajax({
				url:"<c:url value="/Backend/TrainerApplyNo.do" />",
				type:"post",
				dataType:'json',
				data:
					{
						t_no:tNo
					},
				success:function(data){
					console.log(data);
					$('#trainerApplyList'+tNo).html("");
				},
				error: function(error){
				}
			});
		}
	 });
	$('.trainerClick').click(function(){
		var tNo = this.id.split("&")[1];
		$.ajax({
			url:"<c:url value="/Backend/SelectOneTrainer.do" />",
			type:"post",
			dataType:'json',
			data:
				{
					t_no:tNo
				},
			success:function(data){
				console.log(data);
				var count = 0;
				$('#trainerPhoto').attr('src', '<c:url value="/upload/'+data.T_PHOTO.split('/')[0]+'" />');
				$('#trainerNickname').html(data.NICKNAME);
				$('#trainerTitle').html(data.T_TITLE);
				$('#trainerContent').html(data.T_CONTENT);
				$('#trainerName').html(data.NAME);
				if(data.trainerCountOfReview == 0) $('#trainerAvgOfRate').html('0.0점');
				else $('#trainerAvgOfRate').html(data.trainerAvgOfRate+'점');
				$('#trainerCountOfReview').html(data.trainerCountOfReview+'회');
				$('#trainerModal').modal('show');
			},
			error: function(error){
			}
		});
  	});
	$('.btnTrainerNo').click(function(){
		var tNo = this.id.split("Q")[1];
		console.log(tNo);
		if(confirm("돌보미 자격을 정지하시겠습니까?")){
			$.ajax({
				url:"<c:url value="/Backend/TrainerNo.do"/>",
				type:"post",
				dataType:'json',
				data:
					{
						t_no:tNo
					},
				success:function(data){
					console.log(data);
					$('#trainerYesQ'+tNo).css('display','');
					$('#trainerNoQ'+tNo).css('display','none');
					$('#trainerT_TITLENo'+tNo).css('display','');
					$('#trainerT_TITLE'+tNo).css('display','none');
				},
				error: function(error){
				}
			});
		}
	 });
	$('.btnTrainerYes').click(function(){
		var tNo = this.id.split("Q")[1];
		console.log(tNo);
		if(confirm("돌보미 자격을 복구하시겠습니까?")){
			$.ajax({
				url:"<c:url value="/Backend/TrainerYes.do"/>",
				type:"post",
				dataType:'json',
				data:
					{
						t_no:tNo
					},
				success:function(data){
					console.log(data);
					$('#trainerYesQ'+tNo).css('display','none');
					$('#trainerNoQ'+tNo).css('display','');
					$('#trainerT_TITLENo'+tNo).css('display','none');
					$('#trainerT_TITLE'+tNo).css('display','');
				},
				error: function(error){
				}
			});
		}
	 });
  });
  </script>
  
  
  
</html>