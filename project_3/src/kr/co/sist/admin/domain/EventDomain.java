package kr.co.sist.admin.domain;

public class EventDomain {
	private String e_no, e_name, e_info, r_position, r_image, r_file, a_id;
	private int start_year, start_month, start_day, end_year, end_month, end_day;
	
	public String getE_no() {
		return e_no;
	}
	public void setE_no(String e_no) {
		this.e_no = e_no;
	}
	public String getE_name() {
		return e_name;
	}
	public void setE_name(String e_name) {
		this.e_name = e_name;
	}
	public String getE_info() {
		return e_info;
	}
	public void setE_info(String e_info) {
		this.e_info = e_info;
	}
	public String getR_position() {
		return r_position;
	}
	public void setR_position(String r_position) {
		this.r_position = r_position;
	}
	public String getR_image() {
		return r_image;
	}
	public void setR_image(String r_image) {
		this.r_image = r_image;
	}
	public String getR_file() {
		return r_file;
	}
	public void setR_file(String r_file) {
		this.r_file = r_file;
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
	@Override
	public String toString() {
		return "EventDomain [e_no=" + e_no + ", e_name=" + e_name + ", e_info=" + e_info + ", r_position=" + r_position
				+ ", r_image=" + r_image + ", r_file=" + r_file + ", a_id=" + a_id + ", start_year=" + start_year
				+ ", start_month=" + start_month + ", start_day=" + start_day + ", end_year=" + end_year
				+ ", end_month=" + end_month + ", end_day=" + end_day + "]";
	}

}
