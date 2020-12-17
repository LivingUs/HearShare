package com.kh.spring.board.domain;

public class BoardLike {
	private int likeNo;
	private String lCheckYn;
	private int bNo;
	private String memberId;
	
	public BoardLike() {
		
	}

	public BoardLike(int likeNo, String lCheckYn, int bNo, String memberId) {
		super();
		this.likeNo = likeNo;
		this.lCheckYn = lCheckYn;
		this.bNo = bNo;
		this.memberId = memberId;
	}

	public int getLikeNo() {
		return likeNo;
	}

	public void setLikeNo(int likeNo) {
		this.likeNo = likeNo;
	}

	public String getlCheckYn() {
		return lCheckYn;
	}

	public void setlCheckYn(String lCheckYn) {
		this.lCheckYn = lCheckYn;
	}

	public int getbNo() {
		return bNo;
	}

	public void setbNo(int bNo) {
		this.bNo = bNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	@Override
	public String toString() {
		return "BoardLike [likeNo=" + likeNo + ", lCheckYn=" + lCheckYn + ", bNo=" + bNo + ", memberId=" + memberId
				+ "]";
	}
	
	
	
}
