package com.dogcompany.dogapp.web;

import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dogcompany.dogapp.model.CareDTO;
import com.dogcompany.dogapp.service.CareService;
import com.dogcompany.dogapp.service.ChatService;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/Chat/")
public class ChatController {
	@Autowired
	private ChatService service;
	
	@Autowired
	private CareService serviceCare;
	
	
	@RequestMapping("ChatMain.do")
	public String chat(@RequestParam Map map, HttpServletRequest req) {
		map.put("id", req.getSession().getAttribute("id"));
		
		List<Map> cnoList = service.selectCnoList(map);
		List<Map> tnoList = service.selecttnoList(map);
		
		Collections.sort(cnoList, new Comparator<Map>() {
			@Override
			public int compare(Map o1, Map o2) {
				return Integer.parseInt(o2.get("CHAT_NO").toString()) - Integer.parseInt(o1.get("CHAT_NO").toString());
			}
		});
		Collections.sort(tnoList, new Comparator<Map>() {
			@Override
			public int compare(Map o1, Map o2) {
				return Integer.parseInt(o2.get("CHAT_NO").toString())- Integer.parseInt(o1.get("CHAT_NO").toString());
			}
		});
		req.setAttribute("cnoList", cnoList);
		req.setAttribute("tnoList", tnoList);
		return "dogapp/chat/ChatMain";
	}
	@RequestMapping("ChatView.do")
	public String chatView(@RequestParam Map map, HttpServletRequest req) {
		map.put("id", req.getSession().getAttribute("id"));
		int affected = service.updateRead_(map);
		List<Map> list = service.selectChatList(map);
		req.setAttribute("list", list);
		
		Map cnoPerson = service.selectCnoPerson(map);
		Map tnoPerson = service.selectTnoPerson(map);
		
		tnoPerson.put("T_PHOTO", tnoPerson.get("T_PHOTO").toString().split("/")[0]);
		req.setAttribute("cnoPerson", cnoPerson);
		req.setAttribute("tnoPerson", tnoPerson);
		
		CareDTO record = serviceCare.selectOne(map);
		req.setAttribute("record", record);
		
		String[] images = record.getCare_images().split("/");
		req.setAttribute("care_images", images);
		
		
		Map trainer = serviceCare.selectTrainerOne(map);
		trainer.put("T_CONTENT", (trainer.get("T_CONTENT").toString().replace("\r\n", "<br/>")));
		String[] trainer_images = trainer.get("T_PHOTO").toString().split("/");
		
		List<Map> reviewList = serviceCare.selectReviewList(map);
		float avgOfRate = 0;
		float sumOfRate = 0;
		for(Map review: reviewList) {
			float rate = Float.parseFloat((review.get("TRAINER_RATE").toString()));
			sumOfRate += rate;
		}
		avgOfRate = sumOfRate/(float)reviewList.size();
		req.setAttribute("trainer_images", trainer_images);
		req.setAttribute("trainer", trainer);
		req.setAttribute("reviewList", reviewList);
		req.setAttribute("avgOfRate", avgOfRate);
		
		return "dogapp/chat/ChatView";
	}
	@RequestMapping(value = "Chat.do",produces = "text/html; charset=UTF-8;")
	public @ResponseBody String execute(@RequestParam Map map, HttpServletRequest req) {
		String care_no_id = service.selectIdByCareNo(map);
		String t_no_id = service.selectIdByTNo(map);
		boolean flag = false;
		if("true".equalsIgnoreCase(map.get("read").toString())) map.put("read_", "0");
		else map.put("read_", "1");
		
		map.put("from_id", req.getSession().getAttribute("id"));
		int affected = service.insertChatMessage(map);
		if(affected == 1) flag = true;
		
		
		return req.getSession().getAttribute("id").toString().equalsIgnoreCase(t_no_id)?care_no_id:t_no_id;
	}
	@RequestMapping(value = "ChatUpdateRead.do",produces = "text/html; charset=UTF-8;")
	public @ResponseBody String chatUpdateRead(@RequestParam Map map, HttpServletRequest req) {
		boolean flag = false;
		map.put("id", req.getSession().getAttribute("id"));
		int affected = service.updateRead_(map);
		if(affected == 1) flag = true;
		return String.valueOf(flag);
	}
	@RequestMapping(value = "CnoChatList.do",produces = "application/json; charset=UTF-8;")
	public @ResponseBody List cnoChatList(@RequestParam Map map, HttpServletRequest req) {
		map.put("id", req.getSession().getAttribute("id"));
		List<Map> cnoList = service.selectCnoList(map);

		return cnoList;
	}
	
	@RequestMapping(value = "ChatStateChange.do",produces = "application/json; charset=UTF-8;")
	public @ResponseBody String chatStateChange(@RequestParam Map map, HttpServletRequest req) {
		int affected = service.updateState(map);
		
		return String.valueOf(affected);
	}
	
}
