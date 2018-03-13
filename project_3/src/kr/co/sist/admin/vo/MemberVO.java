package kr.co.sist.admin.vo;

public class MemberVO {
	private String id,name,gender,birth,email,phone,inputdate;

	public MemberVO() {
	}
	
	public MemberVO(String id, String name, String gender, String birth, String email, String phone, String inputdate) {
		this.id = id;
		this.name = name;
		this.gender = gender;
		this.birth = birth;
		this.email = email;
		this.phone = phone;
		this.inputdate = inputdate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getInputdate() {
		return inputdate;
	}

	public void setInputdate(String inputdate) {
		this.inputdate = inputdate;
	}
	
}
