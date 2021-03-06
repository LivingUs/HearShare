package com.kh.spring.reserve.domain;

import java.sql.Date;
import java.sql.Timestamp;

public class Reserve {
	
	private int rNo;
	private String rDate;
	private String rTime;
	private String rTyn;
	private Timestamp rCheckTime;
	private String rCode;
	private String memberId;
	private String memberName;
	
	public Reserve() {}
	


	public Reserve(int rNo, String rDate, String rTime, String rTyn, Timestamp rCheckTime, String rCode,
			String memberId, String memberName) {
		super();
		this.rNo = rNo;
		this.rDate = rDate;
		this.rTime = rTime;
		this.rTyn = rTyn;
		this.rCheckTime = rCheckTime;
		this.rCode = rCode;
		this.memberId = memberId;
		this.memberName = memberName;
	}
	


	public String getMemberName() {
		return memberName;
	}



	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}



	public int getrNo() {
		return rNo;
	}

	public void setrNo(int rNo) {
		this.rNo = rNo;
	}

	

	public String getrDate() {
		return rDate;
	}







	public void setrDate(String rDate) {
		this.rDate = rDate;
	}







	public String getrTime() {
		return rTime;
	}

	public void setrTime(String rTime) {
		this.rTime = rTime;
	}

	public String getrTyn() {
		return rTyn;
	}

	public void setrTyn(String rTyn) {
		this.rTyn = rTyn;
	}

	public Timestamp getrCheckTime() {
		return rCheckTime;
	}

	public void setrCheckTime(Timestamp rCheckTime) {
		this.rCheckTime = rCheckTime;
	}

	public String getrCode() {
		return rCode;
	}

	public void setrCode(String rCode) {
		this.rCode = rCode;
	}
	

	public String getMemberId() {
		return memberId;
	}



	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}



	@Override
	public String toString() {
		return "Reserve [rNo=" + rNo + ", rDate=" + rDate + ", rTime=" + rTime + ", rTyn=" + rTyn + ", rCheckTime="
				+ rCheckTime + ", rCode=" + rCode + ", memberId=" + memberId + ", memberName=" + memberName + "]";
	}
	
	

}
