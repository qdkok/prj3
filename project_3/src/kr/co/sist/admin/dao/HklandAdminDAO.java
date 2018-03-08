package kr.co.sist.admin.dao;

import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.co.sist.admin.domain.MemberDomain;

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
/////kdy//////////////////////////////////////////////////////////////	
	
///khe//////////////////////////////////////////////////////////////
	
///khe//////////////////////////////////////////////////////////////
	
	
/////// 쿼리확인용
	public static void main(String[] args) {
		HklandAdminDAO dmbs=HklandAdminDAO.getInstance();
		try {
			List<MemberDomain> test=dmbs.selectMember();
			for(MemberDomain tt:test) {
				System.out.println(tt.getId()+"/"+tt.getName()+"/"+tt.getBirth()+"/"+tt.getGender()+"/"+tt.getEmail()+"/"+tt.getPhone()+"/"+tt.getInputdate());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}// class
