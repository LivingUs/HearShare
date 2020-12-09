package com.kh.spring.reserve.domain;

import java.sql.Date;

public class Ticket {
	
	private int tNo;
	private Date tDate;
	private int tPriceNo;
	private int tUseNo;
	private String tCode;
	
	public Ticket() {}

	public Ticket(int tNo, Date tDate, int tPriceNo, int tUseNo, String tCode) {
		super();
		this.tNo = tNo;
		this.tDate = tDate;
		this.tPriceNo = tPriceNo;
		this.tUseNo = tUseNo;
		this.tCode = tCode;
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

	@Override
	public String toString() {
		return "Ticket [tNo=" + tNo + ", tDate=" + tDate + ", tPriceNo=" + tPriceNo + ", tUseNo=" + tUseNo + ", tCode="
				+ tCode + "]";
	}
	
	
}
