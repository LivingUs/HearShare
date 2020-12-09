package com.kh.spring.member.domain;

import java.sql.Date;

public class Member {

	private String memberId;
	private String password;
	private String memberName;
	private String phone;
	private String email;
	private int code;
	private int roomNo;
	private Date joinDate;
	private String memberYn;
	
	public Member() {
		
	}
	
	

	public Member(String memberId, String password) {
		super();
		this.memberId = memberId;
		this.password = password;
	}


	public Member(String memberId, String password, String memberName, String phone, String email, int code, int roomNo,
			Date joinDate, String memberYn) {
		super();
		this.memberId = memberId;
		this.password = password;
		this.memberName = memberName;
		this.phone = phone;
		this.email = email;
		this.code = code;
		this.roomNo = roomNo;
		this.joinDate = joinDate;
		this.memberYn = memberYn;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public int getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}

	public Date getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}

	public String getMemberYn() {
		return memberYn;
	}

	public void setMemberYn(String memberYn) {
		this.memberYn = memberYn;
	}

	@Override
	public String toString() {
		return "Member [memberId=" + memberId + ", password=" + password + ", memberName=" + memberName + ", phone="
				+ phone + ", email=" + email + ", code=" + code + ", roomNo=" + roomNo + ", joinDate=" + joinDate
				+ ", memberYn=" + memberYn + "]";
	}

	
	
	
	
	
}
