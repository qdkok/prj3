package kr.co.sist.hkland.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;

import kr.co.sist.hkland.dao.HklandDAO;
import kr.co.sist.hkland.domain.UtilizeDomain;
import kr.co.sist.hkland.vo.LoginIdVO;
import kr.co.sist.hkland.vo.ReservationVO;
import kr.co.sist.hkland.vo.JoinVO;

@Component
public class HklandService {
	private HklandDAO hk_dao=HklandDAO.getInstance();
	
	public void login(String id,String pw,HttpSession session) {
		String name=null;
		try {
			
			if(id!=null&&pw!=null) {
				LoginIdVO lv =new LoginIdVO(id, pw);
				name=hk_dao.login(lv);
				if(name==null) {
					name="";
					id="";
				}
				session.setAttribute("name", name);
				session.setAttribute("id", id);
			}//end if
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public String idChk(String id) {
		String data=null;
		try {
			data=hk_dao.idChk(id);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return data;
	}
	
	//회원가입 서비스
	public boolean join(HttpServletRequest request) {
		boolean flag=false;
		try {
			String birth=request.getParameter("year")+"-"+request.getParameter("month")+"-"+request.getParameter("day");
			String email=request.getParameter("Email")+"@"+request.getParameter("Email2");
			String phone=request.getParameter("sel")+"-"+request.getParameter("ph1")+"-"+request.getParameter("ph2");
			JoinVO mv=new JoinVO(request.getParameter("id"), request.getParameter("pw"), request.getParameter("name"),request.getParameter("gender"), birth, email, phone);
			if(hk_dao.join(mv)==1) {
				flag=true;
			}//end if
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return flag;
	}//memberInsert
	
	public List<UtilizeDomain> showUtilize(){
		List<UtilizeDomain> list=null;
		try {
			list=hk_dao.showUtilize();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return list;
	}//showUtilize
	
	public UtilizeDomain showDetailUtilize(String u_no){
		UtilizeDomain list=null;
		try {
			list=hk_dao.showDetailUtilize(u_no);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return list;
	}//showDetailUtilize
	
	public boolean insertReservation(HttpServletRequest request) {
		boolean flag=false;
		try {
			ReservationVO rvo=new ReservationVO(request.getParameter("id"), request.getParameter("u_no"), Integer.parseInt(request.getParameter("ticket_cnt")));
			if(hk_dao.insertReservation(rvo)==1) {
				flag=true;
			}//end if
		} catch (IOException e) {
			e.printStackTrace();
		}
		return flag;
	}
}
