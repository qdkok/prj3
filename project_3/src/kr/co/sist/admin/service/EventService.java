package kr.co.sist.admin.service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Component;

import kr.co.sist.admin.dao.HklandAdminDAO;
import kr.co.sist.admin.domain.EventDomain;
import kr.co.sist.admin.vo.EventVO;

@Component
public class EventService {
	private HklandAdminDAO hk_dao = HklandAdminDAO.getInstance();
	
	/*이벤트 전체 조회*/
	public List<EventDomain> selectAllEvent(){
		List<EventDomain> AllEventList=null;
		try {
			AllEventList=hk_dao.selectAllEvent();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return AllEventList;
	}//selectAllEvent
	
	/*이벤트 검색 조회*/
	public List<EventDomain> searchEvent(String searchBox){
		List<EventDomain> searchEventList=null;
		try {
			searchEventList=hk_dao.searchEvent(searchBox);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return searchEventList;
	}//searchEvent
	
	/*이벤트 등록*/
	public int insertEvent(EventVO ev) {
		int cnt = 0;
		try {
			cnt = hk_dao.insertEvent(ev);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return cnt;
	}//insertEvent
	
	/*이벤트 삭제*/
	public int removeEvent(int e_no) {
		int cnt = 0;
		try {
			cnt = hk_dao.removeEvent(e_no);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	/*이벤트 읽기*/
	public EventDomain readEvent(int e_no) {
		EventDomain ed = null;
		try {
			ed = hk_dao.readEvent(e_no);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return ed;
	}
	
}//class






