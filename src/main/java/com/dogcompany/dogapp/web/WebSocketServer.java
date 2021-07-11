package com.dogcompany.dogapp.web;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

//웹소켓 서버
public class WebSocketServer extends TextWebSocketHandler{
	
	//접속한 클라이언트를 저장하기 위한 속성(멤버변수)
	//키는 웹소켓 세션 아이디
	private Map<String,WebSocketSession> clients = new HashMap();
	
	//클라이언트와 연결이 되었을 때 호출되는 콜백 메소드
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		clients.put(session.getId(), session);
		
	}
	//클라이언트로부터 메시지를 받았을 때 자동으로 호출되는 콜백 메소드
	//여기서 클라이언트로 메시지도 보냄
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		//접속한 모든 클라이언트에게 session.getId()가 보낸 메시지 뿌려주기
		for(WebSocketSession client: clients.values()) {
			if(!session.getId().equals(client.getId()))//자기가 보낸 메시지를 다시 받지 않도록
				client.sendMessage(message);
		}
	}
	//클라이언트와 통신장애 시 자동으로 호출되는 메소드
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		System.out.println(session.getId()+"와 통신 장애 발생:"+exception.getMessage());
	}
	//클라이언트와 연결이 끊어졌을 때 호출되는 콜백 메소드
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		clients.remove(session.getId());
	}
	
}
