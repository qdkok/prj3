package kr.co.sist.admin.service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Component;

import kr.co.sist.admin.dao.HklandAdminDAO;
import kr.co.sist.admin.domain.CouponDomain;
import kr.co.sist.admin.domain.EventDomain;
import kr.co.sist.admin.domain.LostDomain;
import kr.co.sist.admin.domain.TicketDomain;
import kr.co.sist.admin.vo.ClientVO;
import kr.co.sist.admin.vo.CouponVO;
import kr.co.sist.admin.vo.EventVO;
import kr.co.sist.admin.vo.LostVO;
import kr.co.sist.admin.vo.modifyLostVO;

@Component
public class LostService {
	private HklandAdminDAO hk_dao = HklandAdminDAO.getInstance();
	
	/*분실물 전체 조회*/
	public List<LostDomain> selectAllLost(){
		List<LostDomain> AllLostList=null;
		try {
			AllLostList=hk_dao.selectAllLost();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return AllLostList;
	}//selectAllLost
	
	/*분실물 검색 조회*/
	public List<LostDomain> searchLost(String searchBox){
		List<LostDomain> searchLostList=null;
		try {
			searchLostList=hk_dao.searchLost(searchBox);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return searchLostList;
	}//searchLost

	/*분실물 등록*/
	public int insertLost(LostVO lv) {
		int cnt = 0;
		try {
			cnt = hk_dao.insertLost(lv);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return cnt;
	}//insertLost
	
	/*분실물 삭제*/
	public int removeLost(int l_no) {
		int cnt = 0;
		try {
			cnt = hk_dao.removeLost(l_no);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return cnt;
	}//removeLost
	

	/*분실물 상태변경*/
	public int updateLost(modifyLostVO mlv) {
		int cnt = 0;
		try {
			cnt = hk_dao.updateLost(mlv);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return cnt;
	}//updateLost
	
//	/*이벤트 읽기*/
//	public CouponDomain readCoupon(int c_no) {
//		CouponDomain cd = null;
//		try {
//			cd = hk_dao.readCoupon(c_no);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		return cd;
//	}//readCoupon
	
}//class






