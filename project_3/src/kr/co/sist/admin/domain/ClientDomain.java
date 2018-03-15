package kr.co.sist.admin.domain;

public class ClientDomain {
	private String s_no, s_name, s_inputdate, s_info, m_id, a_no, s_info_sub, s_name_sub;

	public String getS_info_sub() {
		String S_info = getS_info();
		if(S_info.length() >= 20) {
			S_info = S_info.substring(0, 20)+". . .";
		}
		return S_info;
	}

	public void setS_info_sub(String s_info_sub) {
		this.s_info_sub = s_info_sub;
	}

	public String getS_name_sub() {
		String S_name = getS_name();
		if(S_name.length() >= 15) {
			S_name = S_name.substring(0, 15)+". . .";
		}
		return S_name;
	}

	public void setS_name_sub(String s_name_sub) {
		this.s_name_sub = s_name_sub;
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
