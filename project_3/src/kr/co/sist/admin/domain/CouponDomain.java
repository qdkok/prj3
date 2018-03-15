package kr.co.sist.admin.domain;

public class CouponDomain {
	private String c_no, c_image, c_name, c_info, a_id, c_info_sub, c_name_sub;
	private int start_year, start_month, start_day, end_year, end_month, end_day, discount;
	
	public String getC_info_sub() {
		String C_info = getC_info();
		if(C_info.length() >= 20) {
			C_info = C_info.substring(0, 20)+". . .";
		}
		return C_info;
	}
	public void setC_info_sub(String c_info_sub) {
		this.c_info_sub = c_info_sub;
	}
	public String getC_name_sub() {
		String C_name = getC_name();
		if(C_name.length() >= 20) {
			C_name = C_name.substring(0, 20)+". . .";
		}
		return C_name;
	}
	public void setC_name_sub(String c_name_sub) {
		this.c_name_sub = c_name_sub;
	}
	public String getC_no() {
		return c_no;
	}
	public void setC_no(String c_no) {
		this.c_no = c_no;
	}
	public String getC_image() {
		return c_image;
	}
	public void setC_image(String c_image) {
		this.c_image = c_image;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public String getC_info() {
		return c_info;
	}
	public void setC_info(String c_info) {
		this.c_info = c_info;
	}
	public String getA_id() {
		return a_id;
	}
	public void setA_id(String a_id) {
		this.a_id = a_id;
	}
	public int getStart_year() {
		return start_year;
	}
	public void setStart_year(int start_year) {
		this.start_year = start_year;
	}
	public int getStart_month() {
		return start_month;
	}
	public void setStart_month(int start_month) {
		this.start_month = start_month;
	}
	public int getStart_day() {
		return start_day;
	}
	public void setStart_day(int start_day) {
		this.start_day = start_day;
	}
	public int getEnd_year() {
		return end_year;
	}
	public void setEnd_year(int end_year) {
		this.end_year = end_year;
	}
	public int getEnd_month() {
		return end_month;
	}
	public void setEnd_month(int end_month) {
		this.end_month = end_month;
	}
	public int getEnd_day() {
		return end_day;
	}
	public void setEnd_day(int end_day) {
		this.end_day = end_day;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	@Override
	public String toString() {
		return "CouponDomain [c_no=" + c_no + ", c_image=" + c_image + ", c_name=" + c_name + ", c_info=" + c_info
				+ ", a_id=" + a_id + ", start_year=" + start_year + ", start_month=" + start_month + ", start_day="
				+ start_day + ", end_year=" + end_year + ", end_month=" + end_month + ", end_day=" + end_day
				+ ", discount=" + discount + "]";
	}
	
}
