<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    	<script>
	$( "#dialog" ).dialog({
		position: { my: "left top", at: "right bottom", of: "#fixedNavbar" },
		draggable: false,
		maxHeight: 30,
		autoOpen: false,
		show: {
		  effect: "blind",
		  duration: 500
		},
		hide: {
		  effect: "blind",
		  duration: 500
		}
    });
	//웹소켓 객체 저장용
	var wsocket;
	var doingViewflag = true;
	var mapNotice;
	$(window).bind("load", function (){
		wsocket = new WebSocket("ws://localhost:9090<c:url value='/chat-ws.do'/>");
		wsocket.addEventListener("message",recevieMessage);
		wsocket.onerror=function(e){console.log('에러발생:',e)}
	});
	var recevieMessage = function(e){
		if(e.data.split('&')[0] == '${sessionScope.id}getNewMessage'){
		    $('#ui-id-1').html("새로운 채팅입니다.")
		    //data+'getNewMessage&${sessionScope.id}&${param.t_no}&${param.care_no}&'+message
			$('#dialogMessage').html('<a href="<c:url value="/Chat/ChatView.do?care_no='+e.data.split('&')[3]+'&t_no='+e.data.split('&')[2]+'"/>">'+e.data.split('&')[4]+'</a>');

		    $.ajax({
				url:"<c:url value="/Member/SelectOneMember.do" />",//요청할 서버의 URL 주소
				type:"post",//데이터 전송방식(디폴트는 get방식)
				dataType:'json',//서버로부터 받을 응답 데이터의 형식 설정
				data:
					{
						id:e.data.split('&')[1]
					},
				success:function(data){
					console.log(data);
					$('#dialogImage').html('<img src="<c:url value="/upload/'+data.PIC_NAME+'"/>">');
					$('#dialogNickname').html(data.NICKNAME);
										$("#dialog").dialog( "open" );
					setTimeout(function() {
						$( "#dialog" ).dialog( "close" );
					}, 5000);
				}
			});
		}
		else if($('#checkDoingView').val()=='Yes'  && e.data.split('&')[0] == '${sessionScope.id}${record.care_no}locationStart'){
			if(doingViewflag){
				$('#mapStop').css('display', 'none');
		   		$('#map').css('display', '');
				var mapContainer = document.getElementById('map'),
			    mapOption = {
			        center: new kakao.maps.LatLng(e.data.split('&')[1], e.data.split('&')[2]),
			        level: 3
			    };	
				mapNotice = new kakao.maps.Map(mapContainer, mapOption); 
				doingViewflag = false;
			}
			var locPosition = new kakao.maps.LatLng(e.data.split('&')[1], e.data.split('&')[2]);
	        displayMarker2(locPosition); 
			function displayMarker2(locPosition) {
			    var marker = new kakao.maps.Marker({  
			        map: mapNotice, 
			        position: locPosition
			    }); 
			    mapNotice.setCenter(locPosition);      
			}
		}
		else if($('#checkDoingView').val()=='Yes' && e.data.split('&')[0] == '${sessionScope.id}${record.care_no}locationStop'){
			$('#mapStop').css('display', '');
			$('#map').css('display', 'none');
			doingViewflag = true;
		}
	};
	</script>