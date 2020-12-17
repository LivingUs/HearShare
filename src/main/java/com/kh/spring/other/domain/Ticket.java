package com.kh.spring.other.domain;

import java.sql.Date;

public class Ticket {
	private int tNo;
	private Date tDate;
	private int tPriceNo;
	private int tUseNo;
	private String tCode;
	private String tYn;
	private String memberId;
	
	public Ticket() {
		super();
	}
	
	public Ticket(int tNo, Date tDate, int tPriceNo, int tUseNo, String tCode, String tYn, String memberId) {
		super();
		this.tNo = tNo;
		this.tDate = tDate;
		this.tPriceNo = tPriceNo;
		this.tUseNo = tUseNo;
		this.tCode = tCode;
		this.tYn = tYn;
		this.memberId = memberId;
	}
	
	public int gettNo() {
		return tNo;
	}
	public void settNo(int tNo) {
		this.tNo = tNo;
	}
	public Date gettDate() {
		return tDate;
	}
	public void settDate(Date tDate) {
		this.tDate = tDate;
	}
	public int gettPriceNo() {
		return tPriceNo;
	}
	public void settPriceNo(int tPriceNo) {
		this.tPriceNo = tPriceNo;
	}
	public int gettUseNo() {
		return tUseNo;
	}
	public void settUseNo(int tUseNo) {
		this.tUseNo = tUseNo;
	}
	public String gettCode() {
		return tCode;
	}
	public void settCode(String tCode) {
		this.tCode = tCode;
	}
	
	public String gettYn() {
		return tYn;
	}

	public void settYn(String tYn) {
		this.tYn = tYn;
	}

	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	@Override
	public String toString() {
		return "Ticket [tNo=" + tNo + ", tDate=" + tDate + ", tPriceNo=" + tPriceNo + ", tUseNo=" + tUseNo + ", tCode="
				+ tCode + ", tYn=" + tYn + ", memberId=" + memberId + "]";
	}
	

}
