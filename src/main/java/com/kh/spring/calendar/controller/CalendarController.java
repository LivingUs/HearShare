package com.kh.spring.calendar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CalendarController {
	
	@RequestMapping(value="calendar.do", method=RequestMethod.GET)
	public String calendarView() {
		return "calendar/calendar";
	}

}
