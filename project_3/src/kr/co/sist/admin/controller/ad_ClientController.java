package kr.co.sist.admin.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sun.security.ntlm.Client;

import kr.co.sist.admin.domain.ClientDomain;
import kr.co.sist.admin.service.ClientService;
import kr.co.sist.admin.vo.ClientVO;

@Controller
public class ad_ClientController {
	@Autowired
	private ClientService c_service;
	
	//고객서비스 관리
	@RequestMapping(value="mgr_clientService.do",method=GET)
	public String mgr_clientService(Model model, String searchBox) {
		
		List<ClientDomain> AllClientList = null;
		
		if(searchBox == null) {
			AllClientList = c_service.selectAllClient();
		}else {
			AllClientList = c_service.searchClient(searchBox);
		}
		
		model.addAttribute("AllClientList", AllClientList);
		
		return "/ad_content/ad_mgrClientService";
	}//include
	
	/*고객서비스 삭제 페이지*/
	@RequestMapping(value="mgrClient_remove.do",method=GET)
	public String mgrClient_remove(Model model, String selID, HttpServletResponse response, HttpServletRequest request){
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		try {
			PrintWriter out = response.getWriter();
			if(selID == "") {
				out.println("<script>alert('삭제할 문의를 선택해주세요.'); location.href='mgr_clientService.do';</script>");
			}else {
				int cnt = c_service.removeClient(Integer.parseInt(selID.trim()));
				if(cnt == 1) {
					out.println("<script>alert('문의 삭제완료'); location.href='mgr_clientService.do';</script>");
				}else {
					out.println("<script>alert('문의 삭제실패'); history.back();</script>");
				}
			}
			out.flush();
			out.close();
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "/ad_content/ad_mgrClientService";
	}//include
	
	/*이벤트 읽기 페이지*/
	@RequestMapping(value="mgrClient_readFrm.do",method=GET)
	public String mgrClient_readFrm(Model model, String ClientNo){
		ClientDomain readClient = null;
		try {
				readClient = c_service.readClient(Integer.parseInt(ClientNo));
				model.addAttribute("readClient", readClient);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} 
		
		return "/ad_content/ad_mgrClient_readFrm";
	}//include
	
	//고객서비스 등록
	@RequestMapping(value="mgrClient_writeFrm.do",method=GET)
	public String mgrClient_writeFrm(HttpServletResponse response, Model model, ClientVO cv, String cmd, String ClientNo) throws IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			
//			cmd=wc&a_id=Kim&ClientNo=5
			
			ClientDomain readClient = null;
			try {
				if( !"".equals(ClientNo) && "wc".equals(cmd)) {
					readClient = c_service.readClient(Integer.parseInt(ClientNo));
					model.addAttribute("readClient", readClient);
					return "/ad_content/ad_mgrClient_writeFrm";
				}
				
				if( !"".equals(ClientNo) && "wca".equals(cmd)) {
					int cnt = c_service.updateClient(cv);
					if( cnt != 0) {
						readClient = c_service.readClient(Integer.parseInt(ClientNo));
						model.addAttribute("readClient", readClient);
						return "/ad_content/ad_mgrClient_readFrm";
					}
				}
				
			} catch (NumberFormatException e) {
				e.printStackTrace();
			} 
				
		return "/ad_content/ad_mgrClient_writeFrm";
	}//include
	
	
	
}
