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
public class R_ReportDTO {
	private String r_r_no;
	private String r_no;
	private String id;
	private String r_r_title;
	private String r_r_comment;
	private java.sql.Date r_r_postdate;
	
}/////////////////