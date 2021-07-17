package com.dogcompany.dogapp.web;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dogcompany.dogapp.service.BackendService;


@Controller
@RequestMapping("/Backend/")
public class BackendController {

	@Autowired
	private BackendService service;
	
	@RequestMapping("Home.do")
	public String goMain() {
		return "backend/admin/Home";
	}
	@RequestMapping("Trainer.do")
	public String goTrainer(Model model, Map map) {
		List<Map> trainerApplyList = service.selectTrainerApplyList();
		List<Map> trainerList = service.selectTrainerList();
		model.addAttribute("trainerApplyList", trainerApplyList);
		model.addAttribute("trainerList", trainerList);
		List<Float> trainerAvgOfRateList = new Vector();
		List<Integer> trainerCountOfReviewList = new Vector();
		for(Map trainer: trainerList) {
			map.put("t_no", trainer.get("T_NO"));
			List<Map> reviewList = service.selectReviewList(map);
			float sumOfRate = 0;
			for(Map review: reviewList) {
				float rate = Float.parseFloat((review.get("TRAINER_RATE").toString()));
				sumOfRate += rate;
			}
			trainerAvgOfRateList.add(sumOfRate/(float)reviewList.size());
			trainerCountOfReviewList.add(reviewList.size());
		}
		model.addAttribute("trainerAvgOfRateList", trainerAvgOfRateList);
		model.addAttribute("trainerCountOfReviewList", trainerCountOfReviewList);
		return "backend/member/Trainer";
	}
	@RequestMapping("member.do")
	public String goMember(Model model, Map map) {
		List<Map> memberList = service.selectMemberList();
		List<Map> managerList = service.selectManagerList();
		model.addAttribute("memberList", memberList);
		model.addAttribute("managerList", managerList);
		return "backend/member/Member";
	}
	@RequestMapping(value = "SelectOneTrainerApply.do",produces = "application/json; charset=UTF-8;")
	public @ResponseBody Map selectOneTrainerApply(@RequestParam Map map, HttpServletRequest req) {
		map = service.selectOneTrainerApply(map);
		return map;
	}
	@RequestMapping(value = "TrainerApplyOk.do",produces = "application/json; charset=UTF-8;")
	public @ResponseBody Map trainerApplyOk(@RequestParam Map map, HttpServletRequest req) {
		int affected = service.trainerApplyOk(map);
		map = service.selectOneTrainer(map);
		return map;
	}
	@RequestMapping(value = "TrainerApplyNo.do",produces = "application/json; charset=UTF-8;")
	public @ResponseBody int trainerApplyNo(@RequestParam Map map, HttpServletRequest req) {
		int affected = service.trainerApplyNo(map);
		return affected;
	}
	@RequestMapping(value = "SelectOneTrainer.do",produces = "application/json; charset=UTF-8;")
	public @ResponseBody Map selectOneTrainer(@RequestParam Map map, HttpServletRequest req) {
		map = service.selectOneTrainer(map);
		List<Map> reviewList = service.selectReviewList(map);
		float sumOfRate = 0;
		for(Map review: reviewList) {
			float rate = Float.parseFloat((review.get("TRAINER_RATE").toString()));
			sumOfRate += rate;
		}
		map.put("trainerAvgOfRate", sumOfRate/(float)reviewList.size());
		map.put("trainerCountOfReview", reviewList.size());
		return map;
	}
	@RequestMapping(value = "TrainerNo.do",produces = "application/json; charset=UTF-8;")
	public @ResponseBody int trainerNo(@RequestParam Map map, HttpServletRequest req) {
		int affected = service.trainerNo(map);
		return affected;
	}
	@RequestMapping(value = "TrainerYes.do",produces = "application/json; charset=UTF-8;")
	public @ResponseBody int trainerYes(@RequestParam Map map, HttpServletRequest req) {
		int affected = service.trainerYes(map);
		return affected;
	}
	@RequestMapping(value = "SelectOneMember.do",produces = "application/json; charset=UTF-8;")
	public @ResponseBody Map selectOneMember(@RequestParam Map map, HttpServletRequest req) {
		map = service.selectOneMember(map);
		return map;
	}
	@RequestMapping(value = "MemberNo.do",produces = "application/json; charset=UTF-8;")
	public @ResponseBody int memberNo(@RequestParam Map map, HttpServletRequest req) {
		int affected = service.memberNo(map);
		return affected;
	}
	@RequestMapping(value = "MemberYes.do",produces = "application/json; charset=UTF-8;")
	public @ResponseBody int memberYes(@RequestParam Map map, HttpServletRequest req) {
		int affected = service.memberYes(map);
		return affected;
	}
	@RequestMapping(value = "ManagerNo.do",produces = "application/json; charset=UTF-8;")
	public @ResponseBody int managerNo(@RequestParam Map map, HttpServletRequest req) {
		int affected = service.managerNo(map);
		return affected;
	}
	@RequestMapping(value = "ManagerYes.do",produces = "application/json; charset=UTF-8;")
	public @ResponseBody int managerYes(@RequestParam Map map, HttpServletRequest req) {
		int affected = service.managerYes(map);
		return affected;
	}
	
	@RequestMapping("Charts.do")
	public String goCharts(Model model, Map map) {
		return "backend/statistics/Charts";
	}
	
	//신고관리
	@RequestMapping("P_Report.do")
	public String goP_Report(Model model, Map map) {
		List<Map> reportList = service.selectP_ReportList();
		model.addAttribute("p_ReportList", reportList);
		return "backend/report/P_Report";
	}
	@RequestMapping("SelectOneP_Report.do")
	public @ResponseBody Map goSelectOneP_Report(Map map) {
		map = service.selectOneP_Report(map);
		return map;
	}
	
	@RequestMapping("R_Report.do")
	public String goR_Report(Model model, Map map) {
		List<Map> reportList = service.selectR_ReportList();
		model.addAttribute("r_ReportList", reportList);
		return "backend/report/R_Report";
	}
	@RequestMapping("SelectOneR_Report.do")
	public @ResponseBody Map goSelectOneR_Report(Map map) {
		map = service.selectOneR_Report(map);
		return map;
	}
	
}
