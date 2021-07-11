package com.dogcompany.dogapp.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.socket.WebSocketSession;

import com.dogcompany.dogapp.model.CareDTO;
import com.dogcompany.dogapp.service.AndroidService;


@Controller
@RequestMapping("/WebView/")
public class AndroidWebViewController {
	
	@Autowired
	private AndroidService service;
	
	@RequestMapping("CareMapState1.do")
	public String careMapState1(@RequestParam Map map, Model model) {
		// 서비스 호출]
		CareDTO record = service.selectCareMapState1(map);
		// 데이타 저장]
		// 줄바꿈 처리
		record.setCare_content(record.getCare_content().replace("\r\n", "<br/>"));
		model.addAttribute("record", record);
		String[] images = record.getCare_images().split("/");
		model.addAttribute("care_images", images);
		// 뷰정보 반환]
		return "android/CareMapState1";
	}
	@RequestMapping("ChatView.do")
	public String chatView(@RequestParam Map map, HttpServletRequest req) {
		int affected = service.updateRead_(map);
		List<Map> list = service.selectChatList(map);
		req.setAttribute("list", list);
		
		Map cnoPerson = service.selectCnoPerson(map);
		Map tnoPerson = service.selectTnoPerson(map);
		
		tnoPerson.put("T_PHOTO", tnoPerson.get("T_PHOTO").toString().split("/")[0]);
		req.getSession().setAttribute("id", map.get("id").toString());
		req.setAttribute("cnoPerson", cnoPerson);
		req.setAttribute("tnoPerson", tnoPerson);
		return "android/ChatView";
	}
	
	
}
