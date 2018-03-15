package kr.co.sist.admin.service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Component;

import kr.co.sist.admin.dao.HklandAdminDAO;
import kr.co.sist.admin.domain.ClientDomain;
import kr.co.sist.admin.domain.CouponDomain;
import kr.co.sist.admin.domain.EventDomain;
import kr.co.sist.admin.domain.LostDomain;
import kr.co.sist.admin.domain.TicketDomain;
import kr.co.sist.admin.vo.ClientVO;
import kr.co.sist.admin.vo.CouponVO;
import kr.co.sist.admin.vo.EventVO;
import kr.co.sist.admin.vo.LostVO;

@Component
public class ClientService {
	private HklandAdminDAO hk_dao = HklandAdminDAO.getInstance();
	
	/*������ ��ü ��ȸ*/
	public List<ClientDomain> selectAllClient(){
		List<ClientDomain> AllClientList=null;
		try {
			AllClientList=hk_dao.selectAllClient();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return AllClientList;
	}//selectAllClient
	
	/*������ �˻� ��ȸ*/
	public List<ClientDomain> searchClient(String searchBox){
		List<ClientDomain> searchClientList=null;
		try {
			searchClientList=hk_dao.searchClient(searchBox);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return searchClientList;
	}//searchClient
	
	/*������ ����*/
	public int removeClient(int s_no) {
		int cnt = 0;
		try {
			cnt = hk_dao.removeClient(s_no);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return cnt;
	}//removeClient
	
	/*������ �б�*/
	public ClientDomain readClient(int s_no) {
		ClientDomain cd = null;
		try {
			cd = hk_dao.readClient(s_no);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return cd;
	}//readClient
	
	/*������ �亯*/
	public int updateClient(ClientVO cv) {
		int cnt = 0;
		try {
			cnt = hk_dao.updateClient(cv);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return cnt;
	}//updateClient
	
//	/*�нǹ� ���*/
//	public int insertLost(LostVO lv) {
//		int cnt = 0;
//		try {
//			cnt = hk_dao.insertLost(lv);
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		return cnt;
//	}//insertLost

	
}//class






