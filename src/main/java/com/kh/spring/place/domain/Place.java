package com.kh.spring.place.domain;

public class Place {
	
	private int pNo;
	private String pTitle;
	private String pmTitle;
	private String pAddr;
	private String pPhone;
	private String pPrice;
	private String pParkYN;
	private String pSaletime;
	private String pClosedate;
	private String pFilename;
	
	public Place() {}

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	public String getpTitle() {
		return pTitle;
	}

	public void setpTitle(String pTitle) {
		this.pTitle = pTitle;
	}

	public String getPmTitle() {
		return pmTitle;
	}

	public void setPmTitle(String pmTitle) {
		this.pmTitle = pmTitle;
	}

	public String getpAddr() {
		return pAddr;
	}

	public void setpAddr(String pAddr) {
		this.pAddr = pAddr;
	}

	public String getpPhone() {
		return pPhone;
	}

	public void setpPhone(String pPhone) {
		this.pPhone = pPhone;
	}

	public String getpPrice() {
		return pPrice;
	}

	public void setpPrice(String pPrice) {
		this.pPrice = pPrice;
	}

	public String getpParkYN() {
		return pParkYN;
	}

	public void setpParkYN(String pParkYN) {
		this.pParkYN = pParkYN;
	}

	public String getpSaletime() {
		return pSaletime;
	}

	public void setpSaletime(String pSaletime) {
		this.pSaletime = pSaletime;
	}

	public String getpClosedate() {
		return pClosedate;
	}

	public void setpClosedate(String pClosedate) {
		this.pClosedate = pClosedate;
	}

	public String getpFilename() {
		return pFilename;
	}

	public void setpFilename(String pFilename) {
		this.pFilename = pFilename;
	}

	@Override
	public String toString() {
		return "Place [pNo=" + pNo + ", pTitle=" + pTitle + ", pmTitle=" + pmTitle + ", pAddr=" + pAddr + ", pPhone="
				+ pPhone + ", pPrice=" + pPrice + ", pParkYN=" + pParkYN + ", pSaletime=" + pSaletime + ", pClosedate="
				+ pClosedate + ", pFilename=" + pFilename + "]";
	}
}
