package com.kh.spring.calendar.store;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.reserve.domain.Reserve;

@Repository
public class CalendarStoreLogic implements CalendarStore {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<Reserve> reserveList(String memberId) {
		return (ArrayList)sqlSession.selectList("calendarMapper.reserveList", memberId);
	}

	@Override
	public ArrayList<Reserve> reserveToday(HashMap<String, String> para) {
		return (ArrayList)sqlSession.selectList("calendarMapper.reserveToday", para);
	}
		
}
