package kr.co.sist.admin.vo;

public class UtilizeUpdateVO {
	private String u_no,t_no,u_name,sale_flag,info,u_image,a_id;
	private int price,start_year,start_month,start_day,end_year,end_month,end_day;

	public UtilizeUpdateVO() {
	}

	public UtilizeUpdateVO(String u_no, String t_no, String u_name, String sale_flag, String info, String u_image,
			String a_id, int price, int start_year, int start_month, int start_day, int end_year, int end_month,
			int end_day) {
		this.u_no = u_no;
		this.t_no = t_no;
		this.u_name = u_name;
		this.sale_flag = sale_flag;
		this.info = info;
		this.u_image = u_image;
		this.a_id = a_id;
		this.price = price;
		this.start_year = start_year;
		this.start_month = start_month;
		this.start_day = start_day;
		this.end_year = end_year;
		this.end_month = end_month;
		this.end_day = end_day;
	}

	public String getU_no() {
		return u_no;
	}

	public void setU_no(String u_no) {
		this.u_no = u_no;
	}

	public String getT_no() {
		return t_no;
	}

	public void setT_no(String t_no) {
		this.t_no = t_no;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public String getSale_flag() {
		return sale_flag;
	}

	public void setSale_flag(String sale_flag) {
		this.sale_flag = sale_flag;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getU_image() {
		return u_image;
	}

	public void setU_image(String u_image) {
		this.u_image = u_image;
	}

	public String getA_id() {
		return a_id;
	}

	public void setA_id(String a_id) {
		this.a_id = a_id;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
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

	
}
