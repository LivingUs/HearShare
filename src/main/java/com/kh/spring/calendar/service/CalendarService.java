package com.kh.spring.calendar.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.spring.calendar.domain.MonthPay;
import com.kh.spring.reserve.domain.Reserve;

public interface CalendarService {
	//개인 예약 리스트
	public ArrayList<Reserve> reserveList(String memberId);
	//오늘의 예약 리스트
	public ArrayList<Reserve> reserveToday(HashMap<String, String> para);
	//일정 삭제
	public int calDelete(Reserve re);
	//월세 결제
	public int monthInsert(MonthPay mp);
	//월세 정기결제 유무 확인
	public MonthPay getMonthPay(String memberId);
	//월세 정기결제
	public int autoPayment(MonthPay mp);
	//월세 일정 자동 인서트
	public int autoMonth(HashMap<String, String> hash);
	//월세 정기결제 유무 검사
	public MonthPay getCheckPay(HashMap<String, String> para);

}
