<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
  	<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
  	<meta name="viewport" content="width=device-width, initial-scale=1"/>
	<link rel="stylesheet" href="<c:url value= "/resources/recommendation/css/bootstrap.css"/>">
    <link rel="stylesheet" href="<c:url value = "/resources/recommendation/css/insta-nav.css"/>">
	<link rel="stylesheet" href="<c:url value ="/resources/recommendation/css/font-awesome.css"/>">
	<link rel="shortcut icon" href="<c:url value ="/resources/recommendation/favicon.ico"/>">
	<style>
		li{
			list-style-type: none
		}
		#mfooter{
			text-align: center;
		}
		.carousel-control.left, .carousel-control.right{
			background-image: none;
		}
		.panel-body{
			padding:0;
		}
		.modal {
		  text-align: center;
		  padding: 0!important;
		}

		.modal:before {
		  content: '';
		  display: inline-block;
		  height: 100%;
		  vertical-align: middle;
		  margin-right: -4px;
		}

		.modal-dialog {
		  display: inline-block;
		  text-align: left;
		  vertical-align: middle;
		}
		.loader{
			text-align: center;
			position: fixed;
			bottom: 30px;
			left: 0;
			width: 100%;
			display: none;
		}

		.loader img{
			height: 20px;
		}
		
	    .links {
	      font-size: 12px;
	      font-weight: 600;
	      margin: 0;
	      padding: 0;
	      list-style-type: none;
	    }

	    .links li{
	      margin-right: 8px;
	      display: inline-block;
	      
	    }
	    .links a{
	      color: #023369;
	    }

	    .copyright {
	      color: #999;
	      font-size: 12px;
	      font-weight: 600;
	      letter-spacing: 0.7px;
	    }
	</style>

    <!-- Required meta tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="keywords" content="Bootstrap, Landing page, Template, Registration, Landing">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="author" content="Grayrids">
    <title>????????????</title>
