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
            <h3 class="content-header-title">푸시 알림 보내기</h3>
          </div>
          <div class="content-header-right col-md-8 col-12">
            <div class="breadcrumbs-top float-md-right">
              <div class="breadcrumb-wrapper mr-1">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="<c:url value="/Backend/Home.do"/>">관리자 사이트</a>
                  </li>
                  <li class="breadcrumb-item active">푸시 알림 보내기
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
						<p class="card-title" style="font-size: 1.5em; font-weight: bold;">푸시 알림</p>
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
						<c:if test="${not empty success }">
							메시지가 전송 되었습니다
						</c:if>
						</div>
						<!-- container -->
						<div class="container">
							<div class="page-header; padding:1000px"></div>
							<div class="row">
								<div class="col-md-12">
									<form action="<c:url value="/message"/>" method="post">
										<div class="row">
											<div class="col-md-offset-1 col-md-2">
												<div class="form-group" style="line-height: 50px;">
													<span style="color: orange; font-size: 1.5em;">제목</span>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<input style="color: black;" type="text" class="form-control"  name="dataTitle" >
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
													<textarea class="col-sm-12" style="border: 1px solid #cacfe7; color: black; margin:10px; width: 100%;" rows="5" class="form-control " name="dataBody" ></textarea>
												</div>
											</div>
										</div>
										<div class="col-md-9" style="text-align: right;">
											<button type="submit" class="btn btn-primary">등록</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					<!-- container -->	
					</div>
				</div>
			</div>
		</div>
		<!-- contentbody -->
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
</html>