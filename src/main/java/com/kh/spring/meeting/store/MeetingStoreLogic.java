package com.kh.spring.meeting.store;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.meeting.domain.Mcomment;
import com.kh.spring.meeting.domain.Meeting;
import com.kh.spring.place.domain.Place;

@Repository
public class MeetingStoreLogic implements MeetingStore {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Meeting> meetingList() {
		return (ArrayList)sqlSession.selectList("meetingMapper.meetingList");
	}

	@Override
	public int meetingWrite(Meeting meeting) {
		return sqlSession.insert("meetingMapper.meetingWrite", meeting);
	}
	
	@Override
	public Place selectPlace(int pNo) {
		int currentVal = selectCurrVal();
		HashMap<String, Integer> hashMap = new HashMap<String, Integer>();
		hashMap.put("pNo", pNo);
		hashMap.put("mNo", currentVal);
		return sqlSession.selectOne("meetingMapper.selectPlace", hashMap);
	}
	/*
	 * @Override public Place selectPlace(int pNo) { int mNo = selectCurrVal();
	 * System.out.println(mNo); return
	 * sqlSession.selectOne("meetingMapper.selectPlace", pNo); }
	 */
	
	public int selectCurrVal() {
		return sqlSession.selectOne("meetingMapper.selectCurrVal");
	}
	
	@Override
	public Meeting meetingdetail(int mNo) {
		return sqlSession.selectOne("meetingMapper.meetingdetail", mNo);
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
