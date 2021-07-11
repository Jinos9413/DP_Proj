package com.dogcompany.dogapp.web;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.dogcompany.dogapp.model.CareDTO;
import com.dogcompany.dogapp.model.OAuthToken;
import com.dogcompany.dogapp.service.CareService;
import com.dogcompany.dogapp.service.MemberService;
import com.fasterxml.jackson.databind.ObjectMapper;


@Controller
@RequestMapping("/Care/")
public class CareController {
	
	@Resource(name = "careService")
	private CareService careService;
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("CareMain.do")
	public String goCareMain() {
		return "dogapp/care/CareMain";
	}
	
	@RequestMapping("CareServiceMain.do")
	public String CareServiceMain(@ModelAttribute("id") String id, @RequestParam Map map, @RequestParam(required = false, defaultValue = "1") int nowPage, HttpServletRequest req, Model model)
	{
			map.put("id", id);
			map.put("state", 1);
			List<Integer> likeList = new Vector();
			List<Integer> chatList = new Vector();
			// 서비스 호출]
			ListPagingData listPagingData = careService.selectList(map, req, nowPage);
			for(CareDTO item : (List<CareDTO>)listPagingData.getLists()) {
				likeList.add(careService.selectCountCareLike(item));
				chatList.add(careService.selectCountCareChat(item));
			}

			// 데이타 저장]
			model.addAttribute("likeList", likeList);
			model.addAttribute("chatList", chatList);
			model.addAttribute("listPagingData", listPagingData);
			model.addAttribute("state", 1);
			// 뷰정보 반환]
		return "dogapp/care/CareServiceMain";
	}//////////////
	
	@RequestMapping("CareServiceDoing.do")
	public String CareServiceDoing(@ModelAttribute("id") String id, @RequestParam Map map, @RequestParam(required = false, defaultValue = "1") int nowPage, HttpServletRequest req, Model model)
	{
			map.put("id", id);
			map.put("state", 2);
			List<Integer> likeList = new Vector();
			List<Integer> chatList = new Vector();
			// 서비스 호출]
			ListPagingData listPagingData = careService.selectList(map, req, nowPage);
			for(CareDTO item : (List<CareDTO>)listPagingData.getLists()) {
				likeList.add(careService.selectCountCareLike(item));
				chatList.add(careService.selectCountCareChat(item));
			}

			// 데이타 저장]
			model.addAttribute("likeList", likeList);
			model.addAttribute("chatList", chatList);
			model.addAttribute("listPagingData", listPagingData);
			model.addAttribute("state", 2);
			// 뷰정보 반환]
		return "dogapp/care/CareServiceDoing";
	}////////////// CareList

	@RequestMapping("CareServiceDone.do")
	public String CareServiceDone(@ModelAttribute("id") String id, @RequestParam Map map, @RequestParam(required = false, defaultValue = "1") int nowPage, HttpServletRequest req, Model model)
	{
			map.put("id", id);
			map.put("state", 3);
			// 서비스 호출]
			ListPagingData listPagingData = careService.selectList(map, req, nowPage);
			List<Integer> likeList = new Vector();
			List<Integer> chatList = new Vector();
			for(CareDTO item : (List<CareDTO>)listPagingData.getLists()) {
				likeList.add(careService.selectCountCareLike(item));
				chatList.add(careService.selectCountCareChat(item));
			}

			// 데이타 저장]
			model.addAttribute("likeList", likeList);
			model.addAttribute("chatList", chatList);
			model.addAttribute("listPagingData", listPagingData);
			model.addAttribute("state", 3);
			// 뷰정보 반환]
		return "dogapp/care/CareServiceDone";
	}////////////// CareList
	
	@RequestMapping(value = "CareWrite.do", method = RequestMethod.GET)
	public String write(@ModelAttribute("id") String id, HttpServletRequest req, Map map) {
		map.put("id", req.getSession().getAttribute("id"));
		map = careService.getAddress(map);
		req.setAttribute("addr", map);
		// 뷰정보 반환]
		return "dogapp/care/CareWrite";
	}/////////////
	
