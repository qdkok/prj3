package kr.co.sist.admin.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.sist.admin.dao.HklandAdminDAO;
import kr.co.sist.admin.domain.NoticeDomain;
import kr.co.sist.admin.service.AdminService;
import kr.co.sist.admin.vo.ad_NoticeVO;

@Controller
public class ad_PageController {
	@Autowired
	private AdminService service;
	
	@RequestMapping(value="mgr_customer.do",method= {POST,GET})
	public String mgr_customer(String selID,String searchID) {
		System.out.println(selID);
		return "/ad_content/ad_mgrCustomer";
	}//include
	
	/* �������װ��� ������ Controller*/
	@RequestMapping(value="mgr_notice.do",method=GET)
	public String mgr_notice(Model model, String searchBox) {
		
		HklandAdminDAO ha_dao = HklandAdminDAO.getInstance();
		List<NoticeDomain> AllNoticeList = null;
		try {
			if(searchBox == null) {
				AllNoticeList = ha_dao.selectAllNotice();
			}else {
				AllNoticeList = ha_dao.searchNotice(searchBox);
			}
			model.addAttribute("AllNoticeList", AllNoticeList);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "/ad_content/ad_mgrNotice";
	}//include
	
	/*�������� �ۼ� ������*/
	@RequestMapping(value="mgrNotice_writeFrm.do",method=GET)
	public String mgrNotice_writeFrm(HttpServletResponse response, Model model, ad_NoticeVO nvo, String cmd, String editordata) throws IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		HklandAdminDAO ha_dao = HklandAdminDAO.getInstance();
			if("w".equals(cmd)) {
				PrintWriter out = response.getWriter();
				int cnt = ha_dao.insertNotice(nvo);
				if(cnt != 0) {
					out.println("<script>alert('�������� ��ϿϷ�'); location.href='mgr_notice.do';</script>");
				}else {
					out.println("<script>alert('�������� ��Ͻ���'); location.href='history.back()';</script>");
				}
				out.flush();
				out.close();
			}
		return "/ad_content/ad_mgrNotice_writeFrm";
	}//include
	
	/*�������� �б� ������*/
	@RequestMapping(value="mgrNotice_readFrm.do",method=GET)
	public String mgrNotice_readFrm(Model model, String noticeNo){
		HklandAdminDAO ha_dao = HklandAdminDAO.getInstance();
		NoticeDomain readNotice = null;
		try {
			readNotice = ha_dao.readNotice(Integer.parseInt(noticeNo));
			model.addAttribute("readNotice", readNotice);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "/ad_content/ad_mgrNotice_readFrm";
	}//include
	
	/*�������� ���� ������*/
	@RequestMapping(value="mgr_notice_readFrm_modif.do",method=GET)
	public String mgrNotice_readFrm_modif(Model model, ad_NoticeVO nvo, HttpServletResponse response, HttpServletRequest request){
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		HklandAdminDAO ha_dao = HklandAdminDAO.getInstance();
		try {
			PrintWriter out = response.getWriter();
			int cnt = ha_dao.updateNotice(nvo);
			if(cnt == 1) {
				out.println("<script>alert('�������� �����Ϸ�'); location.href='mgr_notice.do';</script>");
			}else {
				out.println("<script>alert('�������� ��������'); history.back();</script>");
			}
			out.flush();
			out.close();
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "/ad_content/ad_mgrNotice";
	}//include
	
	/*�������� ���� ������*/
	@RequestMapping(value="mgrNotice_remove.do",method=GET)
	public String mgr_notice_remove(Model model,String selID, HttpServletResponse response, HttpServletRequest request){
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		HklandAdminDAO ha_dao = HklandAdminDAO.getInstance();
		try {
			PrintWriter out = response.getWriter();
			if(selID != "") {
				int cnt = ha_dao.removeNotice(Integer.parseInt(selID.trim()));
				if(cnt == 1) {
					out.println("<script>alert('�������� �����Ϸ�'); location.href='mgr_notice.do';</script>");
				}else {
					out.println("<script>alert('�������� ��������'); history.back();</script>");
				}
			}else {
				out.println("<script>alert('������ ���������� üũ���ּ���.'); location.href='mgr_notice.do';</script>");
			}
			
			out.flush();
			out.close();
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "/ad_content/ad_mgrNotice";
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
	
	@RequestMapping(value="Voucher_write_process.do",method=POST)
	public String writeProcess(HttpServletRequest request,Model model) {
		//�Ķ������ ��ȿ�� ����
		//���������� ó��
		boolean flag=service.insertUtilize(request);
		//ó������� view�� ������ ���� model�� �Ӽ����� ����
		model.addAttribute("upload_result",flag);
		
		return "/ad_content/ad_mgrVoucher_write_process";
	}//main
	
}
