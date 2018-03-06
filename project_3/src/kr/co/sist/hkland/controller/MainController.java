package kr.co.sist.hkland.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {
	@RequestMapping(value="/index.do",method= {RequestMethod.GET, RequestMethod.POST})
	public String mainPage() {
		return "index";
	}
	@RequestMapping(value = "/sub_menu.do" , method= RequestMethod.GET)
	public String subMenu() {
		return "sub/sub_menu";
	}
}
