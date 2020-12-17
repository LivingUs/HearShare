package com.kh.spring.meeting.store;

import java.util.ArrayList;
import java.util.List;

import com.kh.spring.meeting.domain.Mcomment;
import com.kh.spring.meeting.domain.Meeting;
import com.kh.spring.place.domain.Place;

public interface MeetingStore {

	public ArrayList<Meeting> meetingList();
	public int meetingWrite(Meeting meeting);
	public Place selectPlace(int pNo);
	public Meeting meetingdetail(int mNo);
	public int meetingDelete(int mNo);
	public int addComment(Mcomment comment);
	public ArrayList<Mcomment> commentList(int mNo);
	public int CommentDelete(int mcNo);
}
