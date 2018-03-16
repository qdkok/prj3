package kr.co.sist.admin.vo;

public class ProfitVO {
	private String d_month;
	private int goal, attaintment;
	
	public ProfitVO() {
	}

	public ProfitVO(String d_month, int goal, int attaintment) {
		this.d_month = d_month;
		this.goal = goal;
		this.attaintment = attaintment;
	}

	public String getD_month() {
		return d_month;
	}

	public void setD_month(String d_month) {
		this.d_month = d_month;
	}

	public int getGoal() {
		return goal;
	}

	public void setGoal(int goal) {
		this.goal = goal;
	}

	public int getAttaintment() {
		return attaintment;
	}

	public void setAttaintment(int attaintment) {
		this.attaintment = attaintment;
	}
	
}