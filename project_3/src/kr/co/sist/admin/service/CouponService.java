package kr.co.sist.admin.service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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
	
	/*이벤트 삭제*/
	public int removeCoupon(int c_no) {
		int cnt = 0;
		try {
			cnt = hk_dao.removeCoupon(c_no);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return cnt;
	}//removeCoupon
	
	/*이벤트 읽기*/
	public CouponDomain readCoupon(int c_no) {
		CouponDomain cd = null;
		try {
			cd = hk_dao.readCoupon(c_no);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return cd;
	}//readCoupon
	
}//class






