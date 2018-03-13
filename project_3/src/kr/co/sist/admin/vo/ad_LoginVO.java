package kr.co.sist.admin.vo;

public class ad_LoginVO {
	private String a_id, a_pw, a_name, a_empno;

	public ad_LoginVO() {
	}

	public ad_LoginVO(String a_id, String a_pw, String a_name, String a_empno) {
		this.a_id = a_id;
		this.a_pw = a_pw;
		this.a_name = a_name;
		this.a_empno = a_empno;
	}

	public String getA_id() {
		return a_id;
	}

	public void setA_id(String a_id) {
		this.a_id = a_id;
	}

	public String getA_pw() {
		return a_pw;
	}

	public void setA_pw(String a_pw) {
		this.a_pw = a_pw;
	}

	public String getA_name() {
		return a_name;
	}

	public void setA_name(String a_name) {
		this.a_name = a_name;
	}

	public String getA_empno() {
		return a_empno;
	}

	public void setA_empno(String a_empno) {
		this.a_empno = a_empno;
	}

	@Override
	public String toString() {
		return "ad_LoginVO [a_id=" + a_id + ", a_pw=" + a_pw + ", a_name=" + a_name + ", a_empno=" + a_empno + "]";
	}
	
}
