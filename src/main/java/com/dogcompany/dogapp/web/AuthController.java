package com.dogcompany.dogapp.web;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.dogcompany.dogapp.model.KakaoProfile;
import com.dogcompany.dogapp.model.NaverProfile;
import com.dogcompany.dogapp.model.OAuthToken;
import com.dogcompany.dogapp.service.MemberDAO;
import com.dogcompany.dogapp.service.MemberService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;


@Controller
@RequestMapping("/Auth/")
public class AuthController {

	@Autowired
	private ObjectMapper objMapper;
	
	@Autowired
	private MemberService service;
	
	//로그인 폼으로 이동
	@RequestMapping("Login.do")
	public String login() {
		return "dogapp/Login";
	}
	
	@RequestMapping("Join.do")
	public String join() {
		return "dogapp/Join";
	}
	
	@RequestMapping("Logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "dogapp/Home";
	}
	
	@RequestMapping(value = "KakaoLogin.do", produces = "application/json; charset=UTF-8;")
	public String kakaologin(String code) {
		RestTemplate rt = new RestTemplate();
		
		HttpHeaders header = new HttpHeaders();
		header.add("Content-type", "application/x-www-form-urlencoded; charset=UTF-8");
		
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		params.add("grant_type", "authorization_code");
		params.add("client_id", "b5d0c752539c43e76387f10c79ce3df8");
 		params.add("redirect_uri", "http://localhost:9090/dogapp/Auth/KakaoLogin.do");
 		params.add("code", code);
 		
 		HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest = 
 				new HttpEntity<>(params, header);
 		
 		ResponseEntity<String> response = rt.exchange(
 				"https://kauth.kakao.com/oauth/token",
 				HttpMethod.POST,
 				kakaoTokenRequest,
 				String.class
 		);
 		OAuthToken oauthToken = null;
 		try {
			oauthToken = objMapper.readValue(response.getBody(), OAuthToken.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
 		
 		return "forward:/Auth/KakaoLoginProcess.do?accessToken="+oauthToken.getAccess_token();
 		
	}
	
	@RequestMapping(value = "KakaoLoginProcess.do", produces = "application/json; charset=UTF-8;")
	public String kakaologinProcess(String accessToken, HttpSession session, Model model) {
		RestTemplate rt2 = new RestTemplate();
		
		HttpHeaders header2 = new HttpHeaders();
		header2.add("Authorization", "Bearer "+accessToken);
		header2.add("Content-type", "application/x-www-form-urlencoded;charset=UTF-8");
		 
 		HttpEntity<MultiValueMap<String, String>> kakaoProfileRequest = 
 				new HttpEntity<>(header2);
 		
 		ResponseEntity<String> response2 = rt2.exchange(
 				"https://kapi.kakao.com/v2/user/me",
 				HttpMethod.POST,
 				kakaoProfileRequest,
 				String.class
 		);
 		
 		KakaoProfile kakaoProfile = null;
 		try {
 			kakaoProfile = objMapper.readValue(response2.getBody(), KakaoProfile.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
 
 		Map map = new HashMap();
 		map.put("id",kakaoProfile.getKakao_account().getEmail()+ kakaoProfile.getId());
 		
 		if(service.isAuthMember(map)) {
 			String power = service.getPower(map).get("POWER").toString();
 	 		if("0".equalsIgnoreCase(power)) {
 	 			return "dogapp/Login";
 	 		}
 			int t_no = service.selectTrainer(map);
 			session.setAttribute("t_no", t_no);
 			session.setAttribute("id", map.get("id"));
 			session.setAttribute("power", power);
 			System.out.println(service.getPower(map).get("POWER"));
 			return "dogapp/Home";
 		}
 		else {
 			model.addAttribute("id", map.get("id"));
 			return "dogapp/authJoin";
 		}

	}
	
	@RequestMapping(value = "NaverLogin.do", produces = "application/json; charset=UTF-8;")
	public String Naverlogin(String code, String state) {
		RestTemplate rt = new RestTemplate();
		
		HttpHeaders header = new HttpHeaders();
		header.add("Content-type", "application/x-www-form-urlencoded; charset=UTF-8");
		
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		params.add("grant_type", "authorization_code");
		params.add("client_id", "P1L9JVLRfyfHdnhZIBfG");
		params.add("client_secret", "ptC0u_QLnC");
 		params.add("state", state);
 		params.add("code", code);
 		
 		HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest = 
 				new HttpEntity<>(params, header);
 		
 		ResponseEntity<String> response = rt.exchange(
 				"https://nid.naver.com/oauth2.0/token",
 				HttpMethod.POST,
 				kakaoTokenRequest,
 				String.class
 		);

 		OAuthToken oauthToken = null;
 		try {
			oauthToken = objMapper.readValue(response.getBody(), OAuthToken.class);
		}  catch (Exception e) {
			e.printStackTrace();
		}
 		
 		return "forward:/Auth/NaverLoginProcess.do?accessToken="+oauthToken.getAccess_token();
 		
	}
	
	@RequestMapping(value = "NaverLoginProcess.do", produces = "application/json; charset=UTF-8;")
	public String naverloginProcess(String accessToken, HttpSession session, Model model) {
		RestTemplate rt2 = new RestTemplate();
		
		HttpHeaders header2 = new HttpHeaders();
		header2.add("Authorization", "Bearer "+accessToken);
		header2.add("Content-type", "application/x-www-form-urlencoded;charset=UTF-8");
		 
 		HttpEntity<MultiValueMap<String, String>> kakaoProfileRequest = 
 				new HttpEntity<>(header2);
 		
 		ResponseEntity<String> response2 = rt2.exchange(
 				"https://openapi.naver.com/v1/nid/me",
 				HttpMethod.POST,
 				kakaoProfileRequest,
 				String.class
 		);		
 		
 		NaverProfile naverProfile = null;
 		try {
 			naverProfile = objMapper.readValue(response2.getBody(), NaverProfile.class);
		}  catch (Exception e) {
			e.printStackTrace();
		}
 		
 		Map map = new HashMap();
 		map.put("id", naverProfile.getResponse().getId());
 		
 		if(service.isAuthMember(map)) {
 			String power = service.getPower(map).get("POWER").toString();
 	 		if("0".equalsIgnoreCase(power)) {
 	 			return "dogapp/Login";
 	 		}
 			int t_no = service.selectTrainer(map);
 			session.setAttribute("t_no", t_no);
 			session.setAttribute("id", map.get("id"));
 			session.setAttribute("power", power);
 			System.out.println(service.getPower(map).get("POWER"));
 			return "dogapp/Home";
 		}
 		else {
 			model.addAttribute("id", map.get("id"));
 			return "dogapp/authJoin";
 		}
	}
}
