package com.kh.spring.member.domain;

public class Invite {
	
	private String email;
	private String authNum;

	public Invite() {
		
	}

	public Invite(String email, String authNum) {
		super();
		this.email = email;
		this.authNum = authNum;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAuthNum() {
		return authNum;
	}

	public void setAuthNum(String authNum) {
		this.authNum = authNum;
	}

	@Override
	public String toString() {
		return "Invite [email=" + email + ", authNum=" + authNum + "]";
	}
	
	
	
}
