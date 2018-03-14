package kr.co.sist.service;

import java.sql.SQLException;

import kr.co.sist.hkland.dao.RideDAO;
import kr.co.sist.hkland.domain.RideDomain;

public class DetailService {
	
	
	public RideDomain detailservice(String number){
		RideDomain rd=null;
		RideDAO rdo=RideDAO.getInstance();
		try {
			rd =rdo.detail(number);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rd;
	}
}
