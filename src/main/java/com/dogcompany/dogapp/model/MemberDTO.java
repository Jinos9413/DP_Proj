package com.dogcompany.dogapp.model;



import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class MemberDTO {
	private String id;
	private String pwd;
	private String nickname;
	private String name;
	private String gender;
	private String addr;
	private String addr2;
	private String birth;
	private String joindate;
	private String postcode;
	private MultipartFile pic_name;
	private String pro_pic_name;
	private String power;
	/* private String file_name; */
	
	/*
	 * private String pic_name; private String file_name;
	 */
	

}
