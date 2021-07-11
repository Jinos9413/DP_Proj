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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="<c:url value="/resources/css/chat.css"/>">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
	
	<div>
		<div class="messaging">
				<div class="col-md-12">
				<div class="mesgs" style="width: 100%;">
					<div class="msg_history" id="chatMessage" style="padding-bottom: 50px;">
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
					
				</div>
				</div>
				</div>
			</div>
<nav class="navbar navbar-default navbar-fixed-bottom" style="background-color: white" id="fixedNavbar">	
	<div class="container-fluid">
		<div class="navbar-header">
			<div class="type_msg" style="width: 100%; background-color: white;">
				<div class="input_msg_write" >
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
</nav>
			

    

    <!-- jQuery first, then Tether, then Bootstrap JS. -->
    <script src="<c:url value="/resources/js/jquery-min.js"/>"></script>
    <script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
	<!-- 푸터 끝 -->
	<script>

		//웹소켓 객체 저장용
		var wsocket;
		//닉 네임 저장용
		var nickname;
		//상대 입장 중
		var connectFlag = false;
		var connectReturnFlag = false;
		//입장시 - 서버와 연결된 웹소켓 클라이언트 생성

		$(window).bind("load", function (){
			wsocket = new WebSocket("ws://192.168.0.33:9090<c:url value="/chat-ws.do"/>");
			wsocket.onopen = open;
			wsocket.addEventListener("message",recevieMessage);
			wsocket.onerror=function(e){console.log('에러발생:',e)}
			$('#chatMessage').css('height',$(window).height());
			$("#chatMessage").scrollTop($("#chatMessage")[0].scrollHeight);
		});
		var open = function(){
			wsocket.send('t${param.t_no}c${param.care_no}connected');
		}																					
		$(window).bind("beforeunload", function (){
			wsocket.send('t${param.t_no}c${param.care_no}disconnected');
			wsocket.close();
		});
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