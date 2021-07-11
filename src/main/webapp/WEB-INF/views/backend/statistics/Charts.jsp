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
            <h3 class="content-header-title">Charts</h3>
          </div>
          <div class="content-header-right col-md-8 col-12">
            <div class="breadcrumbs-top float-md-right">
              <div class="breadcrumb-wrapper mr-1">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="index.html">Home</a>
                  </li>
                  <li class="breadcrumb-item active">Charts
                  </li>
                </ol>
              </div>
            </div>
          </div>
        </div>
        <div class="content-body"><!-- Bar charts section start -->
<section id="chartjs-bar-charts">
    <!-- Column Chart -->
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">Column Chart</h4>
                    <a class="heading-elements-toggle"><i class="la la-ellipsis-v font-medium-3"></i></a>
                    <div class="heading-elements">
                        <ul class="list-inline mb-0">
                            <li><a data-action="collapse"><i class="ft-minus"></i></a></li>
                            <li><a data-action="reload"><i class="ft-rotate-cw"></i></a></li>
                            <li><a data-action="expand"><i class="ft-maximize"></i></a></li>
                            <li><a data-action="close"><i class="ft-x"></i></a></li>
                        </ul>
                    </div>
                </div>
                <div class="card-content collapse show">
                    <div class="card-body">
                            <div class="height-400">
                        <canvas id="column-chart"></canvas>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Bar Chart -->
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">Bar Chart</h4>
                    <a class="heading-elements-toggle"><i class="la la-ellipsis-v font-medium-3"></i></a>
                    <div class="heading-elements">
                        <ul class="list-inline mb-0">
                            <li><a data-action="collapse"><i class="ft-minus"></i></a></li>
                            <li><a data-action="reload"><i class="ft-rotate-cw"></i></a></li>
                            <li><a data-action="expand"><i class="ft-maximize"></i></a></li>
                            <li><a data-action="close"><i class="ft-x"></i></a></li>
                        </ul>
                    </div>
                </div>
                <div class="card-content collapse show">
                    <div class="card-body">
                            <div class="height-400">
                        <canvas id="bar-chart"></canvas>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</section>
<!-- // Bar charts section end -->

<!-- line chart section start -->
<section id="chartjs-line-charts">
    <!-- Line Chart -->
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">Simple Line Chart</h4>
                    <a class="heading-elements-toggle"><i class="la la-ellipsis-v font-medium-3"></i></a>
                    <div class="heading-elements">
                        <ul class="list-inline mb-0">
                            <li><a data-action="collapse"><i class="ft-minus"></i></a></li>
                            <li><a data-action="reload"><i class="ft-rotate-cw"></i></a></li>
                            <li><a data-action="expand"><i class="ft-maximize"></i></a></li>
                            <li><a data-action="close"><i class="ft-x"></i></a></li>
                        </ul>
                    </div>
                </div>
                <div class="card-content collapse show">
                    <div class="card-body chartjs">
                            <div class="height-500">
                        <canvas id="line-chart"></canvas>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</section>
<!-- // line chart section end -->

<!-- Pie charts section start -->
<section id="chartjs-pie-charts">
    <div class="row">
        <!-- Simple Pie Chart -->
        <div class="col-md-6 col-sm-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">Simple Pie Chart</h4>
                    <a class="heading-elements-toggle"><i class="la la-ellipsis-v font-medium-3"></i></a>
                    <div class="heading-elements">
                        <ul class="list-inline mb-0">
                            <li><a data-action="collapse"><i class="ft-minus"></i></a></li>
                            <li><a data-action="reload"><i class="ft-rotate-cw"></i></a></li>
                            <li><a data-action="expand"><i class="ft-maximize"></i></a></li>
                            <li><a data-action="close"><i class="ft-x"></i></a></li>
                        </ul>
                    </div>
                </div>
                <div class="card-content collapse show">
                    <div class="card-body">
                            <div class="height-400">
                        <canvas id="simple-pie-chart"></canvas>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Simple Doughnut Chart -->
        <div class="col-md-6 col-sm-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">Simple Doughnut Chart</h4>
                    <a class="heading-elements-toggle"><i class="la la-ellipsis-v font-medium-3"></i></a>
                    <div class="heading-elements">
                        <ul class="list-inline mb-0">
                            <li><a data-action="collapse"><i class="ft-minus"></i></a></li>
                            <li><a data-action="reload"><i class="ft-rotate-cw"></i></a></li>
                            <li><a data-action="expand"><i class="ft-maximize"></i></a></li>
                            <li><a data-action="close"><i class="ft-x"></i></a></li>
                        </ul>
                    </div>
                </div>
                <div class="card-content collapse show">
                    <div class="card-body">
                            <div class="height-400">
                        <canvas id="simple-doughnut-chart"></canvas>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>    
