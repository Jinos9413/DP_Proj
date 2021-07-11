package com.dogcompany.dogapp.web;

import java.io.File;
import java.io.IOException;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.dogcompany.dogapp.model.OAuthToken;
import com.dogcompany.dogapp.model.PhotoDTO;
import com.dogcompany.dogapp.service.CareService;
import com.dogcompany.dogapp.service.PhotoService;
import com.fasterxml.jackson.databind.ObjectMapper;


@Controller
@RequestMapping("/Community/Photo/")
public class PhotoController {
	
	@Resource(name = "photoService")
	private PhotoService service;
	
	@RequestMapping("P_Main.do")
	public String P_Main(@ModelAttribute("id") String id, @RequestParam Map map, @RequestParam(required = false, defaultValue = "1") int nowPage, HttpServletRequest req, Model model)
	{
			map.put("id", req.getSession().getAttribute("id"));
			// 서비스 호출]
			ListPagingData listPagingData = service.selectList(map, req, nowPage);
			
			List<PhotoDTO> list =listPagingData.getLists();
			List likeList = new Vector<>();
			for(PhotoDTO item: list) {
				map.put("p_no", item.getP_no());
				int likeCheck = service.likeCheck(map);
				likeList.add(likeCheck);
			}
			model.addAttribute("likeList", likeList);
			// 데이타 저장]
			model.addAttribute("listPagingData", listPagingData);
		
			// 뷰정보 반환]
		return "dogapp/community/photo/P_Main";
	}////////////// Main
	
//	@RequestMapping("P_View.do")
//	public String view(@RequestParam Map map,  HttpServletRequest req, Model model) {
//		// 서비스 호출]
//		PhotoDTO record = service.selectOne(map);
//		map.put("id", req.getSession().getAttribute("id"));
//		// 데이타 저장]
//		// 줄바꿈 처리
//		record.setP_content(record.getP_content().replace("\r\n", "<br/>"));
//		model.addAttribute("record", record);
//		//좋아요 체크
//		int likeCheck = service.likeCheck(map);
//		model.addAttribute("likeCheck",likeCheck);
//		//이미지 배열로 뿌려주기
//		String[] images = record.getP_images().split("/");
//		model.addAttribute("p_images", images);
//		map.put("p_no", record.getP_no());
//		//댓글
//		//댓글 리스트
//		List<Map> commentList = service.selectComment(map);  
//	
//		model.addAttribute("commentList",commentList);
//		// 뷰정보 반환]
//		return "dogapp/community/photo/P_View";
//	}//////////////////// View

	
	
	@RequestMapping(value="SelectOneView.do",produces = "application/json; charset=UTF-8;")
	public @ResponseBody Map selectOneView(@RequestParam Map map, HttpServletRequest req) {
		map.put("id", req.getSession().getAttribute("id"));
		int check = service.likeCheck(map);
		map= service.selectOne(map);
		map.put("P_CONTENT", map.get("P_CONTENT").toString().replace("\r\n", "<br/>"));
		map.put("check", check);
		return map;
	}///////////
	
	
	@RequestMapping(value="SelectOneView2.do",produces = "application/json; charset=UTF-8;")
	public @ResponseBody List<Map> selectOneView2(@RequestParam Map map, HttpServletRequest req) {
		List<Map> commentlist = service.selectComment(map);
		return commentlist;
	}///////////
	
	
	@RequestMapping(value = "P_Write.do", method = RequestMethod.GET)
	public String write(@ModelAttribute("id") String id) {
		// 뷰정보 반환]
		return "dogapp/community/photo/P_Write";
	}/////////////
	
