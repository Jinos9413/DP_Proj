package com.dogcompany.dogapp.model;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Getter
@Setter
public class PhotoDTO {
	private String p_no;
	private String id;
	private String name;//이름 출력용
	private String nickname;//닉네임
	private String pic_name;
	private String p_title;
	private String p_content;
	private String p_images;
	private String p_commentcount;
	private String p_likecount;
	private String p_reportcount;
	private java.sql.Date p_postdate;
	
	

}/////////////////