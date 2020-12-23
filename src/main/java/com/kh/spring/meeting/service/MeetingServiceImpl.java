package com.kh.spring.meeting.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.meeting.domain.Mcomment;
import com.kh.spring.meeting.domain.Meeting;
import com.kh.spring.meeting.domain.MeetingDetail;
import com.kh.spring.meeting.domain.Minsert;
import com.kh.spring.meeting.store.MeetingStore;
import com.kh.spring.place.domain.Place;

@Service
public class MeetingServiceImpl implements MeetingService {

	@Autowired
	private MeetingStore mStore;
	
	@Override
	public ArrayList<Meeting> meetingList() {
		return mStore.meetingList();
	}
	
	@Override
	public ArrayList<Meeting> meetingInsertList(Minsert minsert) {
		return mStore.meetingInsertList(minsert);
	}

	@Override
	public int meetingWrite(Meeting meeting) {
		return mStore.meetingWrite(meeting);
	}
	
	@Override
	public MeetingDetail meetingdetail(int mNo, Integer pNo) {
		return mStore.meetingdetail(mNo, pNo);
	}
	
	@Override
	public Meeting meetingdetail(int mNo) {
		return mStore.meetingdetail(mNo);
	}
	
	@Override
	public int meetingJoin(Meeting meeting) {
		return mStore.meetingJoin(meeting);
	}
	
	@Override
	public ArrayList<Meeting> meetingDday() {
		return mStore.meetingDday();
	}
	
	@Override
	public int meetingDeadline(Meeting meeting2) {
		return mStore.meetingDeadline(meeting2);
	}
	
	@Override
	public int meetingTimeDeadline() {
		return mStore.meetingTimeDeadline();
	}
	
	@Override
	public int meetingJoinInsert(Minsert minsert) {
		return mStore.meetingJoinInsert(minsert);
	}
	
	@Override
	public int meetingDelete(int mNo) {
		return mStore.meetingDelete(mNo);
	}

	@Override
	public int addComment(Mcomment comment) {
		return mStore.addComment(comment);
	}

	@Override
	public ArrayList<Mcomment> commentList(int mNo) {
		return mStore.commentList(mNo);
	}

	@Override
	public int CommentDelete(int mcNo) {
		return mStore.CommentDelete(mcNo);
	}




}