	@RequestMapping(value = "P_Write.do", method = RequestMethod.POST)
	public String writeoK(Map map, MultipartHttpServletRequest mtr,HttpServletRequest req) {
		String physicalPath=req.getServletContext().getRealPath("/upload");
		//업로드한 파일들을 리스트에 담음
		List<MultipartFile> fileList = mtr.getFiles("p_images");
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
			map.put("p_title", mtr.getParameter("p_title"));
			map.put("p_content", mtr.getParameter("p_content"));
			map.put("p_images", str);
		// 서비스 호출]
			service.insert(map);
		// 뷰정보 반환]
		// 뷰정보 반환:목록으로 이동
		return "forward:/Community/Photo/P_Main.do";
	}/////////////
	
	
	//좋아요 기능
	@RequestMapping("P_LikeInsert.do")
	public @ResponseBody int likeInsert(@ModelAttribute("id") String id, @RequestParam Map map, HttpServletRequest req) {
		map.put("id", req.getSession().getAttribute("id"));
		System.out.println(map.get("p_no"));
		//좋아요 등록
		service.likeInsert(map);
		//좋아요 개수 업데이트
		service.getLike(map);
		//좋아요 여부
		System.out.println(map.get("p_no"));
		int likeCount = service.likeCount(map);
		return likeCount;
	}
	
	@RequestMapping("P_LikeDelete.do")
	public @ResponseBody int likeDelete(@ModelAttribute("id") String id, @RequestParam Map map, HttpServletRequest req) {
		map.put("id", req.getSession().getAttribute("id"));
		//좋아요 등록
		service.likeDelete(map);
		//좋아요 개수 업데이트
		service.getLike(map);
		//좋아요 여부
		int likeCount = service.likeCount(map);
		return likeCount;
	}
	
	
	// 수정폼으로 이동 및 수정처리]
		@RequestMapping("P_Edit.do")
		public String edit(HttpServletRequest req, @RequestParam Map map) {
			// 서비스 호출]
			map = service.selectOne(map);
			// 데이타 저장]
			String[] images = map.get("p_images").toString().split("/");
			req.setAttribute("p_images", images);
			// 수정 폼으로 이동]
			return "dogapp/community/photo/P_Edit";

	}/////////////////////
	@RequestMapping(value = "P_EditProcess.do", method = RequestMethod.POST)
	public String CareEditProcess(Map map, MultipartHttpServletRequest mtr,HttpServletRequest req) {
		String physicalPath=req.getServletContext().getRealPath("/upload");
		//업로드한 파일들을 리스트에 담음
		map.put("p_no", mtr.getParameter("p_no"));
		map.put("p_title", mtr.getParameter("p_title"));
		map.put("p_content", mtr.getParameter("p_content"));
		if(mtr.getParameter("p_images") != null) {
			List<MultipartFile> fileList = mtr.getFiles("p_images");
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
				
				map.put("p_images", str);
		}
		else {
			map.put("p_images", mtr.getParameter("originImages"));
		}

		// 서비스 호출]
		service.update(map);
		// 뷰정보 반환]
		// 뷰정보 반환:목록으로 이동
		return "forward:/Community/Photo/P_View.do";
	}/////////////

		// 삭제처리]
		@ResponseBody
		@RequestMapping("P_Delete.do")
		public String delete(@RequestParam Map map) {
			// 서비스 호출
			service.delete(map);
			System.out.println("map no 값 : "+map.get("p_no"));
			// 뷰정보 반환]
			return "forward:/Community/Photo/P_Main.do";
		}
		
		//코멘트 입력처리]
		@CrossOrigin
		@PostMapping(value="P_C_Write.do",produces = "text/plain;charset=UTF-8")
		public @ResponseBody String write(@ModelAttribute("id") String id,@RequestParam Map map, HttpServletRequest req) {
			map.put("id", req.getSession().getAttribute("id").toString());
			String data= service.insertComment(map);
			service.setCommentCount(map);
			return data;//댓글 작성자 이름 반환
		}////////////////////

		@CrossOrigin
		@PostMapping(value="P_C_Delete.do",produces = "text/plain;charset=UTF-8")
		public @ResponseBody String delete(@ModelAttribute("id") String id,@RequestParam Map map, HttpServletRequest req){		
			map.put("id", req.getSession().getAttribute("id").toString());
			String data = service.deleteComment(map);
			service.setCommentCount(map);
			return data;
		}

		//신고 입력 처리
		@ResponseBody
		@PostMapping(value = "P_ReportInsert.do", produces = "text/plain;charset=UTF-8")
		public String insert(@ModelAttribute("id") String id, @RequestParam Map map, HttpServletRequest req) {
			map.put("id", req.getSession().getAttribute("id"));//한줄 댓글 작성자의 아이디를 맵에 설정
			 int flag = service.reportInsert(map);
			return "입력성공";//작성자 이름 반환
		}
		
}////class