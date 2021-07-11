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
            <h3 class="content-header-title">회원/관리자 관리</h3>
          </div>
          <div class="content-header-right col-md-8 col-12">
            <div class="breadcrumbs-top float-md-right">
              <div class="breadcrumb-wrapper mr-1">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="<c:url value="/Backend/Home.do"/>">관리자 사이트</a>
                  </li>
                  <li class="breadcrumb-item active">회원/관리자 관리
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
						<p class="card-title" style="font-size: 1.5em; font-weight: bold;">회원 관리</p>
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
							<p class="card-text">회원 관리입니다. 이용정지가 해제되면 일반회원으로 권한이 설정됩니다.</p>
						</div>
						<div class="table-responsive">
							<table class="table table-striped  table-bordered ">
								<thead class="thead-dark">
									<tr>
										<th scope="col">no</th>
										<th scope="col">이름</th>
										<th scope="col">닉네임</th>
										<th scope="col">생년월일</th>
										<th scope="col">가입일</th>
										<th scope="col">권한</th>
										<th scope="col">확인</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach items="${memberList }" var="member" varStatus="loop">
									<tr>
										<th scope="row">${loop.count }</th>
										<td>${member.NAME }</td>
										<td>${member.NICKNAME }</td>
										<td><fmt:formatDate value="${member.BIRTH }" pattern="yyyy-MM-dd"/></td>
										<td><fmt:formatDate value="${member.JOINDATE }" pattern="yyyy-MM-dd"/></td>
										<td>
											<c:if test="${member.POWER == 0 }"><span id="powerQ${member.ID }" style="color: red;">이용중지</span></c:if>
											<c:if test="${member.POWER == 1 }"><span id="powerQ${member.ID }" >일반회원</span></c:if>
											<c:if test="${member.POWER == 2 }"><span id="powerQ${member.ID }" >돌봄회원</span></c:if>
											<c:if test="${member.POWER == 3 }"><span id="powerQ${member.ID }" style="color: red;">돌봄중지</span></c:if>
										</td>
										<td>
											<button class="memberClick" id="memberQ${member.ID }" value="${member.ID }">상세보기</button>
											<c:if test="${member.POWER != 0 }" var="memberFlag">
												<button class="btnMemberNo" id="memberNoQ${member.ID }" value="${member.ID }">이용중지</button>
												<button class="btnMemberYes" id="memberYesQ${member.ID }" value="${member.ID }" style="display: none;">정지해제</button>
											</c:if>
											<c:if test="${!memberFlag }">
												<button class="btnMemberNo" id="memberNoQ${member.ID }" value="${member.ID }" style="display: none;">이용중지</button>
												<button class="btnMemberYes" id="memberYesQ${member.ID }" value="${member.ID }" >정지해제</button>
											</c:if>
											<c:if test="${sessionScope.power == 10 }">
												<button class="btnManagerYes" id="managerYesQ${member.ID }" value="${member.ID }">관리권한</button>
											</c:if>
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
		<c:if test="${sessionScope.power == 10 }">
		<div class="row">
			<div class="col-12">
				<div class="card">
					<div class="card-header">
						<p class="card-title" style="font-size: 1.5em; font-weight: bold;">관리자 관리</p>
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
							<p class="card-text">관리자 권한을 제거하면 일반 회원이 됩니다</p>
						</div>
						<div class="table-responsive">
							<table class="table table-striped  table-bordered ">
								<thead class="thead-dark">
									<tr>
										<th scope="col">no</th>
										<th scope="col">이름</th>
										<th scope="col">닉네임</th>
										<th scope="col">권한</th>
										<th scope="col">확인</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach items="${managerList }" var="manager" varStatus="loop">
									<tr>
										<th scope="row">${loop.count }</th>
										<td>${manager.NICKNAME }</td>
										<td>${manager.NAME }</td>
										<td>
											<c:if test="${manager.POWER == 5 }"><span>일반관리</span></c:if>
											<c:if test="${manager.POWER == 10 }"><span>최고관리</span></c:if>
										</td>
										<td>
											<button class="memberClick" id="memberQ${manager.ID }" value="${manager.ID }">상세보기</button>
											<c:if test="${manager.POWER == 5 }">
												<button class="btnManagerNo" id="managerNoQ${manager.ID }" value="${manager.ID }" >권한취소</button>
											</c:if>
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
		</c:if>
    </div>
  </div>
