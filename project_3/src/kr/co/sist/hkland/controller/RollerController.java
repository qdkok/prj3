package kr.co.sist.hkland.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.sist.hkland.domain.RideDomain;
import kr.co.sist.service.DetailService;


@Controller
public class RollerController {
	@RequestMapping(value="detail_roller.do",method=RequestMethod.GET)
	public String Roller(String number,Model model) {
		DetailService ds=new DetailService();
		RideDomain rd = ds.detailservice(number);
		model.addAttribute("details",rd);
		return "sub/detail_roller";
	}
	
	@RequestMapping(value="/preference_coupon.do", method= {RequestMethod.POST, RequestMethod.GET})
	   public String preference() {
	      return "sub/preference_coupon";
	   }
	   
	   @RequestMapping(value="/coupon_download.do", method= {RequestMethod.POST, RequestMethod.GET})
	   public String coupon() {
	      return "sub/coupon_download";
	   }
	
}
