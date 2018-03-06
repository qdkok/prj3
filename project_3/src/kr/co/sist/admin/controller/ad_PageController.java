package kr.co.sist.admin.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ad_PageController {

	@RequestMapping(value="mgr_customer.do",method=GET)
	public String mgr_customer() {
		return "/ad_content/ad_mgrCustomer";
	}//include
	
	@RequestMapping(value="mgr_notice.do",method=GET)
	public String mgr_notice() {
		return "/ad_content/ad_mgrNotice";
	}//include
	
	@RequestMapping(value="mgr_event.do",method=GET)
	public String mgr_event() {
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
	
	@RequestMapping(value="mgr_voucher.do",method=GET)
	public String mgr_voucher() {
		return "/ad_content/ad_mgrVoucher";
	}//include
	
	@RequestMapping(value="mgr_profit.do",method=GET)
	public String mgr_profit() {
		return "/ad_content/ad_mgrProfit";
	}//include
	
}
