package com.kh.spring.member.domain;

import java.sql.Date;

public class MonthPay {
	
	private int mpNo;
	private Date mpDate;
	private int mpPrice;
	private String mpMeans;
	private String mpTyn;
	private String memberId;
	public MonthPay() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MonthPay(int mpNo, Date mpDate, int mpPrice, String mpMeans, String mpTyn, String memberId) {
		super();
		this.mpNo = mpNo;
		this.mpDate = mpDate;
		this.mpPrice = mpPrice;
		this.mpMeans = mpMeans;
		this.mpTyn = mpTyn;
		this.memberId = memberId;
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
	@Override
	public String toString() {
		return "MonthPay [mpNo=" + mpNo + ", mpDate=" + mpDate + ", mpPrice=" + mpPrice + ", mpMeans=" + mpMeans
				+ ", mpTyn=" + mpTyn + ", memberId=" + memberId + "]";
	}
	
	

}
