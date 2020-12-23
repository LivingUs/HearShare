package com.kh.spring.meeting.store;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Repository;

import com.kh.spring.meeting.domain.Mcomment;
import com.kh.spring.meeting.domain.Meeting;
import com.kh.spring.meeting.domain.MeetingDetail;
import com.kh.spring.meeting.domain.Minsert;
import com.kh.spring.place.domain.Place;

@Repository
public class MeetingStoreLogic implements MeetingStore {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Scheduled(cron = "0 0 0 * * *")
    public void scheldulerlog() {
    	System.out.println("스케줄링 테스트");
    }
	
	@Override
	public ArrayList<Meeting> meetingList() {
		return (ArrayList)sqlSession.selectList("meetingMapper.meetingList");
	}
	
	@Override
	public ArrayList<Meeting> meetingInsertList(Minsert minsert) {
		return (ArrayList)sqlSession.selectList("meetingMapper.meetingInsertList", minsert);
	}

	@Override
	public int meetingWrite(Meeting meeting) {
		return sqlSession.insert("meetingMapper.meetingWrite", meeting);
	}
	
	@Override
	public MeetingDetail meetingdetail(int mNo, Integer pNo) {
		HashMap<String, Integer> hashMap = new HashMap<String, Integer>();
		hashMap.put("pNo", pNo);
		hashMap.put("mNo", mNo);
		return sqlSession.selectOne("meetingMapper.meetingDetailPlace", hashMap);
	}
	
	@Override
	public Meeting meetingdetail(int mNo) {
		return sqlSession.selectOne("meetingMapper.meetingdetail", mNo);
	}
	
	@Override
	public int meetingJoin(Meeting meeting) {
		return sqlSession.update("meetingMapper.meetingJoin", meeting);
	}
	
	@Override
	public ArrayList<Meeting> meetingDday() {
		return (ArrayList)sqlSession.selectList("meetingMapper.meetingDday");
	}
	
	@Override
	public int meetingDeadline(Meeting meeting2) {
		return sqlSession.update("meetingMapper.meetingDeadline", meeting2);
	}
	
	@Override
	public int meetingTimeDeadline() {
		return sqlSession.update("meetingMapper.meetingTimeDeadline");
	}
	
	@Override
	public int meetingJoinInsert(Minsert minsert) {
		System.out.println(minsert);
		return sqlSession.insert("meetingMapper.meetingJoinInsert", minsert);
	}
	
	@Override
	public int meetingDelete(int mNo) {
		return sqlSession.delete("meetingMapper.meetingDelete", mNo);
	}

	@Override
	public int addComment(Mcomment comment) {
		return sqlSession.insert("meetingMapper.addComment", comment);
	}

	@Override
	public ArrayList<Mcomment> commentList(int mNo) {
		return (ArrayList)sqlSession.selectList("meetingMapper.commentList", mNo);
	}

	@Override
	public int CommentDelete(int mcNo) {
		return sqlSession.delete("meetingMapper.CommentDelete", mcNo);
	}
}
