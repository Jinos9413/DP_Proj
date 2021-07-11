package com.dogcompany.dogapp.model;

import lombok.Data;

@Data
public class NaverProfile {

public String resultcode;
public String message;
public Response response;
	@Data
	public class Response {
	
	public String id;
	public String nickname;
	public String profile_image;
	public String age;
	public String gender;
	public String email;
	public String mobile;
	public String mobile_e164;
	public String name;
	public String birthday;
	public String birthyear;
	
	}
}