</div>
	<div class="modal  fade" id="memberModal" >
   		<div class="modal-dialog ">
   			<div class="modal-content" style="padding: 20px;">
   				<div class="modal-header">
   					<button class="close" data-dismiss="modal"><span>&times;</span></button>
   				</div>
   				<div class="modal-body" style="padding-left: 10px;">
   					<div style="text-align: center;">
   						<img style="width: 100px; height: 100px;" id="memberPhoto" src="<c:url value="/resources/img/basicperson.png"/>" >
					</div>
					<p id="memberNickname" style="text-align: center;"></p>
					<p>이름</p>
	            	<p id="memberName"></p>
					<p>생년월일</p>
	            	<p id="memberBirth"></p>
	            	<p>성별</p>
	            	<p id="memberGender"></p>
	            	<p>우편번호</p>
	            	<p id="memberPostCode"></p>
	            	<p>주소</p>
	            	<p id="memberAddr"></p>
	            	<p>가입일</p>
	            	<p id="memberJoindate"></p>
	            	
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
	$('.memberClick').click(function(){
		var btnID = this.id.split("Q")[1];
		var ID = this.value;
		console.log(ID);
		$.ajax({
			url:"<c:url value="/Backend/SelectOneMember.do" />",
			type:"post",
			dataType:'json',
			data:
				{
					id:ID
				},
			success:function(data){
				console.log(data);
				var count = 0;
				$('#memberPhoto').attr('src', '<c:url value="/upload/'+data.PIC_NAME+'" />');
				$('#memberNickname').html(data.NICKNAME);
				$('#memberName').html(data.NAME);
				$('#memberBirth').html(moment(new Date(data.BIRTH)).format('YYYY-MM-DD'));
				$('#memberGender').html(data.GENDER);
				$('#memberPostCode').html(data.POSTCODE);
				$('#memberAddr').html(data.ADDR);
				$('#memberJoindate').html(moment(new Date(data.JOINDATE)).format('YYYY-MM-DD'));
				$('#memberModal').modal('show');
			},
			error: function(error){
			}
		});
  	});
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
	$('.btnMemberYes').click(function(){
		var btnID = this.id.split("Q")[1];
		var ID = this.value;
		if(confirm("이용권한을 복구하시겠습니까?")){
			$.ajax({
				url:"<c:url value="/Backend/MemberYes.do"/>",
				type:"post",
				dataType:'json',
				data:
					{
						id:ID
					},
				success:function(data){
					console.log(data);
					$('#memberYesQ'+btnID).css('display','none');
					$('#memberNoQ'+btnID).css('display','');
					$('#powerQ'+btnID).css('color','black');
					$('#powerQ'+btnID).html('일반회원');
				},
				error: function(error){
				}
			});
		}
	 });
	$('.btnManagerNo').click(function(){
		var btnID = this.id.split("Q")[1];
		var ID = this.value;
		if(confirm("관리자 권한을 취소하시겠습니까?")){
			$.ajax({
				url:"<c:url value="/Backend/ManagerNo.do"/>",
				type:"post",
				dataType:'json',
				data:
					{
						id:ID
					},
				success:function(data){
					location.reload();
				},
				error: function(error){
				}
			});
		}
	});
	$('.btnManagerYes').click(function(){
		var btnID = this.id.split("Q")[1];
		var ID = this.value;
		if(confirm("관리자 권한을 부여하시겠습니까?")){
			$.ajax({
				url:"<c:url value="/Backend/ManagerYes.do"/>",
				type:"post",
				dataType:'json',
				data:
					{
						id:ID
					},
				success:function(data){
					location.reload();
				},
				error: function(error){
				}
			});
		}
	 });
	
	
  });
  </script>
  
  
  
</html>