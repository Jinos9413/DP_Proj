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
public class CareDTO {
	private String care_no;
	private String care_title;
	private String care_content;
	private java.sql.Date care_postdate;
	private String id;
	private String name;//이름 출력용
	private String nickname;//닉네임
	private String care_state;//상태
	private String care_clickLineL;//총거리
	private String care_clickLineP;//마커 상세좌표
	private String care_clickLineA;//첫좌표 위도경도를 주소로
	private String care_datepicker;
	private String care_timepicker;
	private String care_price;
	private String care_images;
	private String t_no;

}/////////////////