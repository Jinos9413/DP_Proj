package com.dogcompany.dogapp.model;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Getter
@Setter
public class RecommendationDTO {
	private String r_no;
	private String id;
	private String r_title;
	private String r_content;
	private String r_images;
	private String r_clickLineL;//총거리
	private String r_clickLineP;//마커 상세좌표
	private String r_clickLineA;//첫좌표 위도경도를 주소로
	private String r_commentcount;
	private String r_likecount;
	private String r_reportcount;
	private java.sql.Date r_postdate;
	
}/////////////////