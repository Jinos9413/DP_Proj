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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.dogcompany.dogapp.model.OAuthToken;
import com.dogcompany.dogapp.service.CareService;
import com.dogcompany.dogapp.service.MemberService;
import com.dogcompany.dogapp.service.PetSitterService;
import com.fasterxml.jackson.databind.ObjectMapper;


@Controller
@RequestMapping("/PetSitter/")
public class PetSitterController {
	
	@Autowired
	private PetSitterService petSitterService;
	@Autowired
	 private MemberService service;
	
	@RequestMapping("PetSitterMain.do")
	public String petSitterMain(HttpServletRequest req) {
		
		return "dogapp/petsitter/PetSitterMain";
	}
	@RequestMapping("PetSitterForm.do")
	public String petSitterForm(HttpServletRequest req) {
		
		return "dogapp/petsitter/PetSitterForm";
	}
	
	@RequestMapping("PetSitterFormProcess.do")
	public String petSitterFormProcess(Map map, MultipartHttpServletRequest mtr,HttpServletRequest req) {
		map.put("id", req.getSession().getAttribute("id").toString());
		map.put("t_title", mtr.getParameter("t_title").toString());
		map.put("t_content", mtr.getParameter("t_content").toString());
		String physicalPath=req.getServletContext().getRealPath("/upload");
		List<MultipartFile> fileList = mtr.getFiles("t_photo");
		String str = "";
        for (MultipartFile mf : fileList) {
        	String renameFilename=FileUpDownUtils.getNewFileName(physicalPath, mf.getOriginalFilename());
            File dest = new File(physicalPath+File.separator+renameFilename);
            str += renameFilename+"/";
            try {
				mf.transferTo(dest);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
        }
        map.put("t_photo", str);
        int affected = petSitterService.insertPerSitter(map);
        int t_no = service.selectTrainer(map);
        req.getSession().setAttribute("t_no", t_no);
		return "dogapp/petsitter/PetSitterMain";
	}
}
