package com.dogcompany.dogapp.web;

import java.util.concurrent.TimeUnit;

import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.web.client.RestTemplate;

@Configuration
public class RestTemplateConfig {
	@Bean
	public RestTemplate restTemplate() {
		//커넥션 풀 사용을 위한 HttpClient객체 생성
		CloseableHttpClient httpClient = HttpClientBuilder.create()
				.setMaxConnTotal(50)
				.setMaxConnPerRoute(50)
				.setConnectionTimeToLive(5, TimeUnit.SECONDS)
				.build();
		//타임아웃 설정을 위한 객체 생성
		HttpComponentsClientHttpRequestFactory factory =
				new HttpComponentsClientHttpRequestFactory();
		factory.setConnectionRequestTimeout(3000);
		factory.setHttpClient(httpClient);//커넥션 풀을 사용
		
		return new RestTemplate(factory);
	}
}