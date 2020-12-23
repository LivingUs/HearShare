package com.kh.spring.meeting.domain;

public class Minsert {
	
	private int minNo;
	private int mNo;
	private String memberId;
	
	public Minsert() {}

	public int getMinNo() {
		return minNo;
	}

	public void setMinNo(int minNo) {
		this.minNo = minNo;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	@Override
	public String toString() {
		return "Minsert [minNo=" + minNo + ", mNo=" + mNo + ", memberId=" + memberId + "]";
	}
}
