package kr.co.sist.hkland.dao;

import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.co.sist.hkland.domain.RideDomain;
import kr.co.sist.hkland.vo.RideVO;

public class RideDAO {
	
	private static RideDAO rdo;
	private static SqlSessionFactory ssf;

	private RideDAO() {
	}
	
	public static RideDAO getInstance() {
		if(rdo==null) {
			rdo=new RideDAO();
		}
		return rdo;
	}
	
	private synchronized SqlSessionFactory getSqlSessionFactory() throws IOException{
		if(ssf==null) {
			org.apache.ibatis.logging.LogFactory.useLog4JLogging();
			Reader reader=null;
				try {
					reader=Resources.getResourceAsReader("kr/co/sist/hkland/dao/sql_map_config.xml");
					ssf=new SqlSessionFactoryBuilder().build(reader);
				}finally {
					if(reader != null) {reader.close();}//end if
				}//end finally
			}//end if
		return ssf;
	}
	
	public List<RideDomain> selectquery(RideVO rvo) throws SQLException{
		List<RideDomain> list=null;
		SqlSession ss=null;
		
		try {
			ss=getSqlSessionFactory().openSession();
			list=ss.selectList("kr.co.sist.Ride.select",rvo);
		} catch (IOException e) {
			e.printStackTrace();
		}finally {
			if(ss!=null) {ss.close();}//end if
		}//end finally
		
		return list;
	}
	
	
	public RideDomain detail(String number) throws SQLException{
		RideDomain rd=null;
		SqlSession ss=null;
		
		try {
			ss=getSqlSessionFactory().openSession();
			rd=ss.selectOne("kr.co.sist.Ride.detail",number);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if(ss!=null) {ss.close();}//end if
		}//end finally
		
		return rd;
	}
	
}
