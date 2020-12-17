package com.kh.spring.board.domain;

import java.sql.Date;
import java.sql.Timestamp;

public class BoardComment {
	
	private int bcNo;
	private String bcContent;
	private Timestamp bcTime;
	private String memberId;
	private int bNo;
	
	public BoardComment () {
		
	}

	public BoardComment(int bcNo, String bcContent, Timestamp bcTime, String memberId, int bNo) {
		super();
		this.bcNo = bcNo;
		this.bcContent = bcContent;
		this.bcTime = bcTime;
		this.memberId = memberId;
		this.bNo = bNo;
	}

	public int getBcNo() {
		return bcNo;
	}

	public void setBcNo(int bcNo) {
		this.bcNo = bcNo;
	}

	public String getBcContent() {
		return bcContent;
	}

	public void setBcContent(String bcContent) {
		this.bcContent = bcContent;
	}

	public Timestamp getBcTime() {
		return bcTime;
	}

	public void setBcTime(Timestamp bcTime) {
		this.bcTime = bcTime;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getbNo() {
		return bNo;
	}

	public void setbNo(int bNo) {
		this.bNo = bNo;
	}

	@Override
	public String toString() {
		return "BoardComment [bcNo=" + bcNo + ", bcContent=" + bcContent + ", bcTime=" + bcTime + ", memberId="
				+ memberId + ", bNo=" + bNo + "]";
	}
	
	
	
	
}
