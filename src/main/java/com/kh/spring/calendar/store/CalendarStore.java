package com.kh.spring.calendar.store;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.spring.calendar.domain.MonthPay;
import com.kh.spring.reserve.domain.Reserve;

public interface CalendarStore {

	public ArrayList<Reserve> reserveList(String memberId);
	public ArrayList<Reserve> reserveToday(HashMap<String, String> para);
	public int calDelete(Reserve re);
	public int monthInsert(MonthPay mp);
	public MonthPay getMonthPay(String memberId);
	public int autoPayment(MonthPay mp);
	public int autoMonth(HashMap<String, String> hash);
	public MonthPay getCheckPay(HashMap<String, String> para);
}
