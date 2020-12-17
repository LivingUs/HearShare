package com.kh.spring.meeting.domain;

import java.sql.Timestamp;

public class Mcomment {

	private int mcNo;
	private String mcContent; 
	private Timestamp mcTime;
	private String memberId;
	private int mNo;
	
	public Mcomment() {}

	public int getMcNo() {
		return mcNo;
	}

	public void setMcNo(int mcNo) {
		this.mcNo = mcNo;
	}

	public String getMcContent() {
		return mcContent;
	}

	public void setMcContent(String mcContent) {
		this.mcContent = mcContent;
	}

	public Timestamp getMcTime() {
		return mcTime;
	}

	public void setMcTime(Timestamp mcTime) {
		this.mcTime = mcTime;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	@Override
	public String toString() {
		return "Mcomment [mcNo=" + mcNo + ", mcContent=" + mcContent + ", mcTime=" + mcTime + ", memberId=" + memberId
				+ ", mNo=" + mNo + "]";
	}
}
