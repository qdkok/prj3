package kr.co.sist.admin.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.sist.admin.domain.ProfitDomain;
import kr.co.sist.admin.service.ProfitService;

@Controller
public class ad_ProfitController {
	@Autowired
	private ProfitService p_service;
	
	//이벤트 관리
	@RequestMapping(value="mgr_profit.do",method=GET)
	public String mgr_profit(Model model, String d_year) {
		List<ProfitDomain> AllProfitList = null;
			AllProfitList = p_service.selectAllProfit(d_year);
			
		model.addAttribute("AllProfitList", AllProfitList);
		
		return "/ad_content/ad_mgrProfit";
	}//include
	
}
