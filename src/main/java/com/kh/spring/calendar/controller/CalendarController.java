package com.kh.spring.calendar.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.spring.calendar.service.CalendarService;
import com.kh.spring.reserve.domain.Reserve;

@Controller
public class CalendarController {

	@Autowired
	private CalendarService cService;
	
	/* 캘린더 페이지 */
	@RequestMapping(value = "calendar.do", method = RequestMethod.GET)
	public String calendarView(Model model) {
		 
		return "calendar/calendar";
	}
	
	@RequestMapping(value="reserveMyList.do", method=RequestMethod.GET)
	public void reserveList(HttpServletResponse response) throws Exception {
		String memberId = "admin";
		ArrayList<Reserve> rList = cService.reserveList(memberId);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-mm-dd").create();
		gson.toJson(rList, response.getWriter());
	}
	
	@RequestMapping(value="reserveToday.do", method=RequestMethod.GET)
	public void reserveToday(HttpServletResponse response, String today) throws Exception {
		
	  String memberId = "admin"; 
	  System.out.println(today);
	  
	  HashMap<String, String> para = new HashMap<String, String>();
	  para.put("today", today); 
	  para.put("memberId", memberId);
	  
	  ArrayList<Reserve> rToday = cService.reserveToday(para);
	  
	  for(Reserve r : rToday) {
		  	String str = r.getrTime();
			r.setrTime(str.substring(0,2));
		}
	  
	  System.out.println(rToday.toString());
	  Gson gson = new GsonBuilder().setDateFormat("yyyy-mm-dd").create();
	  gson.toJson(rToday, response.getWriter());
	}
	
	

}
