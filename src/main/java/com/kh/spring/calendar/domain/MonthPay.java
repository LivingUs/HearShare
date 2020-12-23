package com.kh.spring.calendar.domain;

import java.sql.Date;
import java.sql.Timestamp;

public class MonthPay {
	
	private int mpNo;
	private String mpDate;
	private int mpPrice;
	private String mpMeans;
	private String mpTyn;
	private String memberId;
	private String mYn;
	private Date mUpdate;
	
	public MonthPay() {
		super();
		// TODO Auto-generated constructor stub
	}
	

	public MonthPay(int mpNo, String mpDate, int mpPrice, String mpMeans, String mpTyn, String memberId, String mYn,
			Date mUpdate) {
		super();
		this.mpNo = mpNo;
		this.mpDate = mpDate;
		this.mpPrice = mpPrice;
		this.mpMeans = mpMeans;
		this.mpTyn = mpTyn;
		this.memberId = memberId;
		this.mYn = mYn;
		this.mUpdate = mUpdate;
	}
	public Date getmUpdate() {
		return mUpdate;
	}
	public void setmUpdate(Date mUpdate) {
		this.mUpdate = mUpdate;
	}


	public int getMpNo() {
		return mpNo;
	}
	public void setMpNo(int mpNo) {
		this.mpNo = mpNo;
	}
	
	public String getMpDate() {
		return mpDate;
	}


	public void setMpDate(String mpDate) {
		this.mpDate = mpDate;
	}


	public String getmYn() {
		return mYn;
	}


	public void setmYn(String mYn) {
		this.mYn = mYn;
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
				+ ", mpTyn=" + mpTyn + ", memberId=" + memberId + ", mYn=" + mYn + ", mUpdate=" + mUpdate + "]";
	}
}
