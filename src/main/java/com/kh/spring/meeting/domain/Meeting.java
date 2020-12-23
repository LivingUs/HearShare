package com.kh.spring.meeting.domain;

import java.sql.Date;
import java.sql.Timestamp;

public class Meeting {

	private int mNo;
	private String mTitle;
	private String mContent;
	private Date mWritedate;
	private Date mUpdatedate;
	private String moriginalFileName;
	private String mrenameFileName;
	private int mPeople;
	private int mDate;
	private String mJYN;
	private String mYN;
	private Date mtime;
	private String memberId;
	private int pNo;
	
	public Meeting() {}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public String getmTitle() {
		return mTitle;
	}

	public void setmTitle(String mTitle) {
		this.mTitle = mTitle;
	}

	public String getmContent() {
		return mContent;
	}

	public void setmContent(String mContent) {
		this.mContent = mContent;
	}

	public Date getmWritedate() {
		return mWritedate;
	}

	public void setmWritedate(Date mWritedate) {
		this.mWritedate = mWritedate;
	}

	public Date getmUpdatedate() {
		return mUpdatedate;
	}

	public void setmUpdatedate(Date mUpdatedate) {
		this.mUpdatedate = mUpdatedate;
	}

	public String getMoriginalFileName() {
		return moriginalFileName;
	}

	public void setMoriginalFileName(String moriginalFileName) {
		this.moriginalFileName = moriginalFileName;
	}

	public String getMrenameFileName() {
		return mrenameFileName;
	}

	public void setMrenameFileName(String mrenameFileName) {
		this.mrenameFileName = mrenameFileName;
	}

	public int getmPeople() {
		return mPeople;
	}

	public void setmPeople(int mPeople) {
		this.mPeople = mPeople;
	}

	public int getmDate() {
		return mDate;
	}

	public void setmDate(int mDate) {
		this.mDate = mDate;
	}

	public String getmJYN() {
		return mJYN;
	}

	public void setmJYN(String mJYN) {
		this.mJYN = mJYN;
	}

	public String getmYN() {
		return mYN;
	}

	public void setmYN(String mYN) {
		this.mYN = mYN;
	}

	public Date getMtime() {
		return mtime;
	}

	public void setMtime(Date mtime) {
		this.mtime = mtime;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	@Override
	public String toString() {
		return "Meeting [mNo=" + mNo + ", mTitle=" + mTitle + ", mContent=" + mContent + ", mWritedate=" + mWritedate
				+ ", mUpdatedate=" + mUpdatedate + ", moriginalFileName=" + moriginalFileName + ", mrenameFileName="
				+ mrenameFileName + ", mPeople=" + mPeople + ", mDate=" + mDate + ", mJYN=" + mJYN + ", mYN=" + mYN
				+ ", mtime=" + mtime + ", memberId=" + memberId + ", pNo=" + pNo + "]";
	}
}