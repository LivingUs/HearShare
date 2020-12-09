package com.kh.spring.member.domain;

import java.sql.Date;

public class Reserve {

	private int rNo;
	private Date rDate;
	private String rTime;
	private String rTyn;
	private String rCheckYn;
	private String rCheckTime;
	private String rCode;
	private String memberId;
	
	public Reserve() {
		super();
	}
	
	public Reserve(String memberId) {
		super();
		this.memberId = memberId;
	}

	public Reserve(int rNo, Date rDate, String rTime, String rTyn, String rCheckYn, String rCheckTime, String rCode,
			String memberId) {
		super();
		this.rNo = rNo;
		this.rDate = rDate;
		this.rTime = rTime;
		this.rTyn = rTyn;
		this.rCheckYn = rCheckYn;
		this.rCheckTime = rCheckTime;
		this.rCode = rCode;
		this.memberId = memberId;
	}
	
	public int getrNo() {
		return rNo;
	}
	public void setrNo(int rNo) {
		this.rNo = rNo;
	}
	public Date getrDate() {
		return rDate;
	}
	public void setrDate(Date rDate) {
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
	public String getrCheckYn() {
		return rCheckYn;
	}
	public void setrCheckYn(String rCheckYn) {
		this.rCheckYn = rCheckYn;
	}
	public String getrCheckTime() {
		return rCheckTime;
	}
	public void setrCheckTime(String rCheckTime) {
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
		return "Reserve [rNo=" + rNo + ", rDate=" + rDate + ", rTime=" + rTime + ", rTyn=" + rTyn + ", rCheckYn="
				+ rCheckYn + ", rCheckTime=" + rCheckTime + ", rCode=" + rCode + ", memberId=" + memberId + "]";
	}

	
}
