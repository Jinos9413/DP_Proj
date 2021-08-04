package com.dogcompany.dogapp.web;

import java.io.File;
import java.io.IOException;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.dogcompany.dogapp.model.PhotoDTO;
import com.dogcompany.dogapp.model.RecommendationDTO;
import com.dogcompany.dogapp.service.CareService;
import com.dogcompany.dogapp.service.R_CommentService;
import com.dogcompany.dogapp.service.R_ReportService;
import com.dogcompany.dogapp.service.RecommendationService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;


@Controller
@RequestMapping("/Community/")
public class CommunityController {
	//서비스 주입
	@Resource(name = "recommendationService")
	private RecommendationService recommendationService;
	@Resource(name = "r_commentService")
	private R_CommentService r_commentService;
	@Resource(name = "r_reportService")
	private R_ReportService r_reportService;
	@Autowired
	private CareService careService;

	@Autowired
	private ObjectMapper mapper;
	
	@RequestMapping("Recommendation/R_Main.do")
	public String RecommendationMain(@ModelAttribute("id") String id, @RequestParam Map map, @RequestParam(required = false, defaultValue = "1") int nowPage, HttpServletRequest req, Model model)
	{
			map.put("id", req.getSession().getAttribute("id"));
			
			
			
			// 서비스 호출]
			ListPagingData listPagingData = recommendationService.selectList(map, req, nowPage);
			
			// 데이타 저장]
			model.addAttribute("listPagingData", listPagingData);
			
			ObjectMapper mapper = new ObjectMapper();
			String jsonString = "";
			try {
				jsonString = mapper.writeValueAsString(listPagingData.getLists());
			} catch (JsonProcessingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}			
			model.addAttribute("jsonString",jsonString);
			//좋아요 리스트에서 구별
			List<Map> list = listPagingData.getLists();
			List likeList = new Vector<>();
			for(Map item: list) {
				map.put("r_no", item.get("R_NO"));
				int likeCheck = recommendationService.likeCheck(map);
				System.out.println("likeCHEcK : "+likeCheck);
				System.out.println("item : "+item.get("R_NO")+" likecheck : "+likeCheck);
				likeList.add(likeCheck);
			}
			//좋아요 체크
			model.addAttribute("likeList", likeList);
			// 뷰정보 반환]
			return "dogapp/community/recommendation/R_Main";
	}////////////// RecommendationList
	
	@RequestMapping(value = "Recommendation/R_Write.do", method = RequestMethod.GET)
	public String write(@ModelAttribute("id") String id, Map map, HttpServletRequest req) {
		// 뷰정보 반환]
		map.put("id", req.getSession().getAttribute("id"));
		map = careService.getAddress(map);
		req.setAttribute("addr", map);
		return "dogapp/community/recommendation/R_Write";
	}/////////////
	
