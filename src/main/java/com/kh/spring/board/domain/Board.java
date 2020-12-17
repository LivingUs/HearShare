package com.kh.spring.board.domain;

import java.sql.Date;

public class Board {
	
	private int bNo;
	private String bTitle;
	private String bContent;
	private Date bWriteDate;
	private Date bUpdateDate;
	private String bFileName;
	private int bLike;
	private int bViewNo;
	private String bHead;
	private String memberId;
	
	public Board () {
		
	}

	public Board(int bNo, String bTitle, String bContent, Date bWriteDate, Date bUpdateDate, String bFileName,
			int bLike, int bViewNo, String bHead, String memberId) {
		super();
		this.bNo = bNo;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bWriteDate = bWriteDate;
		this.bUpdateDate = bUpdateDate;
		this.bFileName = bFileName;
		this.bLike = bLike;
		this.bViewNo = bViewNo;
		this.bHead = bHead;
		this.memberId = memberId;
	}

	public int getbNo() {
		return bNo;
	}

	public void setbNo(int bNo) {
		this.bNo = bNo;
	}

	public String getbTitle() {
		return bTitle;
	}

	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}

	public String getbContent() {
		return bContent;
	}

	public void setbContent(String bContent) {
		this.bContent = bContent;
	}

	public Date getbWriteDate() {
		return bWriteDate;
	}

	public void setbWriteDate(Date bWriteDate) {
		this.bWriteDate = bWriteDate;
	}

	public Date getbUpdateDate() {
		return bUpdateDate;
	}

	public void setbUpdateDate(Date bUpdateDate) {
		this.bUpdateDate = bUpdateDate;
	}

	public String getbFileName() {
		return bFileName;
	}

	public void setbFileName(String bFileName) {
		this.bFileName = bFileName;
	}

	public int getbLike() {
		return bLike;
	}

	public void setbLike(int bLike) {
		this.bLike = bLike;
	}

	public int getbViewNo() {
		return bViewNo;
	}

	public void setbViewNo(int bViewNo) {
		this.bViewNo = bViewNo;
	}

	public String getbHead() {
		return bHead;
	}

	public void setbHead(String bHead) {
		this.bHead = bHead;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	@Override
	public String toString() {
		return "Board [bNo=" + bNo + ", bTitle=" + bTitle + ", bContent=" + bContent + ", bWriteDate=" + bWriteDate
				+ ", bUpdateDate=" + bUpdateDate + ", bFileName=" + bFileName + ", bLike=" + bLike + ", bViewNo="
				+ bViewNo + ", bHead=" + bHead + ", memberId=" + memberId + "]";
	}
	
}
