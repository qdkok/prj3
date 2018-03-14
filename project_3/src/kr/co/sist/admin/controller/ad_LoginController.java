package kr.co.sist.admin.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import kr.co.sist.admin.dao.HklandAdminDAO;
import kr.co.sist.admin.vo.ad_LoginVO;

@Controller
@SessionAttributes({"a_id","a_name","loginFlag"})
public class ad_LoginController {
	@RequestMapping(value="/ad_login.do",method= {GET,POST})
	public void adminLogin(Model model, ad_LoginVO lvo, HttpSession session, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		HklandAdminDAO ha_dao = HklandAdminDAO.getInstance();
		if(lvo.getA_id()!=null && !"".equals(lvo.getA_id()) && 
				lvo.getA_pw()!=null && !"".equals(lvo.getA_pw())){
			if(ha_dao.LoginAdmin(lvo)) {
				session.setAttribute("loginFlag", 0); //로그인 성공시 0
				String name = ha_dao.LoginName(lvo);
				
				session.setAttribute("a_id", lvo.getA_id());
				session.setAttribute("a_name", name);
				out.println("<script>location.href='ad_home.do';</script>");
			}else {
				out.println("<script>alert('로그인 정보를 다시 확인해주세요!!'); history.back(); </script>");
			}
			out.flush();
			out.close();
		}
	}//include
	
	@RequestMapping(value="/ad_logout.do",method= {GET,POST})
	public String adminLogout(HttpSession session, HttpServletResponse response) throws IOException {
		session.invalidate();
		PrintWriter out = response.getWriter();
		out.println("<script>location.href='ad_index.do';</script>");
		out.flush();
		out.close();
		
		return "ad_index";
	}//include
}