	@RequestMapping(value ="Recommendation/R_Write.do", method = RequestMethod.POST)
	public String writeoK(Map map, MultipartHttpServletRequest mtr,HttpServletRequest req) {
		String physicalPath=req.getServletContext().getRealPath("/upload");
		//업로드한 파일들을 리스트에 담음
		List<MultipartFile> fileList = mtr.getFiles("r_images");
		//DB에 스트링의 형태로 저장하기 위한 문자열
		String str = "";
		//리스트에서 파일 하나씩 가져와서 업로드
	        for (MultipartFile mf : fileList) {
		 	//중복 시 이름 변경 로직
			String renameFilename=FileUpDownUtils.getNewFileName(physicalPath, mf.getOriginalFilename());
	            	File dest = new File(physicalPath+File.separator+renameFilename);
	            
			//DB에 파일 이름 "/"로 연결해서 저장 
			str += renameFilename+"/";
	            	
			//파일 업로드
			try {
				mf.transferTo(dest);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
	        }
			map.put("id", req.getSession().getAttribute("id"));
			map.put("r_title", mtr.getParameter("r_title"));
			map.put("r_content", mtr.getParameter("r_content"));
			map.put("r_clickLineL", mtr.getParameter("r_clickLineL"));
			map.put("r_clickLineP", mtr.getParameter("r_clickLineP"));
			map.put("r_clickLineA", mtr.getParameter("r_clickLineA"));
			map.put("r_images", str);
		// 서비스 호출]
			recommendationService.selectOne(map);
			recommendationService.insert(map);
			
			
		// 뷰정보 반환]
		// 뷰정보 반환:목록으로 이동
		return "forward:/Community/Recommendation/R_Main.do";
	}/////////////
	//삭제처리
	@ResponseBody
	@RequestMapping("R_Delete.do")
	public String delete(@RequestParam Map map) {
		// 서비스 호출
		recommendationService.delete(map);
		// 뷰정보 반환]
		return "forward:/Community/Recommendation/R_Main.do";
	}
	
	//모달로 띄워주기
	@RequestMapping(value="SelectOneView.do",produces = "application/json; charset=UTF-8;")
	public @ResponseBody Map selectOneView(@RequestParam Map map, HttpServletRequest req) {
		map.put("id", req.getSession().getAttribute("id"));
		int check = recommendationService.likeCheck(map);
		map= recommendationService.selectOne(map);
		map.put("R_CONTENT", map.get("R_CONTENT").toString().replace("\r\n", "<br/>"));
		map.put("check", check);
		return map;
	}///////////
	
	@RequestMapping(value="SelectOneView2.do",produces = "application/json; charset=UTF-8;")
	public @ResponseBody List<Map> selectOneView2(@RequestParam Map map, HttpServletRequest req) {
		List<Map> commentlist = recommendationService.selectComment(map);
		return commentlist;
	}///////////
	
	//좋아요 기능
	@RequestMapping("R_LikeInsert.do")
	public @ResponseBody int likeInsert(@ModelAttribute("id") String id, @RequestParam Map map, HttpServletRequest req) {
		map.put("id", req.getSession().getAttribute("id"));
		//좋아요 등록
		recommendationService.likeInsert(map);
		//좋아요 개수 업데이트
		recommendationService.getLike(map);
		//좋아요 여부
		int likeCount = recommendationService.likeCount(map);
		return likeCount;
	}
	
	@RequestMapping("R_LikeDelete.do")
	public @ResponseBody int likeDelete(@ModelAttribute("id") String id, @RequestParam Map map, HttpServletRequest req) {
		map.put("id", req.getSession().getAttribute("id"));
		//좋아요 등록
		recommendationService.likeDelete(map);
		//좋아요 개수 업데이트
		recommendationService.getLike(map);
		//좋아요 여부
		int likeCount = recommendationService.likeCount(map);
		return likeCount;
	}
	
	//코멘트 입력처리]
	@CrossOrigin
	@PostMapping(value="R_C_Write.do",produces = "text/plain;charset=UTF-8")
	public @ResponseBody String writeComment(@ModelAttribute("id") String id,@RequestParam Map map, HttpServletRequest req) {
		map.put("id", req.getSession().getAttribute("id").toString());
		String data= recommendationService.insertComment(map);
		recommendationService.setCommentCount(map);
		return data;//댓글 작성자 이름 반환
	}////////////////////

	@CrossOrigin
	@PostMapping(value="R_C_Delete.do",produces = "text/plain;charset=UTF-8")
	public @ResponseBody String delete(@ModelAttribute("id") String id,@RequestParam Map map, HttpServletRequest req){		
		map.put("id", req.getSession().getAttribute("id").toString());
		String data = recommendationService.deleteComment(map);
		recommendationService.setCommentCount(map);
		return data;
	}
	
	
	//추천산책로 신고 입력 처리
	@ResponseBody
	@PostMapping(value = "R_ReportInsert.do", produces = "text/plain;charset=UTF-8")
	public String insert(@ModelAttribute("id") String id, @RequestParam Map map, HttpServletRequest req) {
	
		map.put("id", req.getSession().getAttribute("id"));//한줄 댓글 작성자의 아이디를 맵에 설정
		int flag = recommendationService.reportInsert(map);
		return "입력성공";//작성자 이름 반환
	}

	
}
