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
	
	/*쿠폰 전체 조회*/
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
	
	/*쿠폰 검색 조회*/
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

	/*쿠폰 등록*/
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
	
//	/*이벤트 삭제*/
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
//	/*이벤트 읽기*/
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