	@RequestMapping(value = "CareWrite.do", method = RequestMethod.POST)
	public String writeoK(Map map, MultipartHttpServletRequest mtr,HttpServletRequest req) {
		String physicalPath=req.getServletContext().getRealPath("/upload");
		System.out.println(physicalPath);
		//업로드한 파일들을 리스트에 담음
		List<MultipartFile> fileList = mtr.getFiles("care_images");
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
			map.put("care_title", mtr.getParameter("care_title"));
			map.put("care_content", mtr.getParameter("care_content"));
			map.put("care_clickLineL", mtr.getParameter("care_clickLineL"));
			map.put("care_clickLineP", mtr.getParameter("care_clickLineP"));
			map.put("care_clickLineA", mtr.getParameter("care_clickLineA"));
			map.put("care_datepicker", mtr.getParameter("care_datepicker"));
			map.put("care_timepicker", mtr.getParameter("care_timepicker"));
			map.put("care_price", mtr.getParameter("care_price"));
			map.put("care_images", str);
		// 서비스 호출]
			careService.insert(map);
		// 뷰정보 반환]
		// 뷰정보 반환:목록으로 이동
		return "forward:/Care/CareServiceMain.do";
	}/////////////
	@RequestMapping("CareView.do")
	public String view(@RequestParam Map map, Model model) {
		// 서비스 호출]
		CareDTO record = careService.selectOne(map);
		// 데이타 저장]
		// 줄바꿈 처리
		record.setCare_content(record.getCare_content().replace("\r\n", "<br/>"));
		model.addAttribute("record", record);
		String[] images = record.getCare_images().split("/");
		model.addAttribute("care_images", images);
		// 뷰정보 반환]
		return "dogapp/care/CareView";
	}
	@RequestMapping("CareServiceDoingView.do")
	public String ServiceDoingview(@RequestParam Map map, Model model) {
		// 서비스 호출]
		CareDTO record = careService.selectOne(map);
		// 데이타 저장]
		// 줄바꿈 처리
		record.setCare_content(record.getCare_content().replace("\r\n", "<br/>"));
		model.addAttribute("record", record);
		String[] images = record.getCare_images().split("/");
		model.addAttribute("care_images", images);
		// 뷰정보 반환]
		return "dogapp/care/CareServiceDoingView";
	}
	// 수정폼으로 이동 및 수정처리]
		@RequestMapping("CareEdit.do")
		public String edit(HttpServletRequest req, @RequestParam Map map) {
			// 서비스 호출]
			CareDTO record = careService.selectOne(map);
			record.setCare_price(record.getCare_price().replaceAll(",", ""));
			// 데이타 저장]
			req.setAttribute("record", record);
			String[] images = record.getCare_images().split("/");
			req.setAttribute("care_images", images);
			// 수정 폼으로 이동]
			return "dogapp/care/CareEdit";

	}/////////////////////
	@RequestMapping(value = "CareEditProcess.do", method = RequestMethod.POST)
	public String CareEditProcess(Map map, MultipartHttpServletRequest mtr,HttpServletRequest req) {
		String physicalPath=req.getServletContext().getRealPath("/upload");
		//업로드한 파일들을 리스트에 담음
		map.put("care_no", mtr.getParameter("care_no"));
		map.put("care_title", mtr.getParameter("care_title"));
		map.put("care_content", mtr.getParameter("care_content"));
		map.put("care_clickLineL", mtr.getParameter("care_clickLineL"));
		map.put("care_clickLineP", mtr.getParameter("care_clickLineP"));
		map.put("care_clickLineA", mtr.getParameter("care_clickLineA"));
		map.put("care_datepicker", mtr.getParameter("care_datepicker"));
		map.put("care_timepicker", mtr.getParameter("care_timepicker"));
		map.put("care_price", mtr.getParameter("care_price"));
		if(mtr.getParameter("care_images") != null) {
			List<MultipartFile> fileList = mtr.getFiles("care_images");
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
				
				map.put("care_images", str);
		}
		else {
			map.put("care_images", mtr.getParameter("originImages"));
		}

		// 서비스 호출]
		careService.update(map);
		// 뷰정보 반환]
		// 뷰정보 반환:목록으로 이동
		return "forward:/Care/CareView.do";
	}/////////////
	// 삭제처리]
	@RequestMapping("CareDelete.do")
	public String delete(@RequestParam Map map) {
		// 서비스 호출
		careService.delete(map);
		// 뷰정보 반환]
		return "forward:/Care/CareServiceMain.do";
	}
	
	@RequestMapping("CareServiceMap.do")
	public String goCareMap(HttpServletRequest req, @RequestParam Map map) {
	
		//서비스호출
		List<CareDTO> record = careService.select(map);
		String id=req.getSession().getAttribute("id").toString();
		
		map.put("id", id);
		Map records= memberService.getAddr(map);		
		
		// 데이타 저장]
		req.setAttribute("record", record);
		req.setAttribute("records", records);
		String str = "";
		String ntr = "";
		String ptr = "";
		String ttr1= "";
		String ttr2= "";
		List<String[]> list = new Vector<String[]>();
		String itr= "";
		
		for(int i = 0 ; i < record.size(); i++) {
			if(record.get(i).getCare_state().equals("1")) {
				str += record.get(i).getCare_clickLineP()+"/";
				ntr += record.get(i).getCare_no()+"/";
				ptr += record.get(i).getCare_price()+"/";
				ttr1 += record.get(i).getCare_datepicker()+"/";
				ttr2 += record.get(i).getCare_timepicker()+"/";
				list.add(record.get(i).getCare_images().split("/"));
			}
		}
		for(String[] item: list) {
			itr += item[0]+"/";
		}
		//리턴
		req.setAttribute("str", str);
		req.setAttribute("ntr", ntr);
		req.setAttribute("ptr", ptr);
		req.setAttribute("ttr1", ttr1);
		req.setAttribute("ttr2", ttr2);
		req.setAttribute("itr", itr);
		return "dogapp/care/CareServiceMap";
	}

