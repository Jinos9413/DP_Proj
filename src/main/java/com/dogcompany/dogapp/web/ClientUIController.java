package com.dogcompany.dogapp.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;


import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.http.client.HttpComponentsAsyncClientHttpRequestFactory;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.client.AsyncRestTemplate;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import com.dogcompany.dogapp.service.AndroidDAO;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class ClientUIController {
	//스프링 서버에서 Rest한 방식으로 http 통신을 하기위한 API
	
	
	@Autowired
	private AndroidDAO dao;
	
	//사용자 UI처리용(제목 및 내용 입력 UI)
	@GetMapping("/message")
	public String message() {	
		
		return "PushMessageSend";
	}
	
	
	
	@PostMapping("/message")
	public String sendMessage(MessageDTO messages,Model model) throws IOException {
		//모든 토큰값 가져오기
		List<Map> tokens= dao.selectTokens();
		//각 토큰을 갖고 있는 스마트폰으로 푸쉬를 보내기위한 요청(파이어베이스로)
		int success=0;
		for(Map token:tokens) {
			for(Object tok:token.values()) {
				ResponseEntity<Map> responseEntity=requestToFCMServer(messages,tok.toString());
				ObjectMapper mapper = new ObjectMapper();
				Map responseMap=mapper.readValue(mapper.writeValueAsString(responseEntity.getBody()),Map.class);
				if(Integer.parseInt(responseMap.get("success").toString())==1)
					success++;
			}
		}
		model.addAttribute("success", success);
		return "PushMessageSend";
	}
	
	@Autowired
	private RestTemplate restTemplate;
	
	private ResponseEntity<Map> requestToFCMServer(MessageDTO messages,String token){
		//요청헤더 설정용 객체 생성
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json");
		headers.add("Authorization", "key=AAAA4lrOPEA:APA91bH4JqGpUBaKzdwXIR3hUm06mrigyUVIpyS49qKOVUSESsPrWLTYcRyHNM1XQO94gjL5mQZ5R6731eG6UAcSY950csktwUB2B5JKSQ8wToO8cIjjd76Q31MRvc_0atWquuBYj-uG");
		//요청 바디 설정용
		Map<String,Object> body = new HashMap<String, Object>();
		body.put("data",messages);
		body.put("to",token);
		//HttpEntity타입에 요청을 보낼 데이타와 헤더 설정
		HttpEntity entity = new HttpEntity(body,headers);	    
		//RestTemplate으로 요청 보내기
		String uri ="https://fcm.googleapis.com/fcm/send";
		//한글 포함시
		UriComponents uriComponents= UriComponentsBuilder.fromHttpUrl(uri).build();
		//RestTemplate객체로 요청 보내기
		return restTemplate.exchange(
				uriComponents.toString(),//요청 URI
				HttpMethod.POST,//요청 메소드
				entity,//HttpEntity(요청바디와 요청헤더)
				Map.class,//응답데이타 타입
				String.class//uriVariables the variables to expand in the template
				);		
	}////////////////////

	
	

}
