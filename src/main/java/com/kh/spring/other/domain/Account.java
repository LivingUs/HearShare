package com.kh.spring.other.domain;

import java.sql.Date;

public class Account {
	
	private int acNo;
	private String acInOut;
	private Date acDate;
	private String acPrice;
	private String acPirce;
	private String acBig;
	private String acSmall;
	private String memberId;
	private int acIn;
	private int acOut;
	
	public Account() {
		super();
	}

	public Account(int acNo, String acInOut, Date acDate, String acPrice, String acPirce, String acBig, String acSmall,
			String memberId, int acIn, int acOut) {
		super();
		this.acNo = acNo;
		this.acInOut = acInOut;
		this.acDate = acDate;
		this.acPrice = acPrice;
		this.acPirce = acPirce;
		this.acBig = acBig;
		this.acSmall = acSmall;
		this.memberId = memberId;
		this.acIn = acIn;
		this.acOut = acOut;
	}

	public int getAcNo() {
		return acNo;
	}

	public void setAcNo(int acNo) {
		this.acNo = acNo;
	}

	public String getAcInOut() {
		return acInOut;
	}

	public void setAcInOut(String acInOut) {
		this.acInOut = acInOut;
	}

	public Date getAcDate() {
		return acDate;
	}

	public void setAcDate(Date acDate) {
		this.acDate = acDate;
	}

	public String getAcPrice() {
		return acPrice;
	}

	public void setAcPrice(String acPrice) {
		this.acPrice = acPrice;
	}

	public String getAcPirce() {
		return acPirce;
	}

	public void setAcPirce(String acPirce) {
		this.acPirce = acPirce;
	}

	public String getAcBig() {
		return acBig;
	}

	public void setAcBig(String acBig) {
		this.acBig = acBig;
	}

	public String getAcSmall() {
		return acSmall;
	}

	public void setAcSmall(String acSmall) {
		this.acSmall = acSmall;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getAcIn() {
		return acIn;
	}

	public void setAcIn(int acIn) {
		this.acIn = acIn;
	}

	public int getAcOut() {
		return acOut;
	}

	public void setAcOut(int acOut) {
		this.acOut = acOut;
	}

	@Override
	public String toString() {
		return "Account [acNo=" + acNo + ", acInOut=" + acInOut + ", acDate=" + acDate + ", acPrice=" + acPrice
				+ ", acPirce=" + acPirce + ", acBig=" + acBig + ", acSmall=" + acSmall + ", memberId=" + memberId
				+ ", acIn=" + acIn + ", acOut=" + acOut + "]";
	}
	

	
	
	
	

}
