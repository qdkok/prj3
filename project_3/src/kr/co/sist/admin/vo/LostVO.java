package kr.co.sist.admin.vo;

public class LostVO {
	private String l_no, l_kate, l_image, l_name, l_result, a_id;
	private int l_year, l_month, l_day;
	
	public LostVO() {
	}

	public LostVO(String l_no, String l_kate, String l_image, String l_name, String l_result, String a_id, int l_year,
			int l_month, int l_day) {
		this.l_no = l_no;
		this.l_kate = l_kate;
		this.l_image = l_image;
		this.l_name = l_name;
		this.l_result = l_result;
		this.a_id = a_id;
		this.l_year = l_year;
		this.l_month = l_month;
		this.l_day = l_day;
	}

	public String getL_no() {
		return l_no;
	}

	public void setL_no(String l_no) {
		this.l_no = l_no;
	}

	public String getL_kate() {
		return l_kate;
	}

	public void setL_kate(String l_kate) {
		this.l_kate = l_kate;
	}

	public String getL_image() {
		return l_image;
	}

	public void setL_image(String l_image) {
		this.l_image = l_image;
	}

	public String getL_name() {
		return l_name;
	}

	public void setL_name(String l_name) {
		this.l_name = l_name;
	}

	public String getL_result() {
		return l_result;
	}

	public void setL_result(String l_result) {
		this.l_result = l_result;
	}

	public String getA_id() {
		return a_id;
	}

	public void setA_id(String a_id) {
		this.a_id = a_id;
	}

	public int getL_year() {
		return l_year;
	}

	public void setL_year(int l_year) {
		this.l_year = l_year;
	}

	public int getL_month() {
		return l_month;
	}

	public void setL_month(int l_month) {
		this.l_month = l_month;
	}

	public int getL_day() {
		return l_day;
	}

	public void setL_day(int l_day) {
		this.l_day = l_day;
	}
	
}
