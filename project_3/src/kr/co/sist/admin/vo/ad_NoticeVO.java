package kr.co.sist.admin.vo;

public class ad_NoticeVO {
	private String n_no, n_name, n_inputdate, n_info, a_id;

	public ad_NoticeVO() {
	}

	public ad_NoticeVO(String n_no, String n_name, String n_inputdate, String n_info, String a_id) {
		this.n_no = n_no;
		this.n_name = n_name;
		this.n_inputdate = n_inputdate;
		this.n_info = n_info;
		this.a_id = a_id;
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
		return "ad_NoticeVO [n_no=" + n_no + ", n_name=" + n_name + ", n_inputdate=" + n_inputdate + ", n_info="
				+ n_info + ", a_id=" + a_id + "]";
	}
	
}
