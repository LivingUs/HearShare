package com.kh.spring.meeting.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.spring.meeting.domain.Mcomment;
import com.kh.spring.meeting.domain.Meeting;
import com.kh.spring.meeting.domain.MeetingDetail;
import com.kh.spring.meeting.domain.Minsert;
import com.kh.spring.place.domain.Place;

public interface MeetingService {
	
	public ArrayList<Meeting> meetingList();
	public ArrayList<Meeting> meetingInsertList(Minsert minsert);
	public int meetingWrite(Meeting meeting);
	public Meeting meetingdetail(int mNo);
	public int meetingJoin(Meeting meeting);
	public ArrayList<Meeting> meetingDday();
	public int meetingDeadline(Meeting meeting2);
	public int meetingTimeDeadline();
	public int meetingJoinInsert(Minsert minsert);
	public int meetingDelete(int mNo);
	public int addComment(Mcomment comment);
	public ArrayList<Mcomment> commentList(int mNo);
	public int CommentDelete(int mcNo);
	public MeetingDetail meetingdetail(int mNo, Integer pNo);
}
