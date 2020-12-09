package com.kh.spring.member.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.member.service.MemberService;
import com.kh.spring.member.domain.Reserve;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	//스터디룸 사용내역 출력
	@RequestMapping(value="payAllList.do", method=RequestMethod.GET)
	public String PayAllList(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		//Member member = (Member)session.getAttribute("loginUser");
		ArrayList<Reserve> spList = mService.studyPayList();
		if(!spList.isEmpty()) {
			model.addAttribute("studyPay", spList);
			return "member/ticket";
		}else {
			model.addAttribute("msg","조회 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping(value="studySelect.do", method=RequestMethod.GET)
	public String studySelect(HttpServletResponse response, Model model, @RequestParam("year") String year, @RequestParam("month") String month) throws Exception{
		HashMap<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("year", year);
		paramMap.put("month", month);
		ArrayList<Reserve> studySelect = mService.studySelect(paramMap);
		System.out.println(year);
		System.out.println(month);
		if(!studySelect.isEmpty()) {
			model.addAttribute("studyPay", studySelect);
			return "member/ticket";
		}else {
			model.addAttribute("msg","에러 발생");
            return "member/ticket";
		}
	}

	
	
}