</head>
<body>
 	<jsp:include page="/WEB-INF/views/templates/Top.jsp"/>
  	<!-- Header Section Start -->
	<section id="services" class="section" style="padding-top:200px ; height: 400px ;background-image: url('<c:url value="/resources/img/background/doghug.jpg"/>');">
      <div class="container" >
        <div class="section-header">          
          <h2 class="section-title wow fadeIn" data-wow-duration="1000ms" data-wow-delay="0.3s">???????????? <span>???????????????</span></h2>
          <hr class="lines wow zoomIn" data-wow-delay="0.3s">
          <p class="section-subtitle wow fadeIn" data-wow-duration="1000ms" data-wow-delay="0.3s">????????????</p>
        </div>
      </div>
    </section>
 <div class="page-title" style="background-color: #f5efb4; text-align: center;">
    			<a class="on" href="<c:url value="/Community/Photo/P_Main.do"/>">?????? ?????????</a>
    		<a href="<c:url value="/Community/Recommendation/R_Main.do"/>">?????? ?????????</a>
    </div>
	<!-- ??? -->
     
   <div id="nprogress" style="display: none;"></div>


   <div class="loader"><img src="<c:url value="/resources/recommendation/images/loader2.gif"/>" alt="loading image"></div>

	<div class="container showDiv" style="margin-top: 150px;">
		<!-- 1?????? panel -->
		<div class="col-md-7 col-sm-7 col-xs-12 col-sm-offset-3">
			<div class="panel panel-default">
		        <div class="panel-heading" style="background-color: white;">
		            <h3 class="panel-title"><img src="<c:url value="/resources/recommendation/images/image1.jpg"/>" width="50" style="border-radius: 50%;">&nbsp;${record.p_title} <a href="#myModal" sytle="float: right;" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-option-horizontal" style="float: right; padding-top: 20px;"></span></a></h3>
		            <div class="modal fade" id="myModal">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header text-center">
									<a href="javascript:" >???????????? ??????</a>
								</div>
								<div class="modal-body text-center">
									<a href="javascript:">???????????? ????????? ??????</a>
								</div>
								<div class="modal-footer" id="mfooter">
									<a href="javascript:" data-dismiss="modal">??????</a><br/>
								</div>
							</div>
						</div>
					</div>
		        </div>
		        <div class="panel-body">
		        	<div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="100000000">
		        		<div class="carousel-inner">
		        			<c:forEach items="${p_images }" var="image" varStatus="loop">
		        				<c:if test="${loop.index == 0 }" var="flag">
		        				<div class="item active">
								<img src="<c:url value="/upload/${image }"/>" id="image${loop.index }" class="image" >
								</div>
								</c:if>
								<c:if test="${!flag }">
								<div class="item">
								<img src="<c:url value="/upload/${image }"/>" id="image${loop.index }" class="image" >
								</div>
								</c:if>
							</c:forEach>

						</div>
						<!-- Carousel ????????? ????????? nav ??????  -->
						<ol class="carousel-indicators">
							<!-- data-target="Carousel ????????? ?????????" 
							data-slide-to="????????? ?????????" -->
							<c:forEach items="${p_images }" var="image" varStatus="loop">
							<li data-target="#myCarousel" data-slide-to="${loop.index }"></li>
							</c:forEach>
						</ol>
						<!-- ??????, ?????? control UI -->
						<a href="#myCarousel" class="left carousel-control" data-slide="prev">
							<span class="glyphicon glyphicon-chevron-left"></span>
							<span class="sr-only">??????</span>
						</a>
						<a href="#myCarousel" class="right carousel-control" data-slide="next">
							<span class="glyphicon glyphicon-chevron-right"></span>
							<span class="sr-only">??????</span>
						</a>
		        	</div>           
		        </div>
		        <div class="panel-footer" style="background-color: white;">  
		        	<c:if test="${likeCheck == 0 }" var="flag">
						<a href="javascript:"><span class="likeSpan fa fa-heart-o" style="color: black; font-size: 20px;" id="like${record.p_no}">&nbsp;${record.p_likecount }</span></a>&nbsp;&nbsp;
					</c:if>
					<c:if test="${!flag }">
						<a href="javascript:"><span class="likeSpan fa fa-heart" style="color: red; font-size: 20px;" id="like${record.p_no}">&nbsp;${record.p_likecount }</span></a>&nbsp;&nbsp;
					</c:if>
						<span class="textSpan fa fa-comment-o" style="color: black; font-size: 20px;">&nbsp;${record.p_commentcount }</span>
					<a href="javascript:">
						<span class="saveSpan fa fa-bookmark-o" style="color: black; font-size: 20px; float: right;" data-content="?????????" data-toggle="popover" data-placement="top"></span>
					</a>
		            <p class="contentsP"><strong>${record.nickname}</strong> <span style="color: #002266;">${record.p_postdate} </span> <label>${record.p_title}</label></p>
		             <p class="contentsP"> <label> ${record.p_content}</label></p>
		            <ul class="listUl">
		            
		            <c:if test="${empty commentList }" var="isEmpty">
						<li id="defaultComment"><strong>????????? ????????? ?????????</strong></li>
					</c:if>
					<c:if test="${not isEmpty }">
					<c:forEach items="${commentList}" var="item" varStatus="loop">
						<c:if test="${sessionScope.id == record.id }" var="idMatch">
		            	 <li class="comment" id="${item.P_C_NO}"><strong>${item.NICKNAME}</strong>&nbsp;${item.P_COMMENT}
		            		<span class="input-group-btn">
			         	   		<button class="p_commentdelete" type="button" id="delete${item.P_C_NO}"style="color:#050099">??????</button>
			         		</span>
			         	 </li>
		            	</c:if>	
		            	<c:if test="${not idMatch}">
		            		<li class="comment" id="${item.P_C_NO}"><strong>${item.NICKNAME}</strong>&nbsp;${item.P_COMMENT}</li>
		            	</c:if>
		            </c:forEach>	
		            </c:if>	
		            
		            </ul>	       
						<div class="input-group" >
			          		<input type="text" id="input"class="form-control textInput">
			          	 <span class="input-group-btn">
			         	   	<button class="showBtn btn btn-default" type="button" style="color:#050099">??????</button>
			         	 </span>
	        			</div>					
		        </div>
	    	</div>
		</div> <!-- 1?????? panel ??? -->
	</div> <!-- showDiv1 ??? -->
	<div class="row">
			<div class="col-md-offset-2 col-md-8">
				<!-- .center-block ????????? ?????? ????????? ????????? ???????????? -->
				<ul id="pillMenu" class="nav nav-pills center-block"
					style="width: 200px; margin-bottom: 10px">
					
					<c:if test="${sessionScope.id == record.id }">
						<li><a
							href="<c:url value='/Community/Photo/P_Edit.do?p_no=${record.p_no}'/>"
							class="btn btn-success">??????</a></li>
						<li><a href="javascript:isDelete();" class="btn btn-success">??????</a></li>
					</c:if>
					
					<li><a href="<c:url value='/Community/Photo/P_Main.do?nowPage=${param.nowPage}'/>" class="btn btn-success">??????</a></li> 
				</ul>
				
			</div>
		</div>	
	<!-- ???????????? -->
	<div class="modal fade" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header text-center">
					<a class="glyphicon glyphicon-alert" href="#" >????????? ?????? ?????????</a>
				</div>
				<!-- body -->
				<div class="modal-body text-center">
					<form>
						<input type="hidden" name="R_NO" id="ReportR_NO" /> 
			          <div class="form-group">
			          	<div style="text-align: left;">
			            	<label for="recipient-name" class="control-label" >?????? ??????:</label><div id="message1" style="color: red;"></div>
			            </div>
			            <input type="text" class="form-control" id="R_R_TITLE" placeholder="????????? ???????????????">
			          </div>
			          <div class="form-group">
			            <div style="text-align: left;">
			            	<label for="message-text" class="control-label" >?????? ??????:</label><div id="message2" style="color: red;"></div>
			            </div>
			            <textarea class="form-control" id="R_R_COMMENT" placeholder="????????? ???????????????"></textarea>
			          </div>
			        </form>
				</div>
				<div class="modal-footer" id="mfooter">
					<input class="btn btn-success" id="reportSubmit" type="button" value="?????? ??????" />
					<a href="javascript:" class="btn btn-success" data-dismiss="modal">??????</a><br/>
				</div>
			</div>
		</div>
	</div>	
		
	
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
    <script src="<c:url value="/resources/js/menu.js"/>"></script>
    <script src="<c:url value="/resources/js/jquery.vide.js"/>"></script>
    <script src="<c:url value="/resources/js/jquery.counterup.min.js"/>"></script>    
    <script src="<c:url value="/resources/js/jquery.magnific-popup.min.js"/>"></script>    
    <script src="<c:url value="/resources/js/waypoints.min.js"/>"></script>    
    <script src="<c:url value="/resources/js/form-validator.min.js"/>"></script>
    <script src="<c:url value="/resources/js/contact-form-script.js"/>"></script>     
    <script src="<c:url value="/resources/js/main.js"/>"></script>
    <script src='<c:url value="/resources/lib/main.js"/>'></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=d963a4891fae00b5fd892884ae34a387"></script>
	<script src="<c:url value="/resources/recommendation/js/jquery-3.2.1.js"/>"></script>
	<script src="<c:url value="/resources/recommendation/js/bootstrap.js"/>"></script>	
	<script>

  var check = $("#none").val();  
      
      //?????? ?????? ??? ????????? ?????? ?????? ??????   
      //?????? ?????? ?????? ??? ????????? ?????????
      $(".likeSpan").click(function(){
         var p_no1 = this.id.split('e')[1];
         console.log($(this).css('color'));
         if($(this).css('color')=='rgb(0, 0, 0)'){
        	 $(this)
        	 .removeClass("fa fa-heart-o")
             .addClass("fa fa-heart")
             .css("color", "red");
             
        	 $.ajax({
                 url: "<c:url value="/Community/Photo/P_LikeInsert.do"/>",
                     type: "POST",
                     data: {
                         p_no: p_no1
                     },
                     success: function (data) {
                      $("#like"+p_no1).html("&nbsp;"+data);
                        console.log(data);
                     },
              });
         }
         else{
        	 $(this)
             .removeClass("fa fa-heart")
             .addClass("fa fa-heart-o")
             .css("color", "black");
        	 
        	  $.ajax({
                  url: "<c:url value="/Community/Photo/P_LikeDelete.do"/>",
                      type: "POST",
                      data: {
                          p_no: p_no1
                      },
                      success: function (data) {
                       $("#like"+p_no1).html("&nbsp;"+data);
                         console.log(data);
                      },
               })
         }
      }); 

	

		//?????? input?????? ?????? ??????.
		$(".input-group").hide();

		$(".textSpan").click(function(){
			$(this).parent().parent().find(".input-group").show();
		});
		
		/* var inputMsg = $(this).parent().parent().find(".textInput").val();
			var html = "<strong>" + "seunghyun" + "</strong>" + " " + inputMsg;
			var liText = $("<li/>").html(html); */
		

		//?????? ?????? li????????? ??????
		$(".showBtn").click(function(){
			var p_no2 = ${record.p_no}
			var content = $('#input').val();
				var inputMsg = $(this).parent().parent().find(".textInput").val()
				//ajax??? ??????]			
				$.ajax({
				    url: "<c:url value="/Community/Photo/P_C_Write.do"/>",
					data: {
						p_no:p_no2,
						p_comment:content
					},
					dataType:"text",
					type:"post",
					success:function(data){//?????? ?????? ?????? 
						console.log("??????????????? ?????? ?????????:"+data);
						var name = data.split('&')[0];
						var no =  data.split('&')[1];
						var commentCount =  data.split('&')[2];
						$('.listUl').append(' <li class="comment" id="'+no+'"><strong>'+name+'</strong>&nbsp;'+content+'<span class="input-group-btn"><button class="p_commentdelete" type="button" style="color:#050099">??????</button></span></li>')
						$('#input').val("");
						$('#defaultComment').html('');
							//????????? ???
						$(".textSpan").html("&nbsp;"+commentCount);
					}				
				});			
		});
		
			
		//?????? ????????? ??????????????????
		$(document).on('click','.p_commentdelete',function(){
			
			if(confirm("????????? ?????????????")){
				var p_c_no2 = this.id.split('e')[3];
				var p_no2 = ${record.p_no};
					//ajax??? ??????]			
					$.ajax({
					    url: "<c:url value="/Community/Photo/P_C_Delete.do"/>",
						data: {
							p_c_no : p_c_no2,
							p_no : p_no2
						},
						dataType:"text",
						type:"post",
						success:function(data){//?????? ?????? ?????? 
							console.log("??????????????? ?????? ?????????:"+data);
							//????????? ???
							$('#'+p_c_no2).remove();
							$(".textSpan").html("&nbsp;"+data);
						}				
					});			
			}
		});  

		
		//????????? ?????? ??????
		$(".saveSpan").click(function(){
			if(check){
				$(this)
				.removeClass("fa fa-bookmark-o")
				.addClass("fa fa-bookmark")
				.css("color", "black");

				check = false;
			}else{
				$(this)
				.removeClass("fa fa-bookmark")
				.addClass("fa fa-bookmark-o")
				.css("color", "black");

				check = true;
			}
		});
		//????????? popover ??????
		$(".saveSpan").popover();

		$(".saveSpan").on("shown.bs.popover", function(){
			var pop = $(this);
			setTimeout(function() {
				$(pop).popover('hide');
			}, 1500);
		});

		//?????? ????????? ?????? ??????.
		$(".showLabel").click(function(){
			$(".moreSpan").show();
			$(".showLabel").hide();
		});

		
		
		
	// ...?????? ?????? ??? ????????? ????????? ?????????????????? ????????? ?????? ??????.
		$("#myModal").modal({show:false});


      //Scroll Event
       $(window).on("scroll", function(e) {
         var scrollTop = $(window).scrollTop();
         if(scrollTop > 50) {
           $('.nav-insta').addClass("nav-small");
           $('.nav-container').addClass("container-small");

           $('.nav-fixed-1').stop().hide();
           $('.nav-fixed-2').stop().fadeIn(500);

         $('body').addClass("body-small");

         }
         else {
           $('.nav-insta').removeClass("nav-small");
           $('.nav-container').removeClass("container-small");
           $('.nav-fixed-2').stop().hide();
           $('.nav-fixed-1').stop().fadeIn(500);

           $('body').removeClass("body-small");
         }
       });

      function fn_movePage(pageNm) {
	      //Loading a progress bar
	      $('#nprogress').show();
	        var wPercent = 0;
	        var intId = setInterval(function() {
	          if(wPercent > 100) {
	            clearInterval(intId);
	            location.href = pageNm + ".html";
	          }
	          $('#nprogress').css("width",  wPercent + "%");
	          wPercent += 0.6;
	        } , 10);
	   }
  	
      function isDelete(){
      	if(confirm("????????? ?????? ???????????????????")){
      		location.replace("<c:url value="/Community/Photo/P_Delete.do?p_no=${record.p_no}"/>");
      	}
      }
	</script>

</body>
</html>