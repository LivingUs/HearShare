package com.kh.spring.place.domain;

public class Mlike {
	
	private int mlikeNo;
	private String mCheckYn;
	private int pNo;
	private String memberId;
	
	public Mlike() {}

	public int getMlikeNo() {
		return mlikeNo;
	}

	public void setMlikeNo(int mlikeNo) {
		this.mlikeNo = mlikeNo;
	}

	public String getmCheckYn() {
		return mCheckYn;
	}

	public void setmCheckYn(String mCheckYn) {
		this.mCheckYn = mCheckYn;
	}

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	@Override
	public String toString() {
		return "Mlike [mlikeNo=" + mlikeNo + ", mCheckYn=" + mCheckYn + ", pNo=" + pNo + ", memberId=" + memberId + "]";
	}
}
