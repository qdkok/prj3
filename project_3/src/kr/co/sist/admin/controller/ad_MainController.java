package kr.co.sist.admin.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class ad_MainController {
		
	@RequestMapping(value="/index2.do",method=GET)
	public String index2() {
		return "index";
	}
	
	@RequestMapping(value="/ad_index.do",method=GET)
	public String index() {
		return "ad_home";
	}
	
	@RequestMapping(value="/common/leftArea.do",method=GET)
	public String leftArea() {
		return "/ad_common/ad_leftArea";
	}//include
	
}
