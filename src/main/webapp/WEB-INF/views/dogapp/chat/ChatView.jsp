<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<title>강아지를 부탁해</title>
<style>
	#trainerInfo:hover{
		font-weight: bold;
		text-decoration: underline;
	}
	.checked {
  		color: orange;
	}
	.read {
		background-color: white;
		color: orange;
		font-weight: bold;
		font-size: 0.8em;
	    width: 1.6em;
	    border-radius: 50%;
	    padding: .1em  .1em;
	    line-height: 1.5em;
	    display: inline-block;
	    text-align: center;
	}
</style>

</head>
<body>
	<jsp:include page="/WEB-INF/views/templates/Top.jsp"/>
	<section id="services" class="section" style="padding-top:200px ; height: 400px ;background-image: url('<c:url value="/resources/img/background/dogwithwoman.jpg"/>');">
      <div class="container" >
        <div class="section-header">          
          <h2 class="section-title wow fadeIn" data-wow-duration="1000ms" data-wow-delay="0.3s">채팅 <span>채팅방</span></h2>
          <hr class="lines wow zoomIn" data-wow-delay="0.3s">
        </div>
      </div>
    </section>
	<div class="container">
		<div id="stateMessage">
			<c:if test="${record.care_state == 1 }">
				<hr/>
			</c:if>
			<c:if test="${record.care_state == 2 }">
				<hr/>
					<p style="text-align: center;">거래가 확정된 게시글입니다.</p>
				<hr/>
			</c:if>
			<c:if test="${record.care_state == 3 }">
				<hr/>
					<p style="text-align: center;">거래가 종료된 게시글입니다.</p>
				<hr/>
			</c:if>
		</div>
		<div class="messaging">
				<div class="row">
				<div class="col-md-5 hidden-xs" >
				<div class="inbox_people" style="width: 100%;">
					<div class="headind_srch">
						<div class="recent_heading">
							<p>
								<c:if test="${cnoPerson.ID == sessionScope.id}" var="idCheck">
									<a class="trainerInfo" style="font-size:2em; color:black; cursor: pointer;">${tnoPerson.NICKNAME }</a>
								</c:if>
								<c:if test="${not idCheck }">
									<a style="font-size:2em; color:black;">${cnoPerson.NICKNAME }</a>
								</c:if>
							</p>
							<a href='<c:url value="/Chat/ChatMain.do"/>'>대화목록</a>
							
						</div>
					</div>
					<div class="inbox_chat">
						<div>
							<div class="col-md-12">
								<table class="table table-bordered table-striped">
									<tr>
										<th colspan="2" style="text-align: center;">
											<img style="width: 150px; height: 150px;" src="<c:url value="/upload/${care_images[0] }"/>" >
										</th>
									</tr>
									<tr>
										<th class="col-md-2 text-center">번호</th>
										<td>${record.care_no}</td>
									</tr>
									<tr>
										<th class="text-center">제목</th>
										<td>${record.care_title}</td>
									</tr>
									<tr>
										<th class="text-center">작성자</th>
										<td>${record.name}</td>
									</tr>
									<tr>
										<th class="text-center">등록일</th>
										<td>${record.care_postdate}</td>
									</tr>
									<tr>
										<th class="text-center">일시</th>
										<td>${record.care_datepicker}, ${record.care_timepicker}</td>
									</tr>
									<tr>
										<th class="text-center">장소</th>
										<td>${record.care_clickLineA}</td>
									</tr>
									<tr>
										<th class="text-center">가격</th>
										<td>${record.care_price}원</td>
									</tr>
									<tr>
										<th class="text-center" colspan="2">내용</th>
									</tr>
									<tr>
										<td colspan="2">${record.care_content}</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
				</div>
				<div class="visible-xs" >
					<div class="inbox_people" style="width: 100%; height: 200px">
						<div class="headind_srch">
							<div class="recent_heading">
								<p>
									<c:if test="${cnoPerson.ID == sessionScope.id}" var="idCheck">
										<a class="trainerInfo" style="font-size:2em; color:black; cursor: pointer;">${tnoPerson.NICKNAME }</a>
									</c:if>
									<c:if test="${not idCheck }">
										<a style="font-size:2em; color:black;">${cnoPerson.NICKNAME }</a>
									</c:if>
								</p>
								<a href='<c:url value="/Chat/ChatMain.do"/>'>대화목록</a>
								
							</div>
						</div>
						<div class="inbox_chat">
							<div>
								<div class="col-md-12">
									<table class="table table-bordered table-striped">
										<tr>
											<th rowspan="4" style="text-align: center;">
												<img style="width: 100px; height: 100px;" src="<c:url value="/upload/${care_images[0] }"/>" >
											</th>
										</tr>
										<tr>
										<th class="text-center">일시</th>
										<td>${record.care_datepicker}, ${record.care_timepicker}</td>
										</tr>
										<tr>
											<th class="text-center">장소</th>
											<td>${record.care_clickLineA}</td>
										</tr>
										<tr> 
											<th class="text-center">가격</th>
											<td>${record.care_price}원</td>
										</tr>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-7">
				<div class="mesgs" style="width: 100%;">
					<div class="msg_history" id="chatMessage">
						<c:forEach items="${list }" var="chat">
							<c:if test="${chat.FROM_ID == sessionScope.id}" var="flag">
								<div class="outgoing_msg" style="margin: 0;">
									<div class="sent_msg">
										<p>${chat.CHAT_CONTENT }&nbsp;&nbsp;&nbsp;<c:if test="${chat.READ_ != 0}"><span class="read">${chat.READ_ }</span></c:if></p>
										<span class="time_date"><fmt:formatDate value="${chat.CHAT_POSTDATE }" pattern="yyyy-MM-dd HH:mm:SS"/></span>
									</div>
								</div>
							</c:if>
							<c:if test="${!flag }">
								<div class="incoming_msg">
									<div class="incoming_msg_img">
										<c:if test="${idCheck }">
											<img src="<c:url value="/upload/${tnoPerson.T_PHOTO }"/>">
										</c:if>
										<c:if test="${!idCheck }">
											<img src="<c:url value="/upload/${cnoPerson.PIC_NAME }"/>">
										</c:if>
									</div>
									<div class="received_msg">
										<div class="received_withd_msg">
											<p>${chat.CHAT_CONTENT }</p>
											<span class="time_date"><fmt:formatDate value="${chat.CHAT_POSTDATE }" pattern="yyyy-MM-dd HH:mm:SS"/></span>
										</div>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</div>
					<div class="type_msg">
						<div class="input_msg_write">
							<input type="text" class="write_msg" placeholder="메세지를 입력하세요" id="message" />
							<input type="hidden" id="t_no" value="${param.t_no }"/>
							<input type="hidden" id="care_no" value="${param.care_no }"/>
							<button class="msg_send_btn" type="button" id="sendBtn">
								<i class="fa fa-paper-plane-o" aria-hidden="true"></i>
							</button>
						</div>
					</div>
				</div>
				</div>
				</div>
			</div>
			<c:if test="${sessionScope.id == record.id }">
				<div style="text-align: center;">
					<c:if test="${record.care_state == 1 }">
						<button class="btn btn-common" id="confirmBtn">확정</button>
					</c:if>
					<c:if test="${record.care_state == 2 }">
						<button class="btn btn-common" id="confirmBtn">취소</button>
					</c:if>
					<c:if test="${record.care_state == 3 }">
						<button class="btn btn-success" disabled="disabled">종료</button>
					</c:if>
						
					<c:if test="${!stateCheck }">
						
					</c:if>
				</div>
			</c:if>
			
		</div>
	<!-- 실제 내용 끝 -->
	<div class="modal  fade" id="trinaerInfoModal" >
   		<div class="modal-dialog ">
   			<div class="modal-content" style="padding: 20px;">
   				<div class="modal-header">
   					<button class="close" data-dismiss="modal"><span>&times;</span></button>
   					<p class="modal-title" style="text-align: center; font-size: 1em;">돌보미 정보</p>
   				</div>
   				<div class="modal-body" style="padding-left: 10px;">
   					<section id="blog" class="section" style="padding: 0">

		<div class="row">
			<div class="col-md-12">
				<table class="table table-bordered table-striped">
					<tr>
						<th colspan="2" style="text-align: center;">
							<span class="lnr lnr-chevron-left" id="prevImage" style="height: 150px; cursor: pointer;"></span>
							<c:forEach items="${trainer_images }" var="image" varStatus="loop">
								<img style="width: 150px; height: 150px; display: none;" src="<c:url value="/upload/${image }"/>" id="image${loop.index }" class="image" >
							</c:forEach>
							<span class="lnr lnr-chevron-right" id="nextImage" style="height: 150px; cursor: pointer;"></span>
						</th>
					</tr>
					<tr>
						<th class="col-md-2 text-center">닉네임</th>
						<td>${trainer.NICKNAME }</td>
					</tr>
					<tr>
						<th class="col-md-2 text-center">인사말</th>
						<td>${trainer.T_TITLE }</td>
					</tr>
					<tr>
						<th class="text-center">자기소개</th>
						<td>${trainer.T_CONTENT }</td>
					</tr>
					<tr>
						<th class="text-center">서비스</th>
						<td>${reviewList.size() }회</td>
					</tr>
					<tr>
						<th class="text-center">별점</th>
						<td>
							<c:if test="${avgOfRate >= 1 && avgOfRate < 2 }">
								<i class="fa fa-star checked"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>
							</c:if>
							<c:if test="${avgOfRate >= 2 && avgOfRate < 3 }">
								<i class="fa fa-star checked"></i><i class="fa fa-star checked"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>
							</c:if>
							<c:if test="${avgOfRate >= 3 && avgOfRate < 4 }">
								<i class="fa fa-star checked"></i><i class="fa fa-star checked"></i><i class="fa fa-star checked"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>
							</c:if>
							<c:if test="${avgOfRate >= 4 && avgOfRate < 5 }">
								<i class="fa fa-star checked"></i><i class="fa fa-star checked"></i><i class="fa fa-star checked"></i><i class="fa fa-star checked"></i><i class="fa fa-star"></i>
							</c:if>
							<c:if test="${avgOfRate == 5 }">
								<i class="fa fa-star checked"></i><i class="fa fa-star checked"></i><i class="fa fa-star checked"></i><i class="fa fa-star checked"></i><i class="fa fa-star checked"></i>
							</c:if>
							<c:if test="${reviewList.size() != 0}">
								(<fmt:formatNumber value="${avgOfRate }" pattern="0.#"/>점)
							</c:if>
							<c:if test="${reviewList.size() == 0}">
								후기가 없습니다
							</c:if>
						</td>
					</tr>
					<tr>
						<th class="text-center" colspan="2">최근 후기</th>
					</tr>
				</table>
				<section id="portfolios" class="section" style="padding: 0;" >
			      <!-- Container Starts -->
			      <div class="container" style="width:100%; padding: 10px;">
			        <div class="row">          
			          <div class="col-md-12">
			            <!-- Portfolio Recent Projects -->
			            
			            <div id="portfolio" class="row wow fadeInUp" data-wow-delay="0.1s">
			              <c:if test="${empty reviewList }">
			              	<div class="col-md-12" style="margin: 10px; text-align: center;">
			              		<span>등록된 후기가 없습니다.</span>
			              	</div>
			              </c:if>
			              <c:forEach items="${reviewList }" var="item" varStatus="loop" >
			              	<c:if test="${loop.index < 4}">
							<div class="col-sm-6 col-md-6 col-lg-6 col-xl-6" style="margin-bottom: 10px;">
								<div class="portfolio-item">
									<div class="shot-item" style="font-size: 1.2em; padding: 20px;">
										<img src="<c:url value="/upload/${item.PIC_NAME }"/>" style="width: 10%; margin: 10px;"/>
										<span style="margin-right: 30px;">${item.NICKNAME }</span><br/><span style="font-size: 0.8em"><fmt:formatDate value="${item.T_R_POSTDATE }" pattern="yyyy-MM-dd"/></span>
										<p>
											<c:if test="${item.TRAINER_RATE == 1 }">
												<i class="fa fa-star checked"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>
											</c:if>
											<c:if test="${item.TRAINER_RATE == 2 }">
												<i class="fa fa-star checked"></i><i class="fa fa-star checked"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>
											</c:if>
											<c:if test="${item.TRAINER_RATE == 3 }">
												<i class="fa fa-star checked"></i><i class="fa fa-star checked"></i><i class="fa fa-star checked"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>
											</c:if>
											<c:if test="${item.TRAINER_RATE == 4 }">
												<i class="fa fa-star checked"></i><i class="fa fa-star checked"></i><i class="fa fa-star checked"></i><i class="fa fa-star checked"></i><i class="fa fa-star"></i>
											</c:if>
											<c:if test="${item.TRAINER_RATE == 5 }">
												<i class="fa fa-star checked"></i><i class="fa fa-star checked"></i><i class="fa fa-star checked"></i><i class="fa fa-star checked"></i><i class="fa fa-star checked"></i>
											</c:if>
										</p>
										<p>${item.T_R_CONTENT }</p>
									</div>               
								</div>
							</div>
			              	</c:if>
			              </c:forEach>
			            </div>
			          </div>
			        </div>
			      </div>
			      <!-- Container Ends -->
			    </section>
			</div>
		</div>
    </section>
   				</div>
   			</div>    		
   		</div>    	
   	</div>
	<!--  푸터 시작 -->
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
    <script src='<c:url value="/resources/lib/main.js"/>'></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<!-- 푸터 끝 -->
	<script>
	$(function(){
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
		$('.trainerInfo').click(function(){
			
			$('#trinaerInfoModal').modal('show');

    	});
    });	
	
	
		//웹소켓 객체 저장용
		var wsocket;
		//닉 네임 저장용
		var nickname;
		//상대 입장 중
		var connectFlag = false;
		var connectReturnFlag = false;
		//입장시 - 서버와 연결된 웹소켓 클라이언트 생성

		$(window).bind("load", function (){
			wsocket = new WebSocket("ws://localhost:9090<c:url value="/chat-ws.do"/>");
			$("#chatMessage").scrollTop($("#chatMessage")[0].scrollHeight);
			wsocket.onopen = open;
			wsocket.addEventListener("message",recevieMessage);
			wsocket.onerror=function(e){console.log('에러발생:',e)}
		});
		var open = function(){
			wsocket.send('t${param.t_no}c${param.care_no}connected');
		}																					
		$(window).bind("beforeunload", function (){
			close();
		});
		var close = function(){
			wsocket.send('t${param.t_no}c${param.care_no}disconnected');
		}
		//전송버튼 클릭시
		$('#sendBtn').click(function(){
			if($('#message').val().trim()!="")
			sendMessage();
		});
		//메시지 입력 후 전송 버튼 클릭이 아닌 엔터키 처리
		$('#message').on('keypress',function(e){
			var keyCode = e.keyCode ? e.keyCode : e.which;
			if(keyCode==13 && $('#message').val().trim()!=""){//엔터 입력
				sendMessage();
			}
				
		});
		//메시지를 DIV태그에 뿌져주기 위한 함수
		var appendMessage = function(msg){
			$('#chatMessage').append(msg);
			//스크롤 맨 아래로 내리기
			$("#chatMessage").scrollTop($("#chatMessage")[0].scrollHeight);
		};
		//서버에서 메시지를 받을 때마다 호출되는 함수
		var recevieMessage = function(e){//e는 message이벤트 객체
			//서버로부터 받은 데이터는 이벤트 객체(e).data속성에 저장되어 있다.
			if(e.data.split("&")[0] == 't${param.t_no}'+'c${param.care_no}'){
				var today = new Date();

				var year = today.getFullYear();
				var month = ('0' + (today.getMonth() + 1)).slice(-2);
				var day = ('0' + today.getDate()).slice(-2);
				var dateString = year + '-' + month  + '-' + day;
				
				var hours = ('0' + today.getHours()).slice(-2); 
				var minutes = ('0' + today.getMinutes()).slice(-2);
				var seconds = ('0' + today.getSeconds()).slice(-2); 
				var timeString = hours + ':' + minutes  + ':' + seconds;
				
				var dateTimeString = dateString +' '+timeString
				appendMessage("<div class='incoming_msg'><div class='incoming_msg_img'><c:if test='${idCheck }'><img src='<c:url value='/upload/${tnoPerson.T_PHOTO }'/>'></c:if><c:if test='${!idCheck }'><img src='<c:url value='/upload/${cnoPerson.PIC_NAME }'/>'></c:if></div><div class='received_msg'><div class='received_withd_msg'><p>"+e.data.split("&")[1]+"</p><span class='time_date'>"+dateTimeString+"</span></div></div></div>");//서버로부터 받은 메시지를 msg:부분을 제외하고 div에 출력
			}
			else if(e.data == 't${param.t_no}c${param.care_no}connected'){
				console.log('connected');
				$.ajax({
					url:"<c:url value="/Chat/ChatUpdateRead.do" />",//요청할 서버의 URL 주소
					type:"post",//데이터 전송방식(디폴트는 get방식)
					dataType:'text',//서버로부터 받을 응답 데이터의 형식 설정
					data:
						{
							t_no:$('#t_no').val(),
							care_no:$('#care_no').val()
						},
					success:function(data){//서버로부터 정상적인 응답(200)을 받았을 때 호출되는 콜백함수
						console.log('입력성공');
						$('.read').remove();
						connectFlag = true;
					},
					error: function(error){}
				});
				if(!connectReturnFlag){
					connectReturnFlag = true;
					open();	
				}
			}
			else if(e.data == 't${param.t_no}c${param.care_no}disconnected'){
				console.log('disconnected');
				connectFlag = false;
				connectReturnFlag = false;
			}
		};
		//서버로 메시지 전송하는 함수
		function sendMessage(){
			//서버로 메시지 전송
			var message = $('#message').val();
			wsocket.send('t${param.t_no}'+'c${param.care_no}'+'&'+$('#message').val());
			$.ajax({
				url:"<c:url value="/Chat/Chat.do" />",//요청할 서버의 URL 주소
				type:"post",//데이터 전송방식(디폴트는 get방식)
				dataType:'text',//서버로부터 받을 응답 데이터의 형식 설정
				data:
					{
						read:connectFlag,
						chat_content:$('#message').val(),
						t_no:$('#t_no').val(),
						care_no:$('#care_no').val()
					},
				success:function(data){//서버로부터 정상적인 응답(200)을 받았을 때 호출되는 콜백함수
					console.log('입력성공');
					wsocket.send(data+'getNewMessage&${sessionScope.id}&${param.t_no}&${param.care_no}&'+message);
				},
				error: function(error){//서버로부터 비정상적인 응답을 받았을 때 호출되는 콜백함수
					console.log('%O:',error);
					console.log('에러:',error.responseText);
				}
			});
				var today = new Date();

				var year = today.getFullYear();
				var month = ('0' + (today.getMonth() + 1)).slice(-2);
				var day = ('0' + today.getDate()).slice(-2);
				var dateString = year + '-' + month  + '-' + day;
				
				var hours = ('0' + today.getHours()).slice(-2); 
				var minutes = ('0' + today.getMinutes()).slice(-2);
				var seconds = ('0' + today.getSeconds()).slice(-2); 
				var timeString = hours + ':' + minutes  + ':' + seconds;
				
				var dateTimeString = dateString +' '+timeString
			//DIV(대화영역)에 메시지 출력
			if(connectFlag){
				appendMessage("<div class='outgoing_msg' style='margin: 0;'><div class='sent_msg'><p>"+$('#message').val()+"</p><span class='time_date'>"+dateTimeString+"</span></div></div>");	
			}
			else{
				appendMessage("<div class='outgoing_msg' style='margin: 0;'><div class='sent_msg'><p>"+$('#message').val()+"&nbsp;&nbsp;&nbsp;<span class='read'>1</span></p><span class='time_date'>"+dateTimeString+"</span></div></div>");
			}
			//기존 메시지 클리어
			$('#message').val("");
			//포커스 주기
			$('#message').focus();
		}
		$('#confirmBtn').click(function(){
			if($(this).html()=='확정'){
				if(confirm("확정 하시겠습니까?")){
					$('#confirmBtn').html('취소');
				}
				$.ajax({
					url:"<c:url value="/Chat/ChatStateChange.do" />",//요청할 서버의 URL 주소
					type:"post",//데이터 전송방식(디폴트는 get방식)
					dataType:'text',//서버로부터 받을 응답 데이터의 형식 설정
					data:
						{
							care_state:2,
							t_no:$('#t_no').val(),
							care_no:$('#care_no').val()
						},
					success:function(data){
						$('#stateMessage').html("<hr/><p style='text-align: center;'>거래가 확정된 게시글입니다.</p><hr/>");
					},
					error: function(error){}
				});
			}
			else{
				if(confirm("취소 하시겠습니까?")){
					$('#confirmBtn').html('확정');
				}
				$.ajax({
					url:"<c:url value="/Chat/ChatStateChange.do" />",//요청할 서버의 URL 주소
					type:"post",//데이터 전송방식(디폴트는 get방식)
					dataType:'text',//서버로부터 받을 응답 데이터의 형식 설정
					data:
						{
							care_state:1,
							t_no:0,
							care_no:$('#care_no').val()
						},
					success:function(data){
						$('#stateMessage').html("<hr/>");
					},
					error: function(error){}
				});
			}
		});

	</script>
</body>
</html>