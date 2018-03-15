package kr.co.sist.admin.vo;

public class modifyLostVO {
	private String l_no, l_result;

	public modifyLostVO() {
	}

	public modifyLostVO(String l_no, String l_result) {
		this.l_no = l_no;
		this.l_result = l_result;
	}

	public String getL_no() {
		return l_no;
	}

	public void setL_no(String l_no) {
		this.l_no = l_no;
	}

	public String getL_result() {
		return l_result;
	}

	public void setL_result(String l_result) {
		this.l_result = l_result;
	}

	@Override
	public String toString() {
		return "modifyLostVO [l_no=" + l_no + ", l_result=" + l_result + "]";
	}
	
}
