package kr.co.sist.hkland.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.sist.hkland.service.HklandService;

@Controller
public class MainController {
	@Autowired
	private HklandService service;
	
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
	public String login(String id,String pw,HttpSession session, Model model) {

		service.login(id,pw,session);
		return "sub/login";
	}
	@RequestMapping(value="/logout.do", method= {RequestMethod.POST, RequestMethod.GET})
	public void logout(String id,String pw,HttpSession session, Model model, HttpServletResponse response) {
		//세션을 삭제해 로그아웃
		session.invalidate();
		try {
			response.sendRedirect("index.do");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	@RequestMapping(value="/idChk.do", method= {RequestMethod.POST, RequestMethod.GET})
	public @ResponseBody String idchk(String id,Model model) {
		String idChk=service.idChk(id);
		System.out.println("컨트롤러수행");
		return idChk;
	}
	@RequestMapping(value="/join.do", method= {RequestMethod.POST, RequestMethod.GET})
	public String join() {
		return "sub/join";
	}
	
	@RequestMapping(value="/join_process.do", method= {RequestMethod.POST, RequestMethod.GET})
	public String join_process(HttpServletRequest request, Model model) {
		model.addAttribute("join_flag", service.join(request));
		
		return "sub/join_process";
	}
	
	@RequestMapping(value="/join_terms.do", method= {RequestMethod.POST, RequestMethod.GET})
	public String join_terms() {
		return "sub/join_terms";
	}
	@RequestMapping(value="/searchId.do", method= {RequestMethod.POST, RequestMethod.GET})
	public String searchId() {
		return "sub/searchId";
	}
	@RequestMapping(value="/sub_menu_ticket_value.do", method= {RequestMethod.POST, RequestMethod.GET})
	public String ticket() {
		return "sub/sub_menu_ticket_value";
	}
	@RequestMapping(value="/sub_menu_ticket_reservation.do", method= {RequestMethod.POST, RequestMethod.GET})
	public String ticketDetail() {
		return "sub/sub_menu_ticket_reservation";
	}
}
