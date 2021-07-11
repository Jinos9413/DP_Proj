package com.dogcompany.dogapp.web;



import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cglib.core.DefaultNamingPolicy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

import com.dogcompany.dogapp.model.MemberDTO;
import com.dogcompany.dogapp.service.MemberService;

//import com.company.test.Date;
//import com.company.test.SimpleDateFormat;

import org.slf4j.Logger;




@Controller
@RequestMapping("/Member/")
public class MemberController {
	
	@Autowired
	 private MemberService service;
	 
	
	@RequestMapping(value ="Join.do",method= RequestMethod.GET)
	public String join() {
		return "dogapp/Join";
	}
	
	@RequestMapping(value ="Join.do",method= RequestMethod.POST)
	public String joinProcess(@RequestParam Map map,@RequestParam MultipartFile pic_name,HttpServletRequest req) throws IllegalStateException, IOException {
		String physicalPath=req.getServletContext().getRealPath("/upload");
		String renameFilename=FileUpDownUtils.getNewFileName(physicalPath, pic_name.getOriginalFilename());
		File dest = new File(physicalPath+File.separator+renameFilename);
		pic_name.transferTo(dest);
		//리퀘스트 영역에 데이타 저장
		map.put("pic_name", renameFilename);
		
		try {
			//dto.setPic_name(renameFilename);
			int result = service.insert(map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "dogapp/Login";
	}
	
	@RequestMapping(value ="Login.do",method= RequestMethod.POST)
	public String Login(@RequestParam Map map, HttpSession session) {
		int result = service.isMember(map);
		
		int t_no = service.selectTrainer(map);
		
		if(result==1) {
			String power = service.getPower(map).get("POWER").toString();
			if("0".equalsIgnoreCase(power)) {
				return "dogapp/Login";
			}
			session.setAttribute("id", map.get("id"));
			session.setAttribute("power", service.getPower(map).get("POWER"));
			session.setAttribute("t_no", t_no);
			return "dogapp/Home";
		}
		return "dogapp/Login";
	}
	
	@ResponseBody
	@RequestMapping(value="idChk.do",method=RequestMethod.POST)
	public int idChk(MemberDTO dto)throws Exception {
		int result = service.idChk(dto);
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="nickChk.do",method=RequestMethod.POST)
	public int nickChk(MemberDTO dto)throws Exception {
		int result = service.nickChk(dto);
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="isMember.do",method=RequestMethod.POST)
	public int isMember(@RequestParam Map map)throws Exception {
		int result = service.isMember(map);
		return result;
	}
	

	/////////////////////////////////////////////////////////////////////////////////////마이페이지
	@RequestMapping(value ="MyPage.do")
	public String mypage(@ModelAttribute("id") String id, HttpServletRequest req, Map map) {
		map.put("id", req.getSession().getAttribute("id"));
		Map member=service.selectList(map);
		req.setAttribute("member",member);
		return "dogapp/mypage/MyPage";
	}
	@RequestMapping(value ="MyProfile.do",method= RequestMethod.GET)
	public String myprofile(@RequestParam(value="dto",required=false) MemberDTO dto,
			HttpServletRequest req,
			Map map,
			Model model) {
		/*
		 * Date BDate = new Date(); SimpleDateFormat simpleDateFormat = new
		 * SimpleDateFormat("yyyy/MM/dd"); String strNowDate =
		 * simpleDateFormat.format(BDate);
		 */		
		map.put("id", req.getSession().getAttribute("id"));
		Map member=service.selectList(map);
			
		model.addAttribute("member",member);
		return "dogapp/mypage/MyProfile";
	}
	@RequestMapping(value="MyProfileModi.do",method=RequestMethod.POST)
	public String MyProfileModi( @RequestParam Map map,@RequestParam MultipartFile pic_name,HttpServletRequest req,MemberDTO dto,Model model) throws IllegalStateException, IOException {
		  
		  if(pic_name.getOriginalFilename() == null || "".equalsIgnoreCase(pic_name.getOriginalFilename())) {
			  map.put("pic_name", map.get("originPic"));
		  }
		  else {
			//map.put("id", req.getSession().getAttribute("id"));
			  String physicalPath=req.getServletContext().getRealPath("/upload");
			  String renameFilename=FileUpDownUtils.getNewFileName(physicalPath, pic_name.getOriginalFilename()); 
			  File dest = new File(physicalPath+File.separator+renameFilename); 
			  pic_name.transferTo(dest);
			  //리퀘스트 영역에 데이타 저장 
			  map.put("pic_name", renameFilename);
		  }
		  
		
		try {
			int result = service.MyProfileModi(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(dto);
		return  "forward:/Member/MyPage.do";
	}///////////회원정보 수정
	@RequestMapping(value ="MyPet.do")
	public String MyPet(@RequestParam Map map, HttpServletRequest req) {
		map.put("id", req.getSession().getAttribute("id"));
		
		Map member=service.selectList(map);
		
		List<Map> dogList=service.selectDogList(map);
		req.setAttribute("dogList", dogList);
		req.setAttribute("member", member);
		
		return "dogapp/mypage/MyPet";
	}
	
	@RequestMapping(value ="PetJoin.do",method= RequestMethod.POST)
	public String MyPet(@RequestParam Map map,@RequestParam MultipartFile petpic_name,HttpServletRequest req,Model model) throws IllegalStateException, IOException {
		String physicalPath=req.getServletContext().getRealPath("/upload");
		String renameFilename=FileUpDownUtils.getNewFileName(physicalPath, petpic_name.getOriginalFilename());
		File dest = new File(physicalPath+File.separator+renameFilename);
		petpic_name.transferTo(dest);
		
		Map member=service.selectList(map);
		System.out.println(map.get("dog_birth"));
		map.put("petpic_name", renameFilename);
		
		try {
			int result = service.insertdog(map);
			System.out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "forward:/Member/MyPet.do";
	}
	
	@ResponseBody
	@RequestMapping(value="SelectDogOne.do", produces = "application/json; charset=UTF-8;")
	public Map selectDogOne(@RequestParam Map map){
		map = service.selectDogOne(map);
		return map;
	}
	
	@RequestMapping(value="PetModi.do",method= RequestMethod.POST)
	public String PetModi( @RequestParam Map map,@RequestParam MultipartFile petpic_name,HttpServletRequest req,Model model) throws IllegalStateException, IOException {
		  
		  if(petpic_name.getOriginalFilename() == null || "".equalsIgnoreCase(petpic_name.getOriginalFilename())) {
			  map.put("petpic_name", map.get("originPic"));
		  }
		  else {
			  String physicalPath=req.getServletContext().getRealPath("/upload");
			  String renameFilename=FileUpDownUtils.getNewFileName(physicalPath, petpic_name.getOriginalFilename()); 
			  File dest = new File(physicalPath+File.separator+renameFilename); 
			  petpic_name.transferTo(dest);
			  map.put("petpic_name", renameFilename);
			  
		  }
	
		try {
			System.out.println(map);
			int result = service.petModi(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "forward:/Member/MyPet.do";
	}///////////회원정보

	@ResponseBody
	@RequestMapping(value="SelectOneMember.do",method=RequestMethod.POST, produces = "application/json; charset=UTF-8;")
	public Map selectOneMember(@RequestParam Map map)throws Exception {
		map = service.selectOneMember(map);
		System.out.println(map.get("NAME"));
		System.out.println("허욱ㅇ허욱");
		System.out.println("허욱ㅇ허욱");
		return map;
	}
	
	
	
}
