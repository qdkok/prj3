package kr.co.sist.admin.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.sist.admin.service.AdminService;

@Controller
public class ad_PageController {
	@Autowired
	private AdminService service;
	
	@RequestMapping(value="mgr_customer.do",method= {POST,GET})
	public String mgr_customer(String selID,String searchID) {
		System.out.println(selID);
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
	public String mgr_voucher(String selVoucher, Model model) {
		if(!"".equals(selVoucher)&&selVoucher!=null){
			//model.addAttribute("delvoucher", service.delVoucher(selVoucher));
			service.delVoucher(selVoucher);
		}//end if
		model.addAttribute("voucher", service.voucher());
		return "/ad_content/ad_mgrVoucher";
	}//include
	
	@RequestMapping(value="ad_mgrVoucher_write_frm.do",method=GET)
	public String ad_mgrVoucher_write_frm(String selVoucher,Model model) {
		if(!"".equals(selVoucher)&&selVoucher!=null){
			model.addAttribute("load", service.selUtilize(selVoucher));
		}//end if
		model.addAttribute("ticket", service.ticket());
		return "/ad_content/ad_mgrVoucher_write_frm";
	}//include
	
	@RequestMapping(value="mgr_profit.do",method=GET)
	public String mgr_profit() {
		return "/ad_content/ad_mgrProfit";
	}//include
	
	@RequestMapping(value="Voucher_write_process.do",method=POST)
	public String writeProcess(HttpServletRequest request,Model model) {
		//파라메터의 유효성 검증
		//업무로직에 처리
		boolean flag=service.insertUtilize(request);
		//처리결과를 view로 보내기 위해 model의 속성으로 저장
		model.addAttribute("upload_result",flag);
		
		return "/ad_content/ad_mgrVoucher_write_process";
	}//main
	
}
