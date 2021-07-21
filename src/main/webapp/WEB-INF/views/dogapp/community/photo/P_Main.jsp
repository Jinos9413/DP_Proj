<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
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
       
       .btnView:hover{
       	 cursor: pointer;
       }
   </style>

    <!-- Required meta tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="keywords" content="Bootstrap, Landing page, Template, Registration, Landing">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="author" content="Grayrids">
    <title>산책하개</title>
</head>
<body>
    <jsp:include page="/WEB-INF/views/templates/Top.jsp"/>
     <!-- Header Section Start -->
   <section id="services" class="section" style="padding-top:200px ; height: 400px ;background-image: url('<c:url value="/resources/img/background/doghug.jpg"/>');">
      <div class="container" >
        <div class="section-header">          
          <h2 class="section-title wow fadeIn" data-wow-duration="1000ms" data-wow-delay="0.3s">우리 아이 <span>자랑</span></h2>
          <hr class="lines wow zoomIn" data-wow-delay="0.3s">
          <p class="section-subtitle wow fadeIn" data-wow-duration="1000ms" data-wow-delay="0.3s">우리 강아지 좀 보고 가세요</p>
        </div>
      </div>
    </section>
    <div class="page-title" style="background-color: #f5efb4; text-align: center;">
		  <a class="on"  href="<c:url value="/Community/Photo/P_Main.do"/>">사진 게시판</a>
          <a href="<c:url value="/Community/Recommendation/R_Main.do"/>">추천 산책로</a>
    </div>
   <!-- 끝 -->
   <section id="blog" class="section">
      <!-- Container Starts -->
		<div class="container">
			<div class="row">
				<div class="col-md-9">
					<p style="font-size: 2em; font-weight: bold;">사진 게시판입니다</p>
					<p style="color: gray;">자유롭게 써주세요</p>
				</div>
				<div class="col-md-3" style="text-align: right;">
					<a href="<c:url value="/Community/Photo/P_Write.do"/>"
						class="btn btn-common">등록</a>
				</div>
			</div>

			<hr />
			<div class="row">
				<c:if test="${empty listPagingData.lists }" var="isEmpty">
					<div>등록된 게시물이 없어요</div>
				</c:if>
				<c:if test="${not isEmpty }">
					<c:forEach items="${listPagingData.lists }" var="item" varStatus="loop">

						<!-- 1번째 panel -->
						<div class="col-md-7 col-sm-7 col-xs-12 col-sm-offset-3" id="P_list${item.p_no}">
							<div class="panel panel-default">
								<div class="panel-heading" style="background-color: white;">
									<h3 class="panel-title">
										<img
											src="<c:url value="/upload/${item.pic_name }"/>"
											style="width:50px; height: 50px;border-radius: 50%;"> ${item.p_title}
									</h3>
								</div>
								<div class="btnView" id="btnViewQ${item.p_no}">
										<div class="item active" style="height: 400px; overflow:hidden;">
											<img src="<c:url value="/upload/${fn:split(item.p_images,'/')[0] }"/>"  class="img-responsive"/>
										</div>
								</div>
								<div class="panel-footer" style="background-color: white;">
									<c:if test="${likeList[loop.index]==0 }" var="flag">
										<a href="javascript:"><span class="likeSpan fa fa-heart-o" style="color: black; font-size: 20px;" id="like${item.p_no}">&nbsp;${item.p_likecount }</span></a>&nbsp;&nbsp;
									</c:if>
									<c:if test="${!flag }">
										<a href="javascript:"><span class="likeSpan fa fa-heart" style="color: red; font-size: 20px;" id="like${item.p_no}">&nbsp;${item.p_likecount }</span></a>&nbsp;&nbsp;
									</c:if>
										<span class="fa fa-comment-o" style="color: black; font-size: 20px;" id="maincomment${item.p_no}">&nbsp;${item.p_commentcount}</span>
								</div>
							</div>
						</div>
						<!-- 1번째 panel 끝 -->
					</c:forEach>
				</c:if>
			</div>
			<div class="row" style="text-align: center;">
				${listPagingData.pagingString}
			</div>
		</div>
	</section>
	<!-- 자세히보기 모달 -->
	<div class="modal fade" id="basic_modal" data-backdrop="static">
   		<div class="modal-dialog" style="width: 900px; display: table;" >
   			<div class="modal-content">
   				<div class="modal-header ">
   					<button class="close" data-dismiss="modal"><span>&times;</span></button>
   					<h2 class="modal-title text-center"><p id="P_TITLE" style="font-size: 0.9em;"></p></h2>
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
	   							<a href="javascript:"><span class="fa fa-heart-o" id ="P_LIKECOUNT" style="color: black; font-size: 20px;"></span></a>&nbsp;&nbsp;
	   							<span class="textSpan fa fa-comment-o" style="color: black; font-size: 20px;" id ="P_COMMENTCOUNT"></span><br/>
	   							<span id="NICKNAME"></span><br/><span id="P_CONTENT"></span><br/>
	   							<input type="hidden" name="P_NO" id="P_NO" /> 
   							</div>
   						</div>
	        			<!-- 댓글 리스트 -->					
						<div class="col-md-5" style="padding-right: 40px;">
							
							<div class="text-left" style="padding: 0">​
								<!-- 한줄 코멘트 입력 폼-->
								<div style="height: 300px; margin: 0; overflow-y: scroll;" id="memoDiv">
									<ul class="listUl" >
									</ul>
								</div>
				            	<!-- 댓글 입력창 -->
		   						<div class="input-group" style="text-align: center;" >
					          		 <input type="text" id="input"class="form-control textInput" style="color: black; margin-top: 10px;">
						          	 <span class="input-group-btn">
						         	   	<button class="showBtn btn btn-default" type="button" style="color:#050099; height: 38px;">게시</button>
						         	 </span>
			        			</div>
							</div>
						</div>
					</div>
   				</div>
   				<div class="modal-footer1" style="text-align: center;">
   					<span class ="modalset"></span>
   					<!-- 
   					<button class="btn btn-info" id="btnreport" data-backdrop="static" data-keyboard="true">신고하기</button>
   					 -->
   					<button class="btn btn-info" data-dismiss="modal">닫기</button>
   				</div>
   			</div>    		
   		</div>    	
   	</div>
	<!-- 신고모달 -->
	<div class="modal fade" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header text-center">
					<a class="glyphicon glyphicon-alert" href="#" >게시물 신고 페이지</a>
				</div>
				<!-- body -->
				<div class="modal-body text-center">
					<form>
						<input type="hidden" name="P_NO" id="ReportP_NO" /> 
			          <div class="form-group">
			          	<div style="text-align: left;">
			            	<label for="recipient-name" class="control-label" >신고 제목:</label><div id="message1" style="color: red;"></div>
			            </div>
			            <input type="text" class="form-control" id="P_R_TITLE" placeholder="제목을 입력하세요">
			          </div>
			          <div class="form-group">
			            <div style="text-align: left;">
			            	<label for="message-text" class="control-label" >신고 내용:</label><div id="message2" style="color: red;"></div>
			            </div>
			            <textarea class="form-control" id="P_R_COMMENT" placeholder="내용을 입력하세요"></textarea>
			          </div>
			        </form>
				</div>
				<div class="modal-footer" id="mfooter">
					<input class="btn btn-success" id="reportSubmit" type="button" value="신고 등록" />
					<a href="javascript:" class="btn btn-success" data-dismiss="modal">취소</a><br/>
				</div>
			</div>
		</div>
	</div>
	
	<div id="up" style="height:100px; width:35%; left:50%; top:10%; background-color: black; position: fixed; display: none; z-index: 10000000000000000000000;">
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
    
   <script>
	
   $('.btnView').on('click',function(){
	   	console.log("pNo : "+this.id.split('Q')[1]);
	   	var pNo = this.id.split('Q')[1];
	   	var pId = "${sessionScope.id}";
	   	$('#P_NO').val(pNo);	
	   	console.log(pNo);
	   	//appen 다 비워주기
	   	$('.modalset').html("");
	   	$(".listUl").html("");
	   	$('#viewImages').html("");
	   	$.ajax({
			url:"<c:url value="/Community/Photo/SelectOneView.do" />",//요청할 서버의 URL 주소
			type:"post",//데이터 전송방식(디폴트는 get방식)
			dataType:'json',//서버로부터 받을 응답 데이터의 형식 설정
			data:
				{
					p_no:pNo
				},
			success:function(data){//서버로부터 정상적인 응답(200)을 받았을 때 호출되는 콜백함수
				console.log(data);
				//이미지 캐러셀
				var images=(data.P_IMAGES).split("/")
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
				$('#P_NO').val(data.P_NO);
				$('#P_TITLE').html(data.P_TITLE);
				$('#P_CONTENT').html(data.P_CONTENT);
				$('#NICKNAME').html(data.NICKNAME);
				$('#P_LIKECOUNT').html(" "+data.P_LIKECOUNT);
				$('#P_COMMENTCOUNT').html(" "+data.P_COMMENTCOUNT);
				
				//삭제 수정 추가
				if(data.ID == pId){
					$('.modalset').append('<a href="javascript:isDelete();" class="btn btn-success">삭제</a>')
					$('.modalset').append('<a href="javascript:isUpdate();" class="btn btn-success">수정</a>')
				} 
				
				//좋아요 체크 
				var check = data.check;
				console.log("check::::::"+check);
				if(check == 1){
					$('#P_LIKECOUNT').removeClass("fa fa-heart-o")
		             .addClass("fa fa-heart")
		             .css("color", "red");
				}
				else{
					$('#P_LIKECOUNT').removeClass("fa fa-heart")
		             .addClass("fa fa-heart-o")
		             .css("color", "black");
				}
				
				//댓글 체크
				$.ajax({
					url:"<c:url value="/Community/Photo/SelectOneView2.do" />",//요청할 서버의 URL 주소
					type:"post",//데이터 전송방식(디폴트는 get방식)
					dataType:'json',//서버로부터 받을 응답 데이터의 형식 설정
					data:
						{
							p_no:pNo
						},
					success:function(data){//서버로부터 정상적인 응답(200)을 받았을 때 호출되는 콜백함수
						console.log("commentlist : "+data);
						console.log(data.length);
						var comment = data;
						if(data.length == 0){
							$(".listUl").html("<span id='defaultComment'>등록된 댓글이 없어요.</span>")
						}
						else{
							for(var i = 0; i<data.length ; i++){
								if(data[i].ID == pId){
									$(".listUl").append('<div><li class="comment" id="comment'+data[i].P_C_NO+'"><strong>'+data[i].NICKNAME+'</strong>&nbsp;'+data[i].P_COMMENT+'<div style="text-align:right;"><button class="p_commentdelete" type="button" id="delete'+data[i].P_C_NO+'" style="border:none;font-size:0.2em;">삭제</button></div></li></div>');
				
								}
								else{
									$(".listUl").append('<div><li class="comment" id="comment'+data[i].P_C_NO+'"><strong>'+data[i].NICKNAME+'</strong>&nbsp;'+data[i].P_COMMENT+'</li></div>');
								}
							}/////////for
						}///////////else
					}/////////succes
				});////////////////ajax		 
				$('#basic_modal').modal('show');
				
			},////////////success
			error: function(error){//서버로부터 비정상적인 응답을 받았을 때 호출되는 콜백함수
			}
		});
   });
    
	//댓글 쓰면 li요소에 출력
	 $(".showBtn").click(function(){
		var pNo = $('#P_NO').val();
		var content = $('#input').val();
			var inputMsg = $(this).parent().parent().find(".textInput").val()
			//ajax로 요청]			
			$.ajax({
			    url: "<c:url value="/Community/Photo/P_C_Write.do"/>",
				data: {
					p_no:pNo,
					p_comment:content
				},
				dataType:"text",
				type:"post",
				success:function(data){//댓글 입력 성공 
					console.log("서버로부터 받은 데이타:"+data);
					var nickname = data.split('&')[0];
					var no =  data.split('&')[1];
					var commentCount =  data.split('&')[2];
					$('.listUl').append('<div><li class="comment" id="comment'+no+'"><strong>'+nickname+'</strong>&nbsp;'+content+'<div style="text-align:right;"><button class="p_commentdelete" type="button" id="delete'+no+'"style="border:none;font-size:0.2em;">삭제</button></div></li></div>');
					$('#input').val("");
					$('#defaultComment').html('');
					//입력시 끝
					$("#P_COMMENTCOUNT").html("&nbsp;"+commentCount);
					$("#maincomment"+pNo).html("&nbsp;"+commentCount);
					$("#memoDiv").scrollTop($("#memoDiv")[0].scrollHeight);
				}				
			});
			
		}); 
		//댓글 삭제 클릭시 삭제처리하기
		$(document).on('click','.p_commentdelete',function(){
			
			if(confirm("정말로 삭제하시겠습니까?")){
				var p_c_no2 = this.id.split('e')[3];
				var p_no2 = $('#P_NO').val();
					//ajax로 요청]			
					$.ajax({
					    url: "<c:url value="/Community/Photo/P_C_Delete.do"/>",
						data: {
							p_c_no : p_c_no2,
							p_no : p_no2
						},
						dataType:"text",
						type:"post",
						success:function(data){//댓글 입력 성공 
							console.log("서버로부터 받은 데이타:"+data);
							//입력시 끝
							$('#comment'+p_c_no2).remove();
							$("#P_COMMENTCOUNT").html("&nbsp;"+data);
							$("#maincomment"+p_no2).html("&nbsp;"+data);
						}				
					});			
			}
		});      
	
   //모달 속 좋아요
	$("#P_LIKECOUNT").click(function(){
		var pNo = $('#P_NO').val();
		console.log("@@@@@@@@@@@@@@ P_NO : "+pNo);
         console.log($(this).css('color'));
         if($(this).css('color')=='rgb(0, 0, 0)'){
        	 $(this)
        	 .removeClass("fa fa-heart-o")
             .addClass("fa fa-heart")
             .css("color", "red");
             
        	 $.ajax({
                 url: "<c:url value="/Community/Photo/P_LikeInsert.do"/>",
                     type: "post",
                     dataType:"json",
                     data: {
                         p_no: pNo
                     },
                     success: function (data) {
                   	  console.log("pNo");
                      $("#like"+pNo).removeClass("fa fa-heart-o").addClass("fa fa-heart").css("color", "red");
                      $("#like"+pNo).html("&nbsp;"+data);
                      $("#P_LIKECOUNT").html("&nbsp;"+data);
                      console.log(data);
                     }
              });
         }
         else{
        	 $(this)
             .removeClass("fa fa-heart")
             .addClass("fa fa-heart-o")
             .css("color", "black");
        	 
        	  $.ajax({
                  url: "<c:url value="/Community/Photo/P_LikeDelete.do"/>",
                      type: "post",
                      dataType:"json",
                      data: {
                          p_no: pNo
                      },
                      success: function (data) {
                       $("#like"+pNo).removeClass("fa fa-heart").addClass("fa fa-heart-o").css("color", "black");
                       $("#like"+pNo).html("&nbsp;"+data);
                       $("#P_LIKECOUNT").html("&nbsp;"+data);
                      }
               })////////ajax
         }
      }); 
   
	  //좋아요 체크 시작         
      //하트 버튼 및 북마트 버튼 판단 변수   
      //하트 버튼 작동 및 좋아요 카운트
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
		
     // ...버튼 누를 시 나오는 모달이 새로고침시에 나오지 않게 하기.
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

   	//신고
   	 $('#btnreport').on('click',function(){
   		var pNo = $('#P_NO').val();
		console.log("report P_NO1 : "+pNo);
       	$("#myModal").modal('show');
       	$('#ReportP_NO').val(pNo);
       	
   	 });
   	
   	 $('#reportSubmit').on('click',function(){
		var pNo = 	$('#ReportP_NO').val();
		console.log("report P_NO2 : "+pNo);
   		 var prtitle=$("#P_R_TITLE").val();
   		 console.log(prtitle);
   		 var prcomment=$("#P_R_COMMENT").val();
   		 console.log(prcomment);
   		 if(prtitle==""){
   			 $("#message1").html("신고 제목을 작성해주세요");
   			 return;
   		 }
   		 $("#message1").html("");
   		 if(prcomment==""){
   			 $("#message2").html("신고 내용을 작성해주세요");
   			 return;
   		 }
   		 $("#message2").html("");
   		 
   		 $.ajax({
   				url:"<c:url value="/Community/Photo/P_ReportInsert.do"/>", // 서버에 전달할 파일명
   				dataType: 'text',
   				type: 'post',
   				data: {
   					p_no : pNo,
   					p_r_title: prtitle,
   					p_r_content : prcomment
   				},
   				success: function() {
   				     alert('Success'); // 성공시 코드
   				}
   			});
   		 
   		$('#myModal').modal('hide');
   		$('#btnreportFinish').css('display', '');
   		$('#btnreport').css('display','none');
   	 });
   	 
  	//삭제확인 메소드
	function isDelete(){
		var pNo = $('#P_NO').val();
		console.log("delete 값 "+pNo)
      	if(confirm("정말로 삭제 하시겠습니까?")){
      		 $.ajax({
    				url:"<c:url value="/Community/Photo/P_Delete.do"/>", // 서버에 전달할 파일명
    				dataType: 'text',
    				type: 'post',
    				data: {
    					p_no : pNo,
    				},
    				success: function() {
    				     alert('Success'); // 성공시 코드
    				     $('#basic_modal').modal('hide');
    				     $('#P_list'+pNo).remove();
    				}
    			});
      	}
    }///////////
   </script>
</body>
</html>

    