package com.kh.spring.reserve.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.reserve.domain.Reserve;
import com.kh.spring.reserve.domain.Ticket;
import com.kh.spring.reserve.service.ReserveService;

@Controller
public class ReserveContoroller {
	
	@Autowired
	private ReserveService rService;
	
	//예약 화면 View
	@RequestMapping(value="studyReserve.do", method=RequestMethod.GET)
	public String studyReserveView() {
		return "reservation/studyReserve";
	}
	@RequestMapping(value="healthReserve.do", method=RequestMethod.GET)
	public String healthReserveView() {
		return "reservation/healthReserve";
	}
	@RequestMapping(value="bbqReserve.do", method=RequestMethod.GET)
	public String bbqReserveView() {
		return "reservation/bbqReserve";
	}
	
	//예약 인서트
	@RequestMapping(value="reserveInsert.do", method=RequestMethod.POST)
	public ModelAndView reserveInsert(ModelAndView mv, Reserve reserve, Ticket ticket, HttpServletRequest request) {
		int result = 0;
		return mv;
	}
}