</section>
<!-- // Pie charts section end -->

        </div>
      </div>
    </div>

    <!-- BEGIN VENDOR JS-->
    <script src="<c:url value="/resources/theme-assets/vendors/js/vendors.min.js"/>" type="text/javascript"></script>
    <!-- BEGIN VENDOR JS-->
    <!-- BEGIN PAGE VENDOR JS-->
    <script src="<c:url value="/resources/theme-assets/vendors/js/charts/chart.min.js"/>" type="text/javascript"></script>
    <!-- END PAGE VENDOR JS--><c:url value="/resources/theme-assets/js/scripts/charts/chartjs/pie-doughnut/doughnut-simple.js"/>
    <!-- BEGIN CHAMELEON  JS-->
    <script src="<c:url value="/resources/theme-assets/js/core/app-menu-lite.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/theme-assets/js/core/app-lite.js"/>" type="text/javascript"></script>
    <!-- END CHAMELEON  JS-->
    <!-- BEGIN PAGE LEVEL JS-->
    <script src="<c:url value="/resources/theme-assets/js/scripts/charts/chartjs/bar/column.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/theme-assets/js/scripts/charts/chartjs/bar/bar.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/theme-assets/js/scripts/charts/chartjs/line/line.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/theme-assets/js/scripts/charts/chartjs/pie-doughnut/pie-simple.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/theme-assets/js/scripts/charts/chartjs/pie-doughnut/doughnut-simple.js"/>" type="text/javascript"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
    <!-- END PAGE LEVEL JS-->
  </body>
  <script>
//Chart Data
  var columnData = {
      labels: ["January", "February", "March", "April", "May", "June"],
      datasets: [{
          label: "2017",
          data: [65, 85, 40, 78, 56, 75],
          backgroundColor: "#28D094",
          hoverBackgroundColor: "rgba(40,208,148,.9)",
          borderColor: "transparent"
      }, {
          label: "2018",
          data: [45, 65, 65, 19, 86, 35],
          backgroundColor: "#FF4961",
          hoverBackgroundColor: "rgba(255,73,97,.9)",
          borderColor: "transparent"
      }]
  };
  
  var barData = {
       labels: ["January", "February", "March", "April"],
       datasets: [{
           label: "2017",
           data: [65, 59, 80, 22],
           backgroundColor: "#28D094",
           hoverBackgroundColor: "rgba(40,208,148,.9)",
           borderColor: "transparent"
       }, {
           label: "2018",
           data: [28, 48, 40, 19],
           backgroundColor: "#FF4961",
           hoverBackgroundColor: "rgba(255,73,97,.9)",
           borderColor: "transparent"
       }]
   };
  
  var lineData = {
       labels: ["January", "February", "March", "April", "May", "June", "July"],
       datasets: [{
           label: "My First dataset",
           data: [65, 59, 80, 81, 56, 55, 40],
           fill: false,
           borderDash: [5, 5],
           borderColor: "#9C27B0",
           pointBorderColor: "#9C27B0",
           pointBackgroundColor: "#FFF",
           pointBorderWidth: 2,
           pointHoverBorderWidth: 2,
           pointRadius: 4,
       }, {
           label: "My Second dataset",
           data: [28, 48, 40, 19, 86, 27, 90],
           fill: false,
           borderDash: [5, 5],
           borderColor: "#00A5A8",
           pointBorderColor: "#00A5A8",
           pointBackgroundColor: "#FFF",
           pointBorderWidth: 2,
           pointHoverBorderWidth: 2,
           pointRadius: 4,
       }, {
           label: "My Third dataset - No bezier",
           data: [45, 25, 16, 36, 67, 18, 55],
           lineTension: 0,
           fill: false,
           borderColor: "#FF7D4D",
           pointBorderColor: "#FF7D4D",
           pointBackgroundColor: "#FFF",
           pointBorderWidth: 2,
           pointHoverBorderWidth: 2,
           pointRadius: 4,
       }]
   };
  
  var pieData = {
        labels: ["January", "February", "March", "April", "May"],
        datasets: [{
            label: "My First dataset",
            data: [44, 65, 34, 45, 35],
            backgroundColor: ['#666EE8', '#28D094', '#FF4961','#1E9FF2', '#FF9149'],
        }]
    };
  
  var doughnutData = {
	        labels: ["January", "February", "March", "April", "May"],
	        datasets: [{
	            label: "My First dataset",
	            data: [65, 35, 24, 45, 22],
	            backgroundColor: ['#666EE8', '#28D094', '#FF4961','#1E9FF2', '#FF9149'],
	        }]
	    };
  </script>
  
  
  
</html>