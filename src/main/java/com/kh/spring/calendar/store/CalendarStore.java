package com.kh.spring.calendar.store;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.spring.reserve.domain.Reserve;

public interface CalendarStore {

	public ArrayList<Reserve> reserveList(String memberId);
	public ArrayList<Reserve> reserveToday(HashMap<String, String> para);
}
