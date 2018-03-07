package kr.co.sist.hkland.dao;

import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class HklandDAO {
	private static HklandDAO embd;
	private static SqlSessionFactory ssf;

	private HklandDAO() {

	}// ExamMyBatisDAO

	public static HklandDAO getInstance() {
		if (embd == null) {
			embd = new HklandDAO();
		} // end if
		return embd;
	}// getInstance

	private synchronized SqlSessionFactory getSqlSessionFactory() throws IOException {
		if (ssf == null) {
			org.apache.ibatis.logging.LogFactory.useLog4JLogging();
			Reader reader = null;
			try {
				reader = Resources.getResourceAsReader("kr/co/sist/hkland/dao/sql_map_config.xml");
				ssf = new SqlSessionFactoryBuilder().build(reader);
			} finally {
				if (reader != null) {
					reader.close();
				} // end if
			} // end finally
		} // end if
		return ssf;
	}// getSqlSessionFactory

	public List<String> selectEname() throws SQLException, IOException {
		List<String> id = null;
		SqlSession ss = null;

		try {
			ss = getSqlSessionFactory().openSession();
			 id = ss.selectList("kr.co.sist.exam3.selAdim");

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (ss != null) {
				ss.close();
			} // end if
		} // end finally

		return  id;
	}// selectEname

	public static void main(String[] args) {
		HklandDAO dmbs=HklandDAO.getInstance();
		try {
			List<String> test=dmbs.selectEname();
			for(String tt:test) {
				System.out.println(tt);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}// class
