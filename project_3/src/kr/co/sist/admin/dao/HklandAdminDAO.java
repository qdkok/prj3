package kr.co.sist.admin.dao;

import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.co.sist.admin.domain.ClientDomain;
import kr.co.sist.admin.domain.CouponDomain;
import kr.co.sist.admin.domain.EventDomain;
import kr.co.sist.admin.domain.LostDomain;
import kr.co.sist.admin.domain.MemberDomain;
import kr.co.sist.admin.domain.NoticeDomain;
import kr.co.sist.admin.domain.ProfitDomain;
import kr.co.sist.admin.domain.TicketDomain;
import kr.co.sist.admin.domain.UtilizeDomain;
import kr.co.sist.admin.domain.VoucherDomain;
import kr.co.sist.admin.vo.ClientVO;
import kr.co.sist.admin.vo.CouponVO;
import kr.co.sist.admin.vo.EventVO;
import kr.co.sist.admin.vo.LostVO;
import kr.co.sist.admin.vo.UtilizeUpdateVO;
import kr.co.sist.admin.vo.UtilizeVO;
import kr.co.sist.admin.vo.ad_LoginVO;
import kr.co.sist.admin.vo.ad_NoticeVO;
import kr.co.sist.admin.vo.modifyLostVO;

public class HklandAdminDAO {
	private static HklandAdminDAO embd;
	private static SqlSessionFactory ssf;

	private HklandAdminDAO() {

	}// ExamMyBatisDAO

	public static HklandAdminDAO getInstance() {
		if (embd == null) {
			embd = new HklandAdminDAO();
		} // end if
		return embd;
	}// getInstance

	private synchronized SqlSessionFactory getSqlSessionFactory() throws IOException {
		if (ssf == null) {
			org.apache.ibatis.logging.LogFactory.useLog4JLogging();
			Reader reader = null;
			try {
				reader = Resources.getResourceAsReader("kr/co/sist/admin/dao/sql_map_config.xml");
				ssf = new SqlSessionFactoryBuilder().build(reader);
			} finally {
				if (reader != null) {
					reader.close();
				} // end if
			} // end finally
		} // end if
		return ssf;
	}// getSqlSessionFactory

	
/////kdy//////////////////////////////////////////////////////////////	
//회원정보불러오기 : kdy
	public List<MemberDomain> selectMember() throws SQLException, IOException {
		List<MemberDomain> memList = null;
		SqlSession ss = null;

		try {
			ss = getSqlSessionFactory().openSession();
			memList = ss.selectList("kr.co.sist.admin.selMember");

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (ss != null) {
				ss.close();
			} // end if
		} // end finally

		return  memList;
	}// selectEname
	
	public List<MemberDomain> seachMember(String id) throws SQLException, IOException {
		List<MemberDomain> memList = null;
		SqlSession ss = null;
		
		try {
			ss = getSqlSessionFactory().openSession();
			memList = ss.selectList("kr.co.sist.admin.searchMember",id);
			
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (ss != null) {
				ss.close();
			} // end if
		} // end finally
		
		return  memList;
	}// selectEname
	
	//회원정보삭제
	public void delMember(String id) throws SQLException, IOException {
		SqlSession ss = null;

		try {
			ss = getSqlSessionFactory().openSession();
			
			ss.delete("kr.co.sist.admin.delMember1",id);
			ss.delete("kr.co.sist.admin.delMember2",id);
			ss.commit();
			ss.delete("kr.co.sist.admin.delMember3",id);
			ss.commit();

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (ss != null) {
				ss.close();
			} // end if
		} // end finally

	}// delMember
	
	//이용권 불러오기
	public List<VoucherDomain> selectVoucher() throws SQLException, IOException {
		List<VoucherDomain> list = null;
		SqlSession ss = null;
		try {
			ss = getSqlSessionFactory().openSession();
			list = ss.selectList("kr.co.sist.admin.utilize");

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (ss != null) {
				ss.close();
			} // end if
		} // end finally

		return  list;
	}// selectEname
	//이용권 삭제
	public void deleteVoucher(String id) throws SQLException, IOException {
		SqlSession ss = null;
		
		try {
			ss = getSqlSessionFactory().openSession();
			System.out.println(ss.delete("kr.co.sist.admin.del_utilize",id));
			ss.commit();
			
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (ss != null) {
				ss.close();
			} // end if
		} // end finally
		
	}// selectEname
	
