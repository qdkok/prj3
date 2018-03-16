package kr.co.sist.admin.service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Component;

import kr.co.sist.admin.dao.HklandAdminDAO;
import kr.co.sist.admin.domain.ProfitDomain;

@Component
public class ProfitService {
	private HklandAdminDAO hk_dao = HklandAdminDAO.getInstance();
	
	/*�̺�Ʈ ��ü ��ȸ*/
	public List<ProfitDomain> selectAllProfit(String d_year){
		List<ProfitDomain> AllProfitList=null;
		try {
			AllProfitList=hk_dao.selectAllProfit(d_year);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return AllProfitList;
	}//selectAllEvent
	
}//class
