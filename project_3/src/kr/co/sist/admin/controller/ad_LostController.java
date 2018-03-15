package kr.co.sist.admin.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.sist.admin.domain.CouponDomain;
import kr.co.sist.admin.domain.LostDomain;
import kr.co.sist.admin.service.CouponService;
import kr.co.sist.admin.service.LostService;
import kr.co.sist.admin.vo.CouponVO;
import kr.co.sist.admin.vo.LostVO;
import kr.co.sist.admin.vo.modifyLostVO;

@Controller
public class ad_LostController {
	@Autowired
	private LostService a_service;
	
	//분실물 관리
	@RequestMapping(value="mgr_lostArticle.do",method=GET)
	public String mgr_lostArticle(Model model, String searchBox, String l_result, modifyLostVO mlv) {
		
		List<LostDomain> AllLostList = null;
		
		if( l_result != null ) {
			a_service.updateLost(mlv);
		}
		
		if(searchBox == null) {
			AllLostList = a_service.selectAllLost();
		}else {
			AllLostList = a_service.searchLost(searchBox);
		}
		
		model.addAttribute("AllLostList", AllLostList);
		
		return "/ad_content/ad_mgrLostArticle";
	}//include
	
	//분실물 등록
	@RequestMapping(value="mgr_lost_writeFrm.do",method=GET)
	public String mgr_lost_writeFrm(HttpServletResponse response, Model model, LostVO lv, String cmd) throws IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			if( cmd.equals("w")) {
				return "/ad_content/ad_mgrLost_writeFrm";
			}
			int cnt = a_service.insertLost(lv);
			if(cnt != 0) {
				out.println("<script>alert('분실물 등록완료'); location.href='mgr_lostArticle.do';</script>");
			}else {
				out.println("<script>alert('분실물 등록실패'); location.href='history.back()';</script>");
			}
			out.flush();
			out.close();
				
		return "/ad_content/ad_mgrLost_writeFrm";
	}//include
	
	/*쿠폰 삭제 페이지*/
	@RequestMapping(value="mgrLost_remove.do",method=GET)
	public String mgrLost_remove(Model model, String selID, HttpServletResponse response, HttpServletRequest request){
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		try {
			PrintWriter out = response.getWriter();
			if(selID == "") {
				out.println("<script>alert('삭제할 분실물을 선택해주세요.'); location.href='mgr_lostArticle.do';</script>");
			}else {
				int cnt = a_service.removeLost(Integer.parseInt(selID.trim()));
				if(cnt == 1) {
					out.println("<script>alert('분실물을 삭제완료'); location.href='mgr_lostArticle.do';</script>");
				}else {
					out.println("<script>alert('분실물을 삭제실패'); history.back();</script>");
				}
			}
			out.flush();
			out.close();
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "/ad_content/ad_mgrLostArticle";
	}//include

	
//	mgr_lostArticle
	
	
	
	
	
	
	
//	/*이벤트 읽기 페이지*/
//	@RequestMapping(value="mgrCoupon_readFrm.do",method=GET)
//	public String mgrCoupon_readFrm(Model model, String CouponNo){
//		CouponDomain readCoupon = null;
//		try {
//			readCoupon = c_service.readCoupon(Integer.parseInt(CouponNo));
//			model.addAttribute("readCoupon", readCoupon);
//		} catch (NumberFormatException e) {
//			e.printStackTrace();
//		} 
//		
//		return "/ad_content/ad_mgrCoupon_readFrm";
//	}//include
//	
//	
//	
//	
//	
//
//	
//	@RequestMapping(value="mgr_lostArticle.do",method=GET)
//	public String mgr_lostArticle() {
//		return "/ad_content/ad_mgrLostArticle";
//	}//include
//	
//	@RequestMapping(value="mgr_clientService.do",method=GET)
//	public String mgr_clientService() {
//		return "/ad_content/ad_mgrClientService";
//	}//include
//	

}
