package com.kh.spring.reserve.domain;

import java.sql.Date;

public class Ticket {
	
	private int tNo;
	private Date tDate;
	private int tPriceNo;
	private int tUseNo;
	private String tCode;
	private String memberId;
	private String tYn;
	
	public Ticket() {}

	public Ticket(int tNo, Date tDate, int tPriceNo, int tUseNo, String tCode, String memberId, String tYn) {
		super();
		this.tNo = tNo;
		this.tDate = tDate;
		this.tPriceNo = tPriceNo;
		this.tUseNo = tUseNo;
		this.tCode = tCode;
		this.memberId = memberId;
		this.tYn = tYn;
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
	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	
	

	public String gettYn() {
		return tYn;
	}

	public void settYn(String tYn) {
		this.tYn = tYn;
	}

	@Override
	public String toString() {
		return "Ticket [tNo=" + tNo + ", tDate=" + tDate + ", tPriceNo=" + tPriceNo + ", tUseNo=" + tUseNo + ", tCode="
				+ tCode + ", memberId=" + memberId + ", tYn=" + tYn + "]";
	}

	
}