	public List<TicketDomain> selectTicket() throws SQLException, IOException {
		List<TicketDomain> list = null;
		SqlSession ss = null;
		try {
			ss = getSqlSessionFactory().openSession();
			list = ss.selectList("kr.co.sist.admin.selTicket");

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (ss != null) {
				ss.close();
			} // end if
		} // end finally

		return  list;
	}// selectEname
	
	public int insertUtilize(UtilizeVO uv) throws SQLException, IOException {
		int cnt=0;
		SqlSession ss = null;
		try {
			ss = getSqlSessionFactory().openSession();
			cnt = ss.insert("kr.co.sist.admin.insertUtilize",uv);
			ss.commit();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (ss != null) {
				ss.close();
			} // end if
		} // end finally
		
		return  cnt;
	}// selectEname
	
	public int updateUtilize(UtilizeUpdateVO uuv) throws SQLException, IOException {
		int cnt=0;
		SqlSession ss = null;
		try {
			ss = getSqlSessionFactory().openSession();
			cnt = ss.insert("kr.co.sist.admin.upUtilize",uuv);
			ss.commit();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (ss != null) {
				ss.close();
			} // end if
		} // end finally
		
		return  cnt;
	}// selectEname
	
	public UtilizeDomain selectUtilize(String u_no) throws SQLException, IOException {
		UtilizeDomain data= null;
		SqlSession ss = null;
		try {
			ss = getSqlSessionFactory().openSession();
			data = ss.selectOne("kr.co.sist.admin.selUtilize",u_no);

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (ss != null) {
				ss.close();
			} // end if
		} // end finally

		return  data;
	}// selectEname
	
/////kdy//////////////////////////////////////////////////////////////	
	
///khe//////////////////////////////////////////////////////////////
	/* 관리자 로그인 */
	public boolean LoginAdmin(ad_LoginVO lvo) {
		boolean flag = false;
		SqlSession ss = null;
		
			try {
				ss = getSqlSessionFactory().openSession();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			int count = Integer.parseInt(ss.selectOne("kr.co.sist.admin2.selAdmin",lvo).toString()),
			totalCount = ss.selectOne("kr.co.sist.admin2.totSelAdmin");
			
			if(totalCount > 0 ) {
				if(count > 0) {
					flag = true;
				}else {
					flag = false;
				}
			}
			return flag;
	}// LoginAdmin
	
	/* 관리자 이름 반환 */
	public String LoginName(ad_LoginVO lvo) {
		String name = "";
		SqlSession ss = null;
		
		try {
			ss = getSqlSessionFactory().openSession();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		name = ss.selectOne("kr.co.sist.admin2.AdminName",lvo);
		
		return name;
	}// LoginAdmin
/**********************************************************************************************************공지사항*/		
	/*공지사항 전체 조회*/
	public List<NoticeDomain> selectAllNotice() throws SQLException{
		List<NoticeDomain> allNoticeList = null;
		SqlSession ss = null;

		try {
			ss = getSqlSessionFactory().openSession();
			allNoticeList = ss.selectList("kr.co.sist.admin2.AllNotice");

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (ss != null) {
				ss.close();
			} // end if
		} // end finally

		return  allNoticeList;
		
	}
	
	/*공지사항 검색 조회*/
	public List<NoticeDomain> searchNotice(String searchBox) throws SQLException, IOException{
		List<NoticeDomain> allNoticeList = null;
		SqlSession ss = null;
		
		try {
			ss = getSqlSessionFactory().openSession();
			allNoticeList = ss.selectList("kr.co.sist.admin2.selectNotice", searchBox);
			
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (ss != null) {
				ss.close();
			} // end if
		} // end finally
		
		return  allNoticeList;
	}
	
	/*공지사항 등록*/
	public int insertNotice(ad_NoticeVO nvo) throws IOException {
		SqlSession ss=null;
		int cnt = 0;
		try {
			ss=getSqlSessionFactory().openSession();
			//추가 
			cnt=ss.insert("kr.co.sist.admin2.insertNotice",nvo);
			if(cnt ==1) {
				System.out.println(nvo.toString());
				ss.commit();
			}else {
				System.out.println(nvo.toString());
			}//end else 
			
		}finally {
			if(ss != null ) { ss.close(); }//end if
		}//end finally
		
		return cnt;
	}//insertDept
	
	/*공지사항 글 읽기*/
	public NoticeDomain readNotice(int n_no) throws IOException {
		NoticeDomain readList = null;
		SqlSession ss=null;
		try {
			ss=getSqlSessionFactory().openSession();
			//추가 
			readList = ss.selectOne("kr.co.sist.admin2.readNotice", n_no);
			
		}finally {
			if(ss != null ) { ss.close(); }//end if
		}//end finally
		
		return readList;
	}//readNotice
	
	/*공지사항 글 수정*/
	public int updateNotice(ad_NoticeVO nvo) throws IOException {
		SqlSession ss=null;
		int cnt = 0;
		try {
			ss=getSqlSessionFactory().openSession();
			//추가 
			cnt = ss.update("kr.co.sist.admin2.updateNotice", nvo);
			if(cnt == 1) {
				ss.commit();
			}
		}finally {
			if(ss != null ) { ss.close(); }//end if
		}//end finally
		
		return cnt;
	}//readNotice
	
	/*공지사항 글 삭제*/
	public int removeNotice(int n_no) throws IOException {
		SqlSession ss=null;
		int cnt = 0;
		try {
			ss=getSqlSessionFactory().openSession();
			//추가 
			cnt = ss.delete("kr.co.sist.admin2.removeNotice", n_no);
			if(cnt == 1) {
				ss.commit();
			}
		}finally {
			if(ss != null ) { ss.close(); }//end if
		}//end finally
		
		return cnt;
	}//readNotice
/**********************************************************************************************************이벤트*/	
	/*이벤트 전체 조회*/
	public List<EventDomain> selectAllEvent() throws SQLException, IOException{
		List<EventDomain> allEventList = null;
		SqlSession ss = null;

		try {
			ss = getSqlSessionFactory().openSession();
			allEventList = ss.selectList("kr.co.sist.admin3.AllEvent");
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (ss != null) {
				ss.close();
			} // end if
		} // end finally

		return allEventList;
	}//selectAllEvent
	
	/*이벤트 검색 조회*/
	public List<EventDomain> searchEvent(String searchBox) throws SQLException, IOException{
		List<EventDomain> searchEventList = null;
		SqlSession ss = null;

		try {
			ss = getSqlSessionFactory().openSession();
			searchEventList = ss.selectList("kr.co.sist.admin3.searchEvent",searchBox);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (ss != null) {
				ss.close();
			} // end if
		} // end finally

		return searchEventList;
	}//searchEvent
	
	/*이벤트 등록*/
	public int insertEvent(EventVO ev) throws SQLException, IOException{
		int cnt =0; 
		SqlSession ss = null;
		try {
			ss = getSqlSessionFactory().openSession();
			cnt = ss.insert("kr.co.sist.admin3.insertEvent",ev);
			if(cnt == 1) {
				ss.commit();
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (ss != null) {
				ss.close();
			} // end if
		} // end finally
		
		return cnt;
	}//insertEvent
	
	/*이벤트 삭제*/
	public int removeEvent(int e_no) throws IOException {
		SqlSession ss=null;
		int cnt = 0;
		try {
			ss=getSqlSessionFactory().openSession();
			//추가 
			cnt = ss.delete("kr.co.sist.admin3.removeEvent", e_no);
			if(cnt == 1) {
				ss.commit();
			}
		}finally {
			if(ss != null ) { ss.close(); }//end if
		}//end finally
		
		return cnt;
	}//removeEvent
	
	/*이벤트 글 읽기*/
	public EventDomain readEvent(int e_no) throws IOException {
		EventDomain readList = null;
		SqlSession ss=null;
		try {
			ss=getSqlSessionFactory().openSession();
			//추가 
			readList = ss.selectOne("kr.co.sist.admin3.readEvent", e_no);
		}finally {
			if(ss != null ) { ss.close(); }//end if
		}//end finally
		
		return readList;
	}//readEvent
/**********************************************************************************************************쿠폰*/	
	/*쿠폰전체조회*/
	public List<CouponDomain> selectAllCoupon() throws SQLException, IOException{
		List<CouponDomain> selectAllCoupon = null;
		SqlSession ss=null;
		
		try {
			ss=getSqlSessionFactory().openSession();
			selectAllCoupon = ss.selectList("kr.co.sist.admin4.Allcoupon");
		}finally {
			if(ss != null ) { ss.close(); }//end if
		}//end finally
		
		return selectAllCoupon;
	}//selectAllCoupon
	
	/*쿠폰 검색 조회*/
	public List<CouponDomain> searchCoupon(String searchBox) throws SQLException, IOException{
		List<CouponDomain> searchCouponList = null;
		SqlSession ss = null;

		try {
			ss = getSqlSessionFactory().openSession();
			searchCouponList = ss.selectList("kr.co.sist.admin4.searchCoupon",searchBox);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (ss != null) {
				ss.close();
			} // end if
		} // end finally

		return searchCouponList;
	}//searchCoupon
	
	/*쿠폰 등록*/
	public int insertCoupon(CouponVO cv) throws SQLException, IOException{
		int cnt =0; 
		SqlSession ss = null;
		try {
			ss = getSqlSessionFactory().openSession();
			cnt = ss.insert("kr.co.sist.admin4.insertCoupon",cv);
			if(cnt == 1) {
				ss.commit();
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (ss != null) {
				ss.close();
			} // end if
		} // end finally
		
		return cnt;
	}//insertCoupon
	
	/*쿠폰 삭제*/
	public int removeCoupon(int c_no) throws IOException {
		SqlSession ss=null;
		int cnt = 0;
		try {
			ss=getSqlSessionFactory().openSession();
			//추가 
			cnt = ss.delete("kr.co.sist.admin4.removeCoupon", c_no);
			if(cnt == 1) {
				ss.commit();
			}
		}finally {
			if(ss != null ) { ss.close(); }//end if
		}//end finally
		
		return cnt;
	}//removeCoupon
	
	/*쿠폰 글 읽기*/
	public CouponDomain readCoupon(int c_no) throws IOException {
		CouponDomain readList = null;
		SqlSession ss=null;
		try {
			ss=getSqlSessionFactory().openSession();
			//추가 
			readList = ss.selectOne("kr.co.sist.admin4.readCoupon", c_no);
		}finally {
			if(ss != null ) { ss.close(); }//end if
		}//end finally
		
		return readList;
	}//readCoupon
	
/**********************************************************************************************************분실물*/	
	/*분실물전체조회*/
	public List<LostDomain> selectAllLost() throws SQLException, IOException{
		List<LostDomain> selectAllLost = null;
		SqlSession ss=null;
		
		try {
			ss=getSqlSessionFactory().openSession();
			selectAllLost = ss.selectList("kr.co.sist.admin5.AllLost");
		}finally {
			if(ss != null ) { ss.close(); }//end if
		}//end finally
		
		return selectAllLost;
	}//selectAllTicket
	
	/*분실물 검색 조회*/
	public List<LostDomain> searchLost(String searchBox) throws SQLException, IOException{
		List<LostDomain> searchLostList = null;
		SqlSession ss = null;
		
		try {
			ss = getSqlSessionFactory().openSession();
			searchLostList = ss.selectList("kr.co.sist.admin5.searchLost",searchBox);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (ss != null) {
				ss.close();
			} // end if
		} // end finally
		
		return searchLostList;
	}//searchLost
	
	/*분실물 등록*/
	public int insertLost(LostVO lv) throws SQLException, IOException{
		int cnt =0; 
		SqlSession ss = null;
		try {
			ss = getSqlSessionFactory().openSession();
			cnt = ss.insert("kr.co.sist.admin5.insertLost",lv);
			if(cnt == 1) {
				ss.commit();
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (ss != null) {
				ss.close();
			} // end if
		} // end finally
		
		return cnt;
	}//insertLost
	
	/*분실물 삭제*/
	public int removeLost(int l_no) throws IOException {
		SqlSession ss=null;
		int cnt = 0;
		try {
			ss=getSqlSessionFactory().openSession();
			//추가 
			cnt = ss.delete("kr.co.sist.admin5.removeLost", l_no);
			if(cnt == 1) {
				ss.commit();
			}
		}finally {
			if(ss != null ) { ss.close(); }//end if
		}//end finally
		
		return cnt;
	}//removeLost
	
	/*분실물 상태변경 답변*/
	public int updateLost(modifyLostVO mlv) throws IOException {
		SqlSession ss=null;
		int cnt = 0;
		try {
			ss=getSqlSessionFactory().openSession();
			//추가 
			cnt = ss.update("kr.co.sist.admin5.modifyLost", mlv);
			if(cnt == 1) {
				ss.commit();
			}
		}finally {
			if(ss != null ) { ss.close(); }//end if
		}//end finally
		
		return cnt;
	}//updateLost
	
//	/*쿠폰 글 읽기*/
//	public CouponDomain readCoupon(int c_no) throws IOException {
//		CouponDomain readList = null;
//		SqlSession ss=null;
//		try {
//			ss=getSqlSessionFactory().openSession();
//			//추가 
//			readList = ss.selectOne("kr.co.sist.admin4.readCoupon", c_no);
//		}finally {
//			if(ss != null ) { ss.close(); }//end if
//		}//end finally
//		
//		return readList;
//	}//readNotice
	
	/**********************************************************************************************************고객서비스*/	
	/*고객서비스전체조회*/
	public List<ClientDomain> selectAllClient() throws SQLException, IOException{
		List<ClientDomain> selectAllClient = null;
		SqlSession ss=null;
		
		try {
			ss=getSqlSessionFactory().openSession();
			selectAllClient = ss.selectList("kr.co.sist.admin6.AllClient");
		}finally {
			if(ss != null ) { ss.close(); }//end if
		}//end finally
		
		return selectAllClient;
	}//selectAllClient
	
	/*고객서비스 검색 조회*/
	public List<ClientDomain> searchClient(String searchBox) throws SQLException, IOException{
		List<ClientDomain> searchClientList = null;
		SqlSession ss = null;
		
		try {
			ss = getSqlSessionFactory().openSession();
			searchClientList = ss.selectList("kr.co.sist.admin6.searchClient",searchBox);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (ss != null) {
				ss.close();
			} // end if
		} // end finally
		
		return searchClientList;
	}//searchClientList
	
	/*고객서비스 삭제*/
	public int removeClient(int s_no) throws IOException {
		SqlSession ss=null;
		int cnt = 0;
		try {
			ss=getSqlSessionFactory().openSession();
			//추가 
			cnt = ss.delete("kr.co.sist.admin6.removeClient", s_no);
			if(cnt == 1) {
				ss.commit();
			}
		}finally {
			if(ss != null ) { ss.close(); }//end if
		}//end finally
		
		return cnt;
	}//removeClient
	
	/*고객서비스 글 읽기*/
	public ClientDomain readClient(int s_no) throws IOException {
		ClientDomain readList = null;
		SqlSession ss=null;
		try {
			ss=getSqlSessionFactory().openSession();
			//추가 
			readList = ss.selectOne("kr.co.sist.admin6.readClient", s_no);
		}finally {
			if(ss != null ) { ss.close(); }//end if
		}//end finally
		
		return readList;
	}//readClient
	
	/*고객서비스 답변*/
	public int updateClient(ClientVO cv) throws IOException {
		SqlSession ss=null;
		int cnt = 0;
		try {
			ss=getSqlSessionFactory().openSession();
			//추가 
			cnt = ss.update("kr.co.sist.admin6.updateClient", cv);
			if(cnt == 1) {
				ss.commit();
			}
		}finally {
			if(ss != null ) { ss.close(); }//end if
		}//end finally
		
		return cnt;
	}//updateClient
	
	/* 매출 조회*/
	public List<ProfitDomain> selectAllProfit(String d_year) throws SQLException, IOException{
		List<ProfitDomain> selectAllProfit = null;
		SqlSession ss=null;
		
		try {
			ss=getSqlSessionFactory().openSession();
			selectAllProfit = ss.selectList("kr.co.sist.admin7.AllProfit",d_year);
		}finally {
			if(ss != null ) { ss.close(); }//end if
		}//end finally
		
		return selectAllProfit;
	}//selectAllProfit
	

///khe//////////////////////////////////////////////////////////////
	
	
/////// 쿼리확인용
	public static void main(String[] args) {
		HklandAdminDAO dmbs=HklandAdminDAO.getInstance();
			List<ProfitDomain> test = null;
			try {
				test = dmbs.selectAllProfit("2018");
				for(ProfitDomain tt:test) {
					System.out.println(tt.toString());
				}
			} catch (SQLException e1) {
				e1.printStackTrace();
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			
//			EventDomain ed;
//			try {
//				ed = dmbs.readEvent(6);
//				System.out.println(ed.toString());
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
			
	}

}// class
