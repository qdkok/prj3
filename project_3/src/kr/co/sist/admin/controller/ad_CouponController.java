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
import kr.co.sist.admin.service.CouponService;
import kr.co.sist.admin.vo.CouponVO;

@Controller
public class ad_CouponController {
	@Autowired
	private CouponService c_service;
	
	//�̺�Ʈ ����
	@RequestMapping(value="mgr_coupon.do",method=GET)
	public String mgr_coupon(Model model, String searchBox) {
		
		List<CouponDomain> AllCouponList = null;
		
		if(searchBox == null) {
			AllCouponList = c_service.selectAllCoupon();
		}else {
			AllCouponList = c_service.searchCoupon(searchBox);
		}
		
		model.addAttribute("AllCouponList", AllCouponList);
		
		return "/ad_content/ad_mgrCoupon";
	}//include
	
	//�̺�Ʈ ���
	@RequestMapping(value="mgr_coupon_writeFrm.do",method=GET)
	public String mgr_coupon_writeFrm(HttpServletResponse response, Model model, CouponVO cv, String cmd) throws IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			if( cmd.equals("w")) {
				return "/ad_content/ad_mgrCoupon_writeFrm";
			}
			
			int cnt = c_service.insertCoupon(cv);
			
			if(cnt != 0) {
				out.println("<script>alert('���� ��ϿϷ�'); location.href='mgr_coupon.do';</script>");
			}else {
				out.println("<script>alert('���� ��Ͻ���'); location.href='history.back()';</script>");
			}

			out.flush();
			out.close();
				
		return "/ad_content/ad_mgrCoupon_writeFrm";
	}//include
	
	/*���� ���� ������*/
	@RequestMapping(value="mgrCoupon_remove.do",method=GET)
	public String mgrCoupon_remove(Model model, String selID, HttpServletResponse response, HttpServletRequest request){
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		try {
			PrintWriter out = response.getWriter();
			if(selID == "") {
				out.println("<script>alert('������ ������ �������ּ���.'); location.href='mgr_coupon.do';</script>");
			}else {
				int cnt = c_service.removeCoupon(Integer.parseInt(selID.trim()));
				if(cnt == 1) {
					out.println("<script>alert('���� �����Ϸ�'); location.href='mgr_coupon.do';</script>");
				}else {
					out.println("<script>alert('���� ��������'); history.back();</script>");
				}
			}
			out.flush();
			out.close();
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "/ad_content/ad_mgrCoupon";
	}//include

	/*�̺�Ʈ �б� ������*/
	@RequestMapping(value="mgrCoupon_readFrm.do",method=GET)
	public String mgrCoupon_readFrm(Model model, String CouponNo){
		CouponDomain readCoupon = null;
		try {
			readCoupon = c_service.readCoupon(Integer.parseInt(CouponNo));
			model.addAttribute("readCoupon", readCoupon);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} 
		
		return "/ad_content/ad_mgrCoupon_readFrm";
	}//include

	
	//	
//	@RequestMapping(value="mgr_clientService.do",method=GET)
//	public String mgr_clientService() {
//		return "/ad_content/ad_mgrClientService";
//	}//include
//	

}
