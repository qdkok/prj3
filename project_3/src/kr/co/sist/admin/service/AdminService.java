package kr.co.sist.admin.service;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.sist.admin.dao.HklandAdminDAO;
import kr.co.sist.admin.domain.TicketDomain;
import kr.co.sist.admin.domain.UtilizeDomain;
import kr.co.sist.admin.domain.VoucherDomain;
import kr.co.sist.admin.vo.UtilizeUpdateVO;
import kr.co.sist.admin.vo.UtilizeVO;

@Component
public class AdminService {
	private HklandAdminDAO hk_dao=HklandAdminDAO.getInstance();
	
	public List<VoucherDomain> voucher(){
		List<VoucherDomain> list=null;
		try {
			list=hk_dao.selectVoucher();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public int delVoucher(String id){
		int cnt=0;
		try {
			//공백있을 경우 임시
			if(id.length()!=5) {
				for(int i=id.length();i<5;i++) {
					id+=" ";
				}//end for
			}
			hk_dao.deleteVoucher(id);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
			
		return cnt;
	}
	
	public List<TicketDomain> ticket(){
		List<TicketDomain> list=null;
		try {
			list=hk_dao.selectTicket();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public UtilizeDomain selUtilize(String u_no){
		UtilizeDomain data=null;
		try {
			//공백있을 경우 임시
			if(u_no.length()!=5) {
				for(int i=u_no.length();i<5;i++) {
					u_no+=" ";
				}//end for
			}
			data=hk_dao.selectUtilize(u_no);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return data;
	}
	
	public boolean insertUtilize(HttpServletRequest request){
		boolean flag=false;
		File fileRepository=new File("C:/dev/git/prj3/project_3/WebContent/uplioad/voucher");
		
		try {
			MultipartRequest mr=new MultipartRequest(request, fileRepository.getAbsolutePath(), 1024*1024*10,"UTF-8",new DefaultFileRenamePolicy() );
			
			//파일 업로드가 잘 되었고, DBMS 테이블에 추가가 되었다면
			
			System.out.println(mr.getParameter("selVoucher")+"이거닷");
			if(!"".equals(mr.getParameter("selVoucher"))) {
				System.out.println("수정");
				UtilizeUpdateVO uuv=new UtilizeUpdateVO(mr.getParameter("selVoucher"),mr.getParameter("ticket"), mr.getParameter("name"), mr.getParameter("sale_flag")!=null?"y":"n", 
						mr.getParameter("info"), mr.getFilesystemName("img"),"Kang", Integer.parseInt(mr.getParameter("price")),  Integer.parseInt(mr.getParameter("st_year")),  Integer.parseInt(mr.getParameter("st_month")),  Integer.parseInt(mr.getParameter("st_day")), 
						Integer.parseInt(mr.getParameter("ed_year")),  Integer.parseInt(mr.getParameter("ed_month")),  Integer.parseInt(mr.getParameter("ed_day")));
				if(hk_dao.updateUtilize(uuv)==1) {
					flag=true;
				}//end if
			}else {
				System.out.println("추가");
				UtilizeVO uv=new UtilizeVO(mr.getParameter("ticket"), mr.getParameter("name"), mr.getParameter("sale_flag")!=null?"y":"n", 
						mr.getParameter("info"), mr.getFilesystemName("img"),"Kang", Integer.parseInt(mr.getParameter("price")),  Integer.parseInt(mr.getParameter("st_year")),  Integer.parseInt(mr.getParameter("st_month")),  Integer.parseInt(mr.getParameter("st_day")), 
						Integer.parseInt(mr.getParameter("ed_year")),  Integer.parseInt(mr.getParameter("ed_month")),  Integer.parseInt(mr.getParameter("ed_day")));
				/*System.out.println(mr.getParameter("ticket")+"/"+mr.getParameter("name")+"/"+mr.getParameter("sale_flag")!=null?"y":"n"+"/"+ 
						mr.getParameter("info")+"/"+ mr.getFilesystemName("img")+"/"+"Kang"+"/"+Integer.parseInt(mr.getParameter("price"))+ Integer.parseInt(mr.getParameter("st_year"))+"/"+Integer.parseInt(mr.getParameter("st_month"))+"/"+Integer.parseInt(mr.getParameter("st_day"))+"/"+ 
						Integer.parseInt(mr.getParameter("ed_year"))+"/"+Integer.parseInt(mr.getParameter("ed_month"))+"/"+Integer.parseInt(mr.getParameter("ed_day")));*/
				if(hk_dao.insertUtilize(uv)==1) {
					flag=true;
				}//end if
				
			}//end else
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return flag;
	}
	
	
}
