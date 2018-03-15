package kr.co.sist.hkland.vo;

public class ReservationVO {
	private String id,u_no; 
	private int count;

	public ReservationVO() {
	}

	public ReservationVO(String id, String u_no, int count) {
		this.id = id;
		this.u_no = u_no;
		this.count = count;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getU_no() {
		return u_no;
	}

	public void setU_no(String u_no) {
		this.u_no = u_no;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	
}
