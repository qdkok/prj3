package kr.co.sist.hkland.vo;

public class SearchIdVO {
	private String name,email;

	public SearchIdVO() {
		super();
	}

	public SearchIdVO(String name, String email) {
		super();
		this.name = name;
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
}
