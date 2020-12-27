package com.kh.spring.calendar.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.spring.calendar.domain.MonthPay;
import com.kh.spring.calendar.service.CalendarService;
import com.kh.spring.member.domain.Member;
import com.kh.spring.reserve.domain.Reserve;

@Controller
public class CalendarController {

	@Autowired
	private CalendarService cService;

	/* 캘린더 페이지 */
	@RequestMapping(value = "calendar.do", method = RequestMethod.GET)
	public String calendarView(HttpSession session, HttpServletResponse response, Model model) {
		
		String memberId = ((Member)session.getAttribute("loginMember")).getMemberId(); 
		MonthPay pay = cService.getMonthPay(memberId);

		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		int day = cal.get(Calendar.DAY_OF_MONTH);
		
		
		if(pay!=null) { 
		//자동 정기결제 
			if(pay.getMpTyn().equals("Y")) { 
				if(day==23) {
					HashMap<String, String> para = new HashMap<String, String>();
					para.put("memberId", memberId); 
					para.put("today", "2021-01-01");
					  
					MonthPay checkPay = cService.getCheckPay(para);
					System.out.println(checkPay.toString());
		  
					if(checkPay.getmYn().equals("N")) {
						String today = year+"-"+month+"-"+day; 
						MonthPay mp = new MonthPay();
						mp.setMemberId(memberId); 
						mp.setMpPrice(428500); 
						mp.setMpTyn("Y");
						mp.setMpMeans("card"); 
						mp.setMpDate("2021-01-01"); 
						mp.setmYn("Y"); 
						int result = cService.autoPayment(mp);
							if(result>0) {
								int auto = cService.autoMonth(para);
							}
					} 
				} 
			}
		}
		 
		 
		 
		return "calendar/calendar";
	}

	/* 캘린더 전체 리스트 */
	@RequestMapping(value = "reserveMyList.do", method = RequestMethod.GET)
	public void reserveList(HttpSession session, HttpServletResponse response) throws Exception {
		String memberId = ((Member)session.getAttribute("loginMember")).getMemberId();;
		ArrayList<Reserve> rList = cService.reserveList(memberId);
		
		System.out.println(rList.toString());

		Gson gson = new GsonBuilder().setDateFormat("yyyy-mm-dd").create();
		gson.toJson(rList, response.getWriter());
	}

	/* 캘린더 투데이 리스트 */
	@RequestMapping(value = "reserveToday.do", method = RequestMethod.GET)
	public void reserveToday(HttpSession session, HttpServletResponse response, String today) throws Exception {

		String memberId = "admin";

		HashMap<String, String> para = new HashMap<String, String>();
		para.put("today", today);
		para.put("memberId", memberId);

		ArrayList<Reserve> rToday = cService.reserveToday(para);

		for (Reserve r : rToday) {
			String str = r.getrTime();
			r.setrTime(str.substring(0, 2));
		}
		Gson gson = new GsonBuilder().setDateFormat("yyyy-mm-dd").create();
		gson.toJson(rToday, response.getWriter());
	}

	/*
	 * public void addMonthpay() { Calendar cal = Calendar.getInstance();
	 * 
	 * int year = cal.get(Calendar.YEAR); int month = cal.get(Calendar.MONTH) + 1;
	 * int day = cal.get(Calendar.DAY_OF_MONTH);
	 * 
	 * }
	 */
	
	/* 일정 삭제 */
	@ResponseBody
	@RequestMapping(value = "calDelete.do", method = RequestMethod.GET)
	public String calDelete(HttpSession session, @RequestParam(value = "calNo", required = false) Integer calNo,
			HttpServletResponse response) {
		System.out.println(calNo);
		String memberId = ((Member)session.getAttribute("loginMember")).getMemberId();;
		Reserve re = new Reserve();
		re.setMemberId(memberId);
		re.setrNo(calNo);
		int result = cService.calDelete(re);
		System.out.println(result);

		if (result > 0) {
			return "ok";
		} else {
			return "fail";
		}
	}
	
	/* 월세 결제 페이지 뷰 */
	@RequestMapping(value="monthpayView.do", method=RequestMethod.GET)
	public String monthpayView(HttpSession session, Model model, @RequestParam("mpNo") Integer mpNo) {
		
		  String memberName = ((Member)session.getAttribute("loginMember")).getMemberName();
		 
		model.addAttribute("mpNo", mpNo);
		model.addAttribute("memberName", memberName); 
		return "calendar/monthpay";
	}
	
	/* 월세 인서트 */
	@ResponseBody
	@RequestMapping(value="monthpayInsert.do", method=RequestMethod.POST)
	public String monthpayInsert(HttpSession session, String payway, Integer total, Integer mpNo) {
		String memberId = ((Member)session.getAttribute("loginMember")).getMemberId();;
		
		Calendar cal = Calendar.getInstance();

		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		String time1= year+"-"+month+"-"+"01";
		
		HashMap<String, String> hash = new HashMap<String, String>();
		hash.put("today", time1);
		hash.put("memberId", memberId);
		
		MonthPay mp = new MonthPay();
		mp.setMemberId(memberId);
		mp.setMpPrice(total);
		mp.setMpTyn("N");
		mp.setMpMeans(null);
		mp.setMpNo(mpNo);
		mp.setMpDate(time1);
		
		if(payway.equals("basic")) {
			mp.setMemberId(memberId);
			mp.setMpPrice(total);
			mp.setMpTyn("N");
			mp.setMpMeans(null);
			mp.setMpNo(mpNo);
			mp.setMpDate(time1);
			
			int result = cService.monthInsert(mp);
			if(result>0) {
				int auto = cService.autoMonth(hash);
				return "OK";
			} else {
				return "error";
			}
			
		} else {
			mp.setMemberId(memberId);
			mp.setMpPrice(total);
			mp.setMpTyn("Y");
			mp.setMpMeans("card");
			mp.setMpNo(mpNo);
			mp.setMpDate(time1);
			
			//새로운 월세 일정 자동 인서트
			int result = cService.monthInsert(mp);
			if(result>0) {
				int auto = cService.autoMonth(hash);
				System.out.println(auto);
					return "OK";
			} else {
				return "error";
			}
		}
	}

}
