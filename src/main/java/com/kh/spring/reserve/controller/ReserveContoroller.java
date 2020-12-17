package com.kh.spring.reserve.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.spring.reserve.domain.Reserve;
import com.kh.spring.reserve.domain.Ticket;
import com.kh.spring.reserve.service.ReserveService;

@Controller
public class ReserveContoroller {
	
	@Autowired
	private ReserveService rService;
	
	//예약 화면 View
	@RequestMapping(value="studyReserve.do", method=RequestMethod.GET)
	public String studyReserveView(Model model) {
		String memberId = "admin";
		String rCode = "S";
		
		HashMap<String, String> para = new HashMap<String, String>();
		para.put("memberId", memberId); 
		para.put("rCode", rCode);
		 
		Ticket tList = rService.bringTicket(para);
		/* ArrayList<Reserve> rList = rService.reserveList(para);
		System.out.println(rList.toString()); */
			model.addAttribute("tList", tList);
			/* model.addAttribute("rList", rList); */
			return "reservation/studyReserve";
	}
	@RequestMapping(value="healthReserve.do", method=RequestMethod.GET)
	public String healthReserveView(Model model) {
		String memberId = "admin";
		String rCode = "H";
		
		HashMap<String, String> para = new HashMap<String, String>();
		para.put("memberId", memberId); 
		para.put("rCode", rCode);
		
		Ticket tList = rService.bringTicket(para);
		
		model.addAttribute("tList", tList);
		return "reservation/healthReserve";	
	}
	
	@RequestMapping(value="bbqReserve.do", method=RequestMethod.GET)
	public String bbqReserveView() {
		return "reservation/bbqReserve";
	}
	
	//예약리스트 Ajax
	@RequestMapping(value="reserveList.do", method=RequestMethod.GET)
	public void reserveList(HttpServletResponse response, String date, String rCode) throws Exception {
		String memberId = "admin";
		HashMap<String, String> para = new HashMap<String, String>();
		para.put("rDate", date);
		para.put("rCode", rCode);
		 
		ArrayList<Reserve> rList = rService.reserveList(para);
		System.out.println(rList.toString());
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-mm-dd").create();
		gson.toJson(rList, response.getWriter());
	}
	
	//예약 인서트
	@ResponseBody
	@RequestMapping(value="reserveInsert.do")
	public String reserveInsert(String date, String rCode, @RequestParam(value="tNo", required=false) Integer tNo, HttpServletRequest request, 
			@RequestParam(value="tUseNo", required=false) Integer tUseNo, @RequestParam(value="tPriceNo", required=false) Integer tPriceNo) {
		int result = 0;
		int ticketResult = 0;
		String [] timeList = request.getParameterValues("tList");
		String memberId = "admin";
		
		//정기권 사용X
		if(tNo==0) {
			ArrayList<Reserve> reserve = new ArrayList<Reserve>();
			for(int i=0; i<timeList.length; i++) {
				Reserve reOne = new Reserve();
				reOne.setMemberId(memberId);
				reOne.setrTime(timeList[i]);
				reOne.setrDate(date);
				reOne.setrCode(rCode);
				reOne.setrTyn("N");
				reserve.add(reOne);
			}
			result = rService.insertReserve(reserve);
			
		//정기권 사용O
		} else {
			ArrayList<Reserve> reserve = new ArrayList<Reserve>();
			for(int i=0; i<timeList.length; i++) {
				Reserve reOne = new Reserve();
				reOne.setMemberId(memberId);
				reOne.setrTime(timeList[i]);
				reOne.setrDate(date);
				reOne.setrCode(rCode);
				reOne.setrTyn("Y");
				reserve.add(reOne);
			}
			result = rService.insertReserve(reserve);
			
			//티켓 사용갯수 업데이트
			int tAmount = timeList.length;
			int sum = tAmount + tUseNo;
			Ticket ticket = new Ticket();
			ticket.settNo(tNo);
			ticket.setMemberId(memberId);
			ticket.settUseNo(sum);
			
			if(tPriceNo==sum) {
				ticketResult = rService.ticketEnd(ticket);
			} else {
				ticketResult = rService.ticketUpdate(ticket);
			}
		}
		
		if(result>0) {
			return "OK";
		} else {
			return "error";
		}
	}
	
	//바베큐장 인서트
	@ResponseBody
	@RequestMapping(value="bbqInsert.do")
	public String bbqInsert(HttpServletRequest request, String rTime, String date) {
		String memberId = "admin";
		Reserve reserve = new Reserve();
		reserve.setMemberId(memberId);
		reserve.setrCode("B");
		reserve.setrDate(date);
		reserve.setrTime(rTime);
		
		int result = rService.bbqInsert(reserve);
		System.out.println(result);
		if(result>0) {
			return "OK";
		} else {
			return "error";
		}
	}
}