	@RequestMapping(value = "CareServiceRating.do", method = RequestMethod.POST)
	public String careServiceRating(@RequestParam Map map,HttpServletRequest req) {
		int affected = careService.insertcareServiceRating(map);
		careService.updateStateFinish(map);
		return "forward:/Care/CareServiceDone.do";
	}/////////////
	@RequestMapping(value = "GetRateList.do",produces = "application/json; charset=UTF-8;")
	public @ResponseBody Map getRateList(@RequestParam Map map, HttpServletRequest req) {
		map = careService.selectRateOne(map);
		return map;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/*!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!트레이너 구간!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*/
	@RequestMapping("TrainerMain.do")
	public String goTrainerMain(@ModelAttribute("id") String id, @RequestParam Map map, @RequestParam(required = false, defaultValue = "1") int nowPage, HttpServletRequest req, Model model) {
		String t_no = req.getSession().getAttribute("t_no").toString();
		String power = req.getSession().getAttribute("power").toString();
		if("1".equals(power)) {
			return "dogapp/petsitter/PetSitterMain";
		}
		else if("3".equals(power)) {
			return "dogapp/care/CareMain";
		}
		List<Integer> likeList = new Vector();
		List<Integer> chatList = new Vector();
		List<Integer> careLikeList = new Vector();
		ListPagingData listPagingData = null;
		map.put("state", 1);
		// 서비스 호출]
		if(map.get("searchBy") != null) {
			map.put("t_no", t_no);
			listPagingData = careService.selectListByLike(map, req, nowPage);
		}
		else {
			listPagingData = careService.selectList(map, req, nowPage);
		}
		
		for(CareDTO item : (List<CareDTO>)listPagingData.getLists()) {
			item.setT_no(t_no);
			likeList.add(careService.selectCountCareLike(item));
			chatList.add(careService.selectCountCareChat(item));
			careLikeList.add(careService.selectCheckLike(item));
		}
		// 데이타 저장]
		model.addAttribute("careLikeList", careLikeList);
		model.addAttribute("likeList", likeList);
		model.addAttribute("chatList", chatList);
		model.addAttribute("listPagingData", listPagingData);
		model.addAttribute("state", 1);
		return "dogapp/care/TrainerMain";
	}
	@RequestMapping("TrainerDoing.do")
	public String goTrainerDoing(@ModelAttribute("id") String id, @RequestParam Map map, @RequestParam(required = false, defaultValue = "1") int nowPage, HttpServletRequest req, Model model) {
		String t_no = req.getSession().getAttribute("t_no").toString();
		String power = req.getSession().getAttribute("power").toString();
		if("1".equals(power)) {
			return "dogapp/petsitter/PetSitterMain";
		}
		List<Integer> likeList = new Vector();
		List<Integer> chatList = new Vector();
		List<Integer> careLikeList = new Vector();
		ListPagingData listPagingData = null;
		map.put("state", 2);
		// 서비스 호출]
		listPagingData = careService.selectList(map, req, nowPage);
		
		for(CareDTO item : (List<CareDTO>)listPagingData.getLists()) {
			item.setT_no(t_no);
			likeList.add(careService.selectCountCareLike(item));
			chatList.add(careService.selectCountCareChat(item));
			careLikeList.add(careService.selectCheckLike(item));
		}
		// 데이타 저장]
		model.addAttribute("careLikeList", careLikeList);
		model.addAttribute("likeList", likeList);
		model.addAttribute("chatList", chatList);
		model.addAttribute("listPagingData", listPagingData);
		model.addAttribute("state", 2);
		return "dogapp/care/TrainerDoing";
	}
	@RequestMapping(value = "CnoLikeChange.do",produces = "application/json; charset=UTF-8;")
	public @ResponseBody Map cnoLikeChange(@RequestParam Map map, HttpServletRequest req) {
		System.out.println(map.get("likeFlag"));
		int affected = 0;
		if("true".equalsIgnoreCase(map.get("likeFlag").toString())) affected = careService.insertLike(map);
		else affected = careService.deleteLike(map);
		//int affected = careService.cnoLikeChange(map);
		return map;
	}
	@RequestMapping("TrainerInfo.do")
	public String goTrainerInfo(HttpServletRequest req, Map map) {
		String t_no = req.getSession().getAttribute("t_no").toString();
		if("-1".equals(t_no)) {
			return "dogapp/petsitter/PetSitterMain";
		}
		map.put("t_no", t_no);
		Map trainer = careService.selectTrainerOne(map);
		trainer.put("T_CONTENT", (trainer.get("T_CONTENT").toString().replace("\r\n", "<br/>")));
		String[] images = trainer.get("T_PHOTO").toString().split("/");
		
		List<Map> reviewList = careService.selectReviewList(map);
		float avgOfRate = 0;
		float sumOfRate = 0;
		for(Map review: reviewList) {
			float rate = Float.parseFloat((review.get("TRAINER_RATE").toString()));
			sumOfRate += rate;
		}
		avgOfRate = sumOfRate/(float)reviewList.size();
		req.setAttribute("trainer_images", images);
		req.setAttribute("trainer", trainer);
		req.setAttribute("reviewList", reviewList);
		req.setAttribute("avgOfRate", avgOfRate);
		return "dogapp/care/TrainerInfo";
	}
	
}
