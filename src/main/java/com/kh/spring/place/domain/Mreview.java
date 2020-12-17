package com.kh.spring.place.domain;

import java.sql.Timestamp;

public class Mreview {

	private int mrNo;
	private String memberId;
	private String mrContent;
	private Timestamp mrTime;
	private int pNo;
	
	public Mreview() {}

	public int getMrNo() {
		return mrNo;
	}

	public void setMrNo(int mrNo) {
		this.mrNo = mrNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMrContent() {
		return mrContent;
	}

	public void setMrContent(String mrContent) {
		this.mrContent = mrContent;
	}

	public Timestamp getMrTime() {
		return mrTime;
	}

	public void setMrTime(Timestamp mrTime) {
		this.mrTime = mrTime;
	}

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	@Override
	public String toString() {
		return "Mreview [mrNo=" + mrNo + ", memberId=" + memberId + ", mrContent=" + mrContent + ", mrTime=" + mrTime
				+ ", pNo=" + pNo + "]";
	}
}
