package com.kh.spring.calendar.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.calendar.domain.MonthPay;
import com.kh.spring.calendar.store.CalendarStore;
import com.kh.spring.reserve.domain.Reserve;
@Service
public class CalendarServiceImpl implements CalendarService {

	@Autowired
	private CalendarStore cStore;

	@Override
	public ArrayList<Reserve> reserveList(String memberId) {
		return cStore.reserveList(memberId);
	}

	@Override
	public ArrayList<Reserve> reserveToday(HashMap<String, String> para) {
		return cStore.reserveToday(para);
	}

	@Override
	public int calDelete(Reserve re) {
		return cStore.calDelete(re);
	}

	@Override
	public int monthInsert(MonthPay mp) {
		return cStore.monthInsert(mp);
	}

	@Override
	public MonthPay getMonthPay(String memberId) {
		return cStore.getMonthPay(memberId);
	}

	@Override
	public int autoPayment(MonthPay mp) {
		return cStore.autoPayment(mp);
	}

	@Override
	public int autoMonth(HashMap<String, String> hash) {
		return cStore.autoMonth(hash);
	}

	@Override
	public MonthPay getCheckPay(HashMap<String, String> para) {
		return cStore.getCheckPay(para);
	}
}
