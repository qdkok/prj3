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

import kr.co.sist.admin.domain.EventDomain;
import kr.co.sist.admin.service.EventService;
import kr.co.sist.admin.vo.EventVO;

@Controller
public class ad_EventController {
	@Autowired
	private EventService e_service;
	
	//이벤트 관리
	@RequestMapping(value="mgr_event.do",method=GET)
	public String mgr_event(Model model, String searchBox) {
		
		List<EventDomain> AllEventList = null;
		
		if(searchBox == null) {
			AllEventList = e_service.selectAllEvent();
		}else {
			AllEventList = e_service.searchEvent(searchBox);
		}
		
		model.addAttribute("AllEventList", AllEventList);
		
		return "/ad_content/ad_mgrEvent";
	}//include
	
	//이벤트 등록
	@RequestMapping(value="mgr_event_writeFrm.do",method=GET)
	public String mgr_event_writeFrm(HttpServletResponse response, Model model, EventVO ev, String cmd) throws IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			if( cmd.equals("w")) {
				return "/ad_content/ad_mgrEvent_writeFrm";
			}
			
			int cnt = e_service.insertEvent(ev);
			
			if(cnt != 0) {
				out.println("<script>alert('이벤트 등록완료'); location.href='mgr_event.do';</script>");
			}else {
				out.println("<script>alert('이벤트 등록실패'); location.href='history.back()';</script>");
			}

			out.flush();
			out.close();
				
		return "/ad_content/ad_mgrEvent_writeFrm";
	}//include
	
	/*이벤트 삭제 페이지*/
	@RequestMapping(value="mgrEvent_remove.do",method=GET)
	public String mgrEvent_remove(Model model, String selID, HttpServletResponse response, HttpServletRequest request){
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		try {
			PrintWriter out = response.getWriter();
			if(selID == "") {
				out.println("<script>alert('삭제할 이벤트를 선택해주세요.'); location.href='mgr_event.do';</script>");
			}else {
				int cnt = e_service.removeEvent(Integer.parseInt(selID.trim()));
				if(cnt == 1) {
					out.println("<script>alert('이벤트 삭제완료'); location.href='mgr_event.do';</script>");
				}else {
					out.println("<script>alert('이벤트 삭제실패'); history.back();</script>");
				}
			}
			out.flush();
			out.close();
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "/ad_content/ad_mgrEvent";
	}//include

	/*이벤트 읽기 페이지*/
	@RequestMapping(value="mgrEvent_readFrm.do",method=GET)
	public String mgrNotice_readFrm(Model model, String EventNo){
		EventDomain readEvent = null;
		try {
			readEvent = e_service.readEvent(Integer.parseInt(EventNo));
			model.addAttribute("readEvent", readEvent);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} 
		
		return "/ad_content/ad_mgrEvent_readFrm";
	}//include
	
	
}
