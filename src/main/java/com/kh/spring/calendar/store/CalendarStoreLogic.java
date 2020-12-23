package com.kh.spring.calendar.store;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Repository;

import com.kh.spring.calendar.domain.MonthPay;
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

	@Override
	public int calDelete(Reserve re) {
		return sqlSession.delete("calendarMapper.calDelete", re);
	}

	@Override
	public int monthInsert(MonthPay mp) {
		return sqlSession.update("calendarMapper.monthpayInsert", mp);
	}

	@Override
	public MonthPay getMonthPay(String memberId) {
		return sqlSession.selectOne("calendarMapper.getMonthPay", memberId);
	}

	@Override
	public int autoPayment(MonthPay mp) {
		return sqlSession.update("calendarMapper.autoPayment", mp);
	}

	@Override
	public int autoMonth(HashMap<String, String> hash) {
		return sqlSession.insert("calendarMapper.autoMonth", hash);
	}

	@Override
	public MonthPay getCheckPay(HashMap<String, String> para) {
		return sqlSession.selectOne("calendarMapper.getCheckPay", para);
	}
		
}
