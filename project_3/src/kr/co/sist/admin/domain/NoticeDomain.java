package kr.co.sist.admin.domain;

public class NoticeDomain {
	private String n_no, n_name, n_inputdate, n_info, a_id, n_info_sub, n_name_sub;

	public String getN_name_sub() {
		String N_name = getN_name();
		if(N_name.length() >= 15) {
			N_name = N_name.substring(0, 15)+". . .";
		}
		return N_name;
	}

	public void setN_name_sub(String n_name_sub) {
		this.n_name_sub = n_name_sub;
	}

	public String getN_info_sub() {
		String N_info = getN_info();
		if(N_info.length() >= 20) {
			N_info = N_info.substring(0, 20)+". . .";
		}
		return N_info;
	}

	public void setN_info_sub(String n_info_sub) {
		this.n_info_sub = n_info_sub;
	}

	public String getN_no() {
		return n_no;
	}

	public void setN_no(String n_no) {
		this.n_no = n_no;
	}

	public String getN_name() {
		return n_name;
	}

	public void setN_name(String n_name) {
		this.n_name = n_name;
	}

	public String getN_inputdate() {
		return n_inputdate;
	}

	public void setN_inputdate(String n_inputdate) {
		this.n_inputdate = n_inputdate;
	}

	public String getN_info() {
		return n_info;
	}

	public void setN_info(String n_info) {
		this.n_info = n_info;
	}

	public String getA_id() {
		return a_id;
	}

	public void setA_id(String a_id) {
		this.a_id = a_id;
	}

	@Override
	public String toString() {
		return "NoticeDomain [n_no=" + n_no + ", n_name=" + n_name + ", n_inputdate=" + n_inputdate + ", n_info="
				+ n_info + ", a_id=" + a_id + "]";
	}
	
}
