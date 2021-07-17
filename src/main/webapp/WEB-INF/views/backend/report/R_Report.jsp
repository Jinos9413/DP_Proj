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
            <h3 class="content-header-title">게시판 신고 관리</h3>
            <div>
			  <a href="<c:url value="/Backend/P_Report.do"/>">사진 게시판</a>
			</div>
			<div>  
	          <a href="<c:url value="/Backend/R_Report.do"/>">추천 산책로</a>
    		</div>
          </div>
          <div class="content-header-right col-md-8 col-12">
            <div class="breadcrumbs-top float-md-right">
              <div class="breadcrumb-wrapper mr-1">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="<c:url value="/Backend/Home.do"/>">관리자 사이트</a>
                  </li>
                  <li class="breadcrumb-item active">게시판 신고 관리
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
						<p class="card-title" style="font-size: 1.5em; font-weight: bold;">신고 관리</p>
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
							<p class="card-text">신고 관리입니다. 이용정지가 해제되면 일반회원으로 권한이 설정됩니다.</p>
						</div>
						<div class="table-responsive">
							<table class="table table-striped  table-bordered ">
								<thead class="thead-dark">
									<tr>
										<th class="col-md-1" scope="col">no</th>
										<th class="col-md-1" scope="col">신고 NO</th>
										<th class="col-md-9" scope="col">신고 제목</th>
										<th class="col-md-1" scope="col">글 NO</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach items="${r_ReportList }" var="report" varStatus="loop">
									<tr>
										<th scope="row">${loop.count }</th>
										<td><button class="reportClick" id="reportQ${report.R_R_NO }" value="${report.R_R_NO }">${report.R_R_NO}</button></td>
										<td>${report.R_R_TITLE }</td>
										<td><button class="contentClick" id="contentQ${report.R_NO }" value="${report.R_NO }">${report.R_NO}</button></td>
									</tr>
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
	<!-- 신고 모달 -->
	<div class="modal  fade" id="reportModal" >
   		<div class="modal-dialog ">
   			<div class="modal-content" style="padding: 20px;">
   				<div class="modal-header">
   					<button class="close" data-dismiss="modal"><span>&times;</span></button>
   				</div>
   				<div class="modal-body" style="padding-left: 10px;">
					<p id="reportNo" style="text-align: center;"></p>
					<p>신고자 ID</p>
	            	<p id="reportID"></p>
					<p>신고 제목</p>
	            	<p id="reportTitle"></p>
	            	<p>신고 내용</p>
	            	<p id="reportContent"></p>
	            	<p>신고 일자</p>
	            	<p id="reportDate"></p>
   				</div>
   			</div>    		
   		</div>    	
   	</div>
   	<!-- 게시글 자세히 보기 모달 -->
   	<!-- 자세히보기 모달 -->
	<div class="modal fade" id="basic_modal" data-backdrop="static">
   		<div class="modal-dialog" style="width: 900px; display: table;" >
   			<div class="modal-content">
   				<div class="modal-header ">
   					<button class="close" data-dismiss="modal"><span>&times;</span></button>
   					<h2 class="modal-title text-center"><p id="R_TITLE" style="font-size: 0.9em;"></p></h2>
   				</div>
   				<div class="modal-body">
   					<div class="row">
   						<div class="col-md-7" style="padding-left: 40px;">
		   					<!-- 사진 -->
		   					<div data-ride="carousel" style="text-align: center;">
			   					<div id="viewImages" style="width:100%; height: 300px; overflow: hidden;"></div>
								<span class="lnr lnr-chevron-left" id="prevImage" style="cursor: pointer;"></span>
								<span class="lnr lnr-chevron-right" id="nextImage" style="cursor: pointer;"></span>
   							</div>
   							<div style="padding-left: 20px; ">
	   							<span id="NICKNAME"></span><br/><span id="R_CONTENT"></span><br/>
	   							<input type="hidden" name="R_NO" id="R_NO" /> 
   							</div>
   						</div>
   				<div class="modal-footer1" style="text-align: center;">
   					<span class ="modalset"></span>
   					<button class="btn btn-info" data-dismiss="modal">닫기</button>
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
	$('.reportClick').click(function(){
		var btnNo = this.id.split("Q")[1];
		var No = this.value;
		console.log(No);
		$.ajax({
			url:"<c:url value="/Backend/SelectOneR_Report.do" />",
			type:"post",
			dataType:'json',
			data:
				{
					r_r_no:No
				},
			success:function(data){
				console.log(data);
				var count = 0;
				$('#reportNo').html(data.R_R_NO);
				$('#reportID').html(data.ID);
				$('#reportTitle').html(data.R_R_TITLE);
				$('#reportContent').html(data.R_R_CONTENT);
				$('#reportDate').html(data.R_R_POSTDATE);
				$('#reportmodal').modal('show');
			},
			error: function(error){
			}
		});
  	});
  });
	<!-- 게시글 자세히 보기 모달 -->
	$('.contentClick').on('click',function(){
	   	console.log("pNo : "+this.id.split('Q')[1]);
	   	var rNo = this.id.split('Q')[1];
	   	$('#R_NO').val(rNo);	
	   	console.log(pNo);
	   	//appen 다 비워주기
	   	$('.modalset').html("");
	   	$('#viewImages').html("");
	   	$.ajax({
			url:"<c:url value="/Community/SelectOneView.do" />",//요청할 서버의 URL 주소
			type:"post",//데이터 전송방식(디폴트는 get방식)
			dataType:'json',//서버로부터 받을 응답 데이터의 형식 설정
			data:
				{
					r_no:rNo
				},
			success:function(data){//서버로부터 정상적인 응답(200)을 받았을 때 호출되는 콜백함수
				console.log(data);
				//이미지 캐러셀
				var images=(data.R_IMAGES).split("/")
				for(var i = 0; i<images.length-1 ; i++){
					$('#viewImages').append('<img style="width: 90%; display: none;" src="<c:url value="/upload/'+images[i]+'"/>" id="image'+i+'" class="image" >')
					$('.image').mouseenter(function(){
						   $('#up').css('display','');
						   $('#up').html('<img style="width: 100%;height:"100%"" src="'+this.src+'">');
					});
					$('.image').mouseleave(function(){
						   $('#up').css('display','none'); 
					});
				}
				
				var imageNum = 0;
				var imageCount = $('.image').length;
				
				$('#image0').css("display","");
				$('#nextImage').on('click',function(){
					if(imageNum < imageCount-1){
						$('#image'+imageNum+'').css("display","none");
						imageNum++;
						$('#image'+imageNum+'').css("display","");
					}
				});
				$('#prevImage').on('click',function(){
					if(imageNum > 0){
						$('#image'+imageNum+'').css("display","none");
						imageNum--;
						$('#image'+imageNum+'').css("display","");
					}
				});
				$('#R_NO').val(data.R_NO);
				$('#R_TITLE').html(data.R_TITLE);
				$('#R_CONTENT').html(data.R_CONTENT);
				$('#NICKNAME').html(data.NICKNAME);
				//삭제추가
				$('.modalset').append('<a href="javascript:isDelete();" class="btn btn-success">삭제</a>')
				$('.modalset').append('<button class="btnMemberNo" id="memberNoQ'+data.ID+'" value="'+data.ID+'" style="display: none;">이용중지</button>')
				$('#basic_modal').modal('show');
			},////////////success
			error: function(error){//서버로부터 비정상적인 응답을 받았을 때 호출되는 콜백함수
			}
		});
   });
	<!--이용 권한 사라지게 하기-->
	$('.btnMemberNo').click(function(){
		var btnID = this.id.split("Q")[1];
		var ID = this.value;
		if(confirm("이용권한을 중지하시겠습니까?")){
			$.ajax({
				url:"<c:url value="/Backend/MemberNo.do"/>",
				type:"post",
				dataType:'json',
				data:
					{
						id:ID
					},
				success:function(data){
					console.log(data);
					$('#memberYesQ'+btnID).css('display','');
					$('#memberNoQ'+btnID).css('display','none');
					$('#powerQ'+btnID).css('color','red');
					$('#powerQ'+btnID).html('이용중지');
				},
				error: function(error){
				}
			});
		}
	});
	//삭제확인 메소드
	function isDelete(){
		var rNo = $('#R_NO').val();
		console.log("delete 값 "+rNo)
      	if(confirm("정말로 삭제 하시겠습니까?")){
      		 $.ajax({
    				url:"<c:url value="/Community/Photo/R_Delete.do"/>", // 서버에 전달할 파일명
    				dataType: 'text',
    				type: 'post',
    				data: {
    					r_no : rNo,
    				},
    				success: function() {
    				     alert('Success'); // 성공시 코드
    				     $('#basic_modal').modal('hide');
    				     //$('#R_list'+rNo).remove();
    				}
    			});
      	}
    }///////////
  
  </script>
</html>