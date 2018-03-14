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
	@RequestMapping(value="/land_intro.do", method= {RequestMethod.POST, RequestMethod.GET})
	public String intro() {
		return "sub/land_intro";
	}
	@RequestMapping(value="/land_roller.do", method= {RequestMethod.POST, RequestMethod.GET})
	public String roller() {
		return "sub/land_roller";
	}
	@RequestMapping(value="/land_info.do", method= {RequestMethod.POST, RequestMethod.GET})
	public String info() {
		return "sub/land_info";
	}
	@RequestMapping(value="/map.do", method= {RequestMethod.POST, RequestMethod.GET})
	public String map() {
		return "sub/map";
	}
	@RequestMapping(value="/login.do", method= {RequestMethod.POST, RequestMethod.GET})
	public String login() {
		return "sub/login";
	}
	@RequestMapping(value="/join.do", method= {RequestMethod.POST, RequestMethod.GET})
	public String join() {
		return "sub/join";
	}
	@RequestMapping(value="/searchId.do", method= {RequestMethod.POST, RequestMethod.GET})
	public String searchId() {
		return "sub/searchId";
	}
}
