package kr.co.sist.admin.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.sist.admin.dao.HklandAdminDAO;
import kr.co.sist.admin.domain.NoticeDomain;
import kr.co.sist.admin.vo.ad_NoticeVO;

@Controller
public class ad_EventController {
	
	@RequestMapping(value="mgr_event.do",method=GET)
	public String mgr_event() {
		System.out.println("event 페이지 호출");
		return "/ad_content/ad_mgrEvent";
	}//include

	@RequestMapping(value="mgr_coupon.do",method=GET)
	public String mgr_coupon() {
		return "/ad_content/ad_mgrCoupon";
	}//include
	
	@RequestMapping(value="mgr_lostArticle.do",method=GET)
	public String mgr_lostArticle() {
		return "/ad_content/ad_mgrLostArticle";
	}//include
	
	@RequestMapping(value="mgr_clientService.do",method=GET)
	public String mgr_clientService() {
		return "/ad_content/ad_mgrClientService";
	}//include
	

}
