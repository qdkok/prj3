package kr.co.sist.admin.domain;

public class ProfitDomain {
	private String d_year, d_month;
	private int goal, attaintment;
	
	public String getD_year() {
		return d_year;
	}
	public void setD_year(String d_year) {
		this.d_year = d_year;
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
	@Override
	public String toString() {
		return "ProfitDomain [d_year=" + d_year + ", d_month=" + d_month + ", goal=" + goal + ", attaintment="
				+ attaintment + "]";
	}
}
