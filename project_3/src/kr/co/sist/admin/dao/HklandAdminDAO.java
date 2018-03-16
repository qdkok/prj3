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
//ȸ�������ҷ����� : kdy
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
	
	//ȸ����������
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
	
	//�̿�� �ҷ�����
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
	//�̿�� ����
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
	/* ������ �α��� */
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
	
	/* ������ �̸� ��ȯ */
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
/**********************************************************************************************************��������*/		
	/*�������� ��ü ��ȸ*/
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
	
	/*�������� �˻� ��ȸ*/
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
	
	/*�������� ���*/
	public int insertNotice(ad_NoticeVO nvo) throws IOException {
		SqlSession ss=null;
		int cnt = 0;
		try {
			ss=getSqlSessionFactory().openSession();
			//�߰� 
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
	
	/*�������� �� �б�*/
	public NoticeDomain readNotice(int n_no) throws IOException {
		NoticeDomain readList = null;
		SqlSession ss=null;
		try {
			ss=getSqlSessionFactory().openSession();
			//�߰� 
			readList = ss.selectOne("kr.co.sist.admin2.readNotice", n_no);
			
		}finally {
			if(ss != null ) { ss.close(); }//end if
		}//end finally
		
		return readList;
	}//readNotice
	
	/*�������� �� ����*/
	public int updateNotice(ad_NoticeVO nvo) throws IOException {
		SqlSession ss=null;
		int cnt = 0;
		try {
			ss=getSqlSessionFactory().openSession();
			//�߰� 
			cnt = ss.update("kr.co.sist.admin2.updateNotice", nvo);
			if(cnt == 1) {
				ss.commit();
			}
		}finally {
			if(ss != null ) { ss.close(); }//end if
		}//end finally
		
		return cnt;
	}//readNotice
	
	/*�������� �� ����*/
	public int removeNotice(int n_no) throws IOException {
		SqlSession ss=null;
		int cnt = 0;
		try {
			ss=getSqlSessionFactory().openSession();
			//�߰� 
			cnt = ss.delete("kr.co.sist.admin2.removeNotice", n_no);
			if(cnt == 1) {
				ss.commit();
			}
		}finally {
			if(ss != null ) { ss.close(); }//end if
		}//end finally
		
		return cnt;
	}//readNotice
/**********************************************************************************************************�̺�Ʈ*/	
	/*�̺�Ʈ ��ü ��ȸ*/
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
	
	/*�̺�Ʈ �˻� ��ȸ*/
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
	
	/*�̺�Ʈ ���*/
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
	
	/*�̺�Ʈ ����*/
	public int removeEvent(int e_no) throws IOException {
		SqlSession ss=null;
		int cnt = 0;
		try {
			ss=getSqlSessionFactory().openSession();
			//�߰� 
			cnt = ss.delete("kr.co.sist.admin3.removeEvent", e_no);
			if(cnt == 1) {
				ss.commit();
			}
		}finally {
			if(ss != null ) { ss.close(); }//end if
		}//end finally
		
		return cnt;
	}//removeEvent
	
	/*�̺�Ʈ �� �б�*/
	public EventDomain readEvent(int e_no) throws IOException {
		EventDomain readList = null;
		SqlSession ss=null;
		try {
			ss=getSqlSessionFactory().openSession();
			//�߰� 
			readList = ss.selectOne("kr.co.sist.admin3.readEvent", e_no);
		}finally {
			if(ss != null ) { ss.close(); }//end if
		}//end finally
		
		return readList;
	}//readEvent
/**********************************************************************************************************����*/	
	/*������ü��ȸ*/
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
	
	/*���� �˻� ��ȸ*/
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
	
	/*���� ���*/
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
	
	/*���� ����*/
	public int removeCoupon(int c_no) throws IOException {
		SqlSession ss=null;
		int cnt = 0;
		try {
			ss=getSqlSessionFactory().openSession();
			//�߰� 
			cnt = ss.delete("kr.co.sist.admin4.removeCoupon", c_no);
			if(cnt == 1) {
				ss.commit();
			}
		}finally {
			if(ss != null ) { ss.close(); }//end if
		}//end finally
		
		return cnt;
	}//removeCoupon
	
	/*���� �� �б�*/
	public CouponDomain readCoupon(int c_no) throws IOException {
		CouponDomain readList = null;
		SqlSession ss=null;
		try {
			ss=getSqlSessionFactory().openSession();
			//�߰� 
			readList = ss.selectOne("kr.co.sist.admin4.readCoupon", c_no);
		}finally {
			if(ss != null ) { ss.close(); }//end if
		}//end finally
		
		return readList;
	}//readCoupon
	
/**********************************************************************************************************�нǹ�*/	
	/*�нǹ���ü��ȸ*/
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
	
	/*�нǹ� �˻� ��ȸ*/
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
	
	/*�нǹ� ���*/
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
	
	/*�нǹ� ����*/
	public int removeLost(int l_no) throws IOException {
		SqlSession ss=null;
		int cnt = 0;
		try {
			ss=getSqlSessionFactory().openSession();
			//�߰� 
			cnt = ss.delete("kr.co.sist.admin5.removeLost", l_no);
			if(cnt == 1) {
				ss.commit();
			}
		}finally {
			if(ss != null ) { ss.close(); }//end if
		}//end finally
		
		return cnt;
	}//removeLost
	
	/*�нǹ� ���º��� �亯*/
	public int updateLost(modifyLostVO mlv) throws IOException {
		SqlSession ss=null;
		int cnt = 0;
		try {
			ss=getSqlSessionFactory().openSession();
			//�߰� 
			cnt = ss.update("kr.co.sist.admin5.modifyLost", mlv);
			if(cnt == 1) {
				ss.commit();
			}
		}finally {
			if(ss != null ) { ss.close(); }//end if
		}//end finally
		
		return cnt;
	}//updateLost
	
//	/*���� �� �б�*/
//	public CouponDomain readCoupon(int c_no) throws IOException {
//		CouponDomain readList = null;
//		SqlSession ss=null;
//		try {
//			ss=getSqlSessionFactory().openSession();
//			//�߰� 
//			readList = ss.selectOne("kr.co.sist.admin4.readCoupon", c_no);
//		}finally {
//			if(ss != null ) { ss.close(); }//end if
//		}//end finally
//		
//		return readList;
//	}//readNotice
	
	/**********************************************************************************************************������*/	
	/*��������ü��ȸ*/
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
	
	/*������ �˻� ��ȸ*/
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
	
	/*������ ����*/
	public int removeClient(int s_no) throws IOException {
		SqlSession ss=null;
		int cnt = 0;
		try {
			ss=getSqlSessionFactory().openSession();
			//�߰� 
			cnt = ss.delete("kr.co.sist.admin6.removeClient", s_no);
			if(cnt == 1) {
				ss.commit();
			}
		}finally {
			if(ss != null ) { ss.close(); }//end if
		}//end finally
		
		return cnt;
	}//removeClient
	
	/*������ �� �б�*/
	public ClientDomain readClient(int s_no) throws IOException {
		ClientDomain readList = null;
		SqlSession ss=null;
		try {
			ss=getSqlSessionFactory().openSession();
			//�߰� 
			readList = ss.selectOne("kr.co.sist.admin6.readClient", s_no);
		}finally {
			if(ss != null ) { ss.close(); }//end if
		}//end finally
		
		return readList;
	}//readClient
	
	/*������ �亯*/
	public int updateClient(ClientVO cv) throws IOException {
		SqlSession ss=null;
		int cnt = 0;
		try {
			ss=getSqlSessionFactory().openSession();
			//�߰� 
			cnt = ss.update("kr.co.sist.admin6.updateClient", cv);
			if(cnt == 1) {
				ss.commit();
			}
		}finally {
			if(ss != null ) { ss.close(); }//end if
		}//end finally
		
		return cnt;
	}//updateClient
	
	/* ���� ��ȸ*/
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
	
	
/////// ����Ȯ�ο�
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
