package kr.co.sist.admin.service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Component;

import kr.co.sist.admin.dao.HklandAdminDAO;
import kr.co.sist.admin.domain.CouponDomain;
import kr.co.sist.admin.domain.EventDomain;
import kr.co.sist.admin.vo.CouponVO;
import kr.co.sist.admin.vo.EventVO;

@Component
public class CouponService {
	private HklandAdminDAO hk_dao = HklandAdminDAO.getInstance();
	
	/*���� ��ü ��ȸ*/
	public List<CouponDomain> selectAllCoupon(){
		List<CouponDomain> AllCouponList=null;
		try {
			AllCouponList=hk_dao.selectAllCoupon();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return AllCouponList;
	}//selectAllEvent
	
	/*���� �˻� ��ȸ*/
	public List<CouponDomain> searchCoupon(String searchBox){
		List<CouponDomain> searchCouponList=null;
		try {
			searchCouponList=hk_dao.searchCoupon(searchBox);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return searchCouponList;
	}//searchEvent

	/*���� ���*/
	public int insertCoupon(CouponVO cv) {
		int cnt = 0;
		try {
			cnt = hk_dao.insertCoupon(cv);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return cnt;
	}//insertEvent
	
//	/*�̺�Ʈ ����*/
//	public int removeEvent(int e_no) {
//		int cnt = 0;
//		try {
//			cnt = hk_dao.removeEvent(e_no);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		return cnt;
//	}
//	
//	/*�̺�Ʈ �б�*/
//	public EventDomain readEvent(int e_no) {
//		EventDomain ed = null;
//		try {
//			ed = hk_dao.readEvent(e_no);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		return ed;
//	}
	
}//class






