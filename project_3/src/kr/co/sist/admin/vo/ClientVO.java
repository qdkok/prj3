package kr.co.sist.admin.vo;

public class ClientVO {
	private String s_no, s_name, s_inputdate, s_info, m_id, a_no;

	public ClientVO() {
	}

	public ClientVO(String s_no, String s_name, String s_inputdate, String s_info, String m_id, String a_no) {
		this.s_no = s_no;
		this.s_name = s_name;
		this.s_inputdate = s_inputdate;
		this.s_info = s_info;
		this.m_id = m_id;
		this.a_no = a_no;
	}

	public String getS_no() {
		return s_no;
	}

	public void setS_no(String s_no) {
		this.s_no = s_no;
	}

	public String getS_name() {
		return s_name;
	}

	public void setS_name(String s_name) {
		this.s_name = s_name;
	}

	public String getS_inputdate() {
		return s_inputdate;
	}

	public void setS_inputdate(String s_inputdate) {
		this.s_inputdate = s_inputdate;
	}

	public String getS_info() {
		return s_info;
	}

	public void setS_info(String s_info) {
		this.s_info = s_info;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getA_no() {
		return a_no;
	}

	public void setA_no(String a_no) {
		this.a_no = a_no;
	}
	
	
}
