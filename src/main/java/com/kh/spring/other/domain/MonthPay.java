package com.kh.spring.other.domain;

import java.sql.Date;

public class MonthPay {
	
	private int mpNo;
	private Date mpDate;
	private int mpPrice;
	private String mpMeans;
	private String mpTyn;
	private String memberId;
	private String nextPay;
	
	public MonthPay() {
		super();
	}

	public MonthPay(int mpNo, Date mpDate, int mpPrice, String mpMeans, String mpTyn, String memberId, String nextPay) {
		super();
		this.mpNo = mpNo;
		this.mpDate = mpDate;
		this.mpPrice = mpPrice;
		this.mpMeans = mpMeans;
		this.mpTyn = mpTyn;
		this.memberId = memberId;
		this.nextPay = nextPay;
	}

	public int getMpNo() {
		return mpNo;
	}

	public void setMpNo(int mpNo) {
		this.mpNo = mpNo;
	}

	public Date getMpDate() {
		return mpDate;
	}

	public void setMpDate(Date mpDate) {
		this.mpDate = mpDate;
	}

	public int getMpPrice() {
		return mpPrice;
	}

	public void setMpPrice(int mpPrice) {
		this.mpPrice = mpPrice;
	}

	public String getMpMeans() {
		return mpMeans;
	}

	public void setMpMeans(String mpMeans) {
		this.mpMeans = mpMeans;
	}

	public String getMpTyn() {
		return mpTyn;
	}

	public void setMpTyn(String mpTyn) {
		this.mpTyn = mpTyn;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getNextPay() {
		return nextPay;
	}

	public void setNextPay(String nextPay) {
		this.nextPay = nextPay;
	}

	@Override
	public String toString() {
		return "MonthPay [mpNo=" + mpNo + ", mpDate=" + mpDate + ", mpPrice=" + mpPrice + ", mpMeans=" + mpMeans
				+ ", mpTyn=" + mpTyn + ", memberId=" + memberId + ", nextPay=" + nextPay + "]";
	}
	
	
}
