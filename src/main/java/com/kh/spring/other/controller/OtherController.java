package com.kh.spring.other.controller;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor.HSSFColorPredefined;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.other.domain.Account;
import com.kh.spring.other.domain.MonthPay;
import com.kh.spring.other.domain.PageInfo;
import com.google.gson.Gson;
import com.kh.spring.common.Pagination;
import com.kh.spring.member.domain.Member;
import com.kh.spring.other.domain.Reserve;
import com.kh.spring.other.domain.Ticket;
import com.kh.spring.other.service.OtherService;

@Controller
public class OtherController {
	
	@Autowired
	private OtherService service;
	@Autowired
	private HttpServletRequest request;
	
	//스터디룸 사용내역 출력
	@RequestMapping(value="payAllList.do", method=RequestMethod.GET)
	public String PayAllList(Model model, HttpServletRequest request, HttpServletResponse response,
				@RequestParam(value="page", required=false)Integer page) {
		//세션
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		String memberId = loginMember.getMemberId();
		Reserve reserve = new Reserve();
		Ticket ticket = new Ticket();
		reserve.setMemberId(memberId);
		ticket.setMemberId(memberId);
		//사용내역 출력
		ArrayList<Reserve> spList = service.studyPayList(reserve);

		//남은갯수
		Ticket studyTicket = service.studyTicket(ticket);
		
		//결제내역 출력(페이징)
		int currentPage = (page != null) ? page : 1;
		int listCount = service.getListCount(ticket);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<Ticket> tList = service.studyTicketList(pi, ticket);
		
		if(!spList.isEmpty() || !tList.isEmpty() || studyTicket != null) {
			model.addAttribute("studyPay", spList);
			model.addAttribute("studyTicket", studyTicket);
			model.addAttribute("tList", tList);
			model.addAttribute("pi", pi);
			return "other/ticket";
		}else {
			model.addAttribute("msg","조회 실패");
			return "other/ticket";
		}
	}

	//스터디 사용내역 날짜검색
	@RequestMapping(value="studySelect.do", method=RequestMethod.GET)
	public String studySelect(HttpServletResponse response, Model model,
			@RequestParam("year") String year, @RequestParam("month") String month) throws Exception{
		//세션
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		String memberId = loginMember.getMemberId();
		Reserve reserve = new Reserve();
		Ticket ticket = new Ticket();
		reserve.setMemberId(memberId);
		ticket.setMemberId(memberId);
		
		HashMap<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("year", year);
		paramMap.put("month", month);
		paramMap.put("memberId", memberId);
		ArrayList<Reserve> studySelect = service.studySelect(paramMap);
		
		//남은갯수
		Ticket studyTicket = service.studyTicket(ticket);
		
		if(!studySelect.isEmpty() || studyTicket != null) {
			model.addAttribute("studyPay", studySelect);
			model.addAttribute("studyTicket", studyTicket);
			return "other/ticket";
		}else {
			model.addAttribute("msg","조회 실패");
            return "other/ticket";
		}
	}
	
	//스터디 결제내역 출력
	@RequestMapping(value="studyTicketList.do", method=RequestMethod.GET)
	public String studyTicketList(Model model, HttpServletRequest request,
			@RequestParam(value="page", required=false)Integer page) {
		//세션
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		String memberId = loginMember.getMemberId();
		Ticket ticket = new Ticket();
		ticket.setMemberId(memberId);
		
		//결제내역 출력
		int currentPage = (page != null) ? page : 1;
		int listCount = service.getListCount(ticket);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<Ticket> tList = service.studyTicketList(pi, ticket);
		if(!tList.isEmpty()) {
			model.addAttribute("tList", tList);
			model.addAttribute("pi", pi);
			return "other/payHistory";
		}else {
			model.addAttribute("msg","조회 실패");
			return "other/payHistory";
		}
	}

	//헬스룸 사용내역 출력
	@RequestMapping(value="healthPay.do", method=RequestMethod.GET)
	public String healthPayList(Model model, HttpServletRequest request,
				@RequestParam(value="page", required=false)Integer page) {
		//세션
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		String memberId = loginMember.getMemberId();
		Reserve reserve = new Reserve();
		Ticket ticket = new Ticket();
		reserve.setMemberId(memberId);
		ticket.setMemberId(memberId);
		
		ArrayList<Reserve> hpList = service.healthPayList(reserve);
		
		//남은 갯수
		Ticket healthTicket = service.healthTicket(ticket);
		
		//결제내역 출력
		int currentPage = (page != null) ? page : 1;
		int listCount = service.getListCountHealth(ticket);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<Ticket> thList = service.healthTicketList(pi, ticket);
		
		if(!hpList.isEmpty() || !thList.isEmpty() || healthTicket != null) {
			model.addAttribute("healthPay", hpList);
			model.addAttribute("healthTicket", healthTicket);
			model.addAttribute("thList", thList);
			model.addAttribute("pi", pi);
			return "other/ticketHealth";
		}else {
			model.addAttribute("msg","조회 실패");
			return "other/ticketHealth";
		}
	}

	//헬스 사용내역 날짜검색
	@RequestMapping(value="healthSelect.do", method=RequestMethod.GET)
	public String healthSelect(HttpServletResponse response, Model model,
			@RequestParam("year") String year, @RequestParam("month") String month) throws Exception{
		//세션
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		String memberId = loginMember.getMemberId();
		Reserve reserve = new Reserve();
		Ticket ticket = new Ticket();
		reserve.setMemberId(memberId);
		ticket.setMemberId(memberId);
		
		HashMap<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("year", year);
		paramMap.put("month", month);
		paramMap.put("memberId", memberId);
		ArrayList<Reserve> healthSelect = service.healthSelect(paramMap);
		
		//남은 갯수
		Ticket healthTicket = service.healthTicket(ticket);
		
		if(!healthSelect.isEmpty() || healthTicket != null) {
			model.addAttribute("healthPay", healthSelect);
			model.addAttribute("healthTicket", healthTicket);
			return "other/ticketHealth";
		}else {
			model.addAttribute("msg","조회 실패");
            return "other/ticketHealth";
		}
	}	

	//헬스 결제내역 출력
	@RequestMapping(value="healthTicketList.do", method=RequestMethod.GET)
	public String healthTicketList(Model model, HttpServletRequest request,
				@RequestParam(value="page", required=false)Integer page) {
		//세션
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		String memberId = loginMember.getMemberId();
		Ticket ticket = new Ticket();
		ticket.setMemberId(memberId);
		
		//결제내역 출력
		int currentPage = (page != null) ? page : 1;
		int listCount = service.getListCountHealth(ticket);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<Ticket> thList = service.healthTicketList(pi, ticket);
		if(!thList.isEmpty()) {
			model.addAttribute("thList", thList);
			model.addAttribute("pi", pi);
			return "other/payHistoryHealth";
		}else {
			model.addAttribute("msg","조회 실패");
			return "other/payHistoryHealth";
		}
	}	
	
	//스터디 정기권 구매
	@RequestMapping(value="insertStudyTicket.do", method=RequestMethod.POST)
	public String insertStudyTicket(Model model, int tPriceNo) throws Exception {
		//세션
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		String memberId = loginMember.getMemberId();
		Ticket ticket = new Ticket();
		ticket.setMemberId(memberId);
		ticket.settPriceNo(tPriceNo);
		int result = service.insertStudyTicket(ticket);
		
		if(result > 0) {
			return "other/ticket";
		}else {
			return "other/ticket";
		}
	}
	
	//헬스 정기권 구매
	@RequestMapping(value="insertHealthTicket.do", method=RequestMethod.POST)
	public String insertHealthTicket(Model model, int tPriceNo) {
		//세션
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		String memberId = loginMember.getMemberId();
		Ticket ticket = new Ticket();
		ticket.setMemberId(memberId);
		ticket.settPriceNo(tPriceNo);
		
		int result = service.insertHealthTicket(ticket);
		if(result > 0) {
			return "other/ticketHealth";
		}else {
			model.addAttribute("msg", "에러 발생");
			return "other/ticketHealth";
		}
	}
	
	//정기결제 리스트
	@RequestMapping(value="autoPayList.do", method=RequestMethod.GET)
	public String autoPayList(Model model) {
		//세션
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		String memberId = loginMember.getMemberId();
		MonthPay monthPay = new MonthPay();
		monthPay.setMemberId(memberId);
		
		ArrayList<MonthPay> mList = service.autoPayList(monthPay);
		if(!mList.isEmpty()) {
			model.addAttribute("mList", mList);
			return "other/autoPay";
		}else {
			model.addAttribute("msg", "정기결제 리스트 출력 실패");
			return "other/autoPay";
		}
	}
	
	//정기결제 해지
	@RequestMapping(value="autoPayStop.do", method=RequestMethod.GET)
	public String autoPayStop(HttpServletRequest request, Model model) {
		//세션
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		String memberId = loginMember.getMemberId();
		MonthPay monthPay = new MonthPay();
		monthPay.setMemberId(memberId);
		
		int result = service.autoPayStop(monthPay);
		if(result > 0) {
			return "redirect:autoPayList.do";
		}else {
			model.addAttribute("msg", "해지 실패");
			return "redirect:autoPayList.do";
		}
	}
	
	//가계부 입력
	@RequestMapping(value="insertAccount.do", method=RequestMethod.POST)
	public String insertAccount(Model model, Account account) {
		//세션
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		String memberId = loginMember.getMemberId();
		account.setMemberId(memberId);

		int result = service.insertAccount(account);
		if(result > 0) {
			return "redirect:accountList.do";
		}else {
			model.addAttribute("msg", "가계부 저장 실패");
			return "redirect:accountList.do";
		}
	}
	
	//이번달 가계부 출력
	@RequestMapping(value="accountList.do", method=RequestMethod.GET)
	public ModelAndView accountList(ModelAndView mv,
					@RequestParam(value="page", required=false)Integer page) {
		//세션
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		String memberId = loginMember.getMemberId();
		Account account = new Account();
		Reserve reserve = new Reserve();
		account.setMemberId(memberId);
		reserve.setMemberId(memberId);
		
		int currentPage = (page != null) ? page : 1;
		int listCount = service.getListCountAccount(account);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<Account> aList = service.accountList(pi, account);
		
		ArrayList<Reserve> monthList = service.monthList(reserve);
		Account accountSum = service.accountSum(account);
		if(!aList.isEmpty() || !monthList.isEmpty() || accountSum!=null) {
			mv.addObject("aList", aList);
			mv.addObject("pi", pi);
			mv.addObject("month", monthList);
			mv.addObject("accountSum", accountSum);
			mv.setViewName("other/chart");
		}else {
			mv.addObject("msg", "이번달 가계부 조회 실패");
			mv.setViewName("other/chart");
		}
		return mv;
	}
	
	//엑셀출력
	@RequestMapping(value="excelConvert.do", method=RequestMethod.GET)
	public void excelConvert(HttpServletResponse response) throws Exception {
		//세션
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		String memberId = loginMember.getMemberId();
		Account account = new Account();
		account.setMemberId(memberId);
		//리스트 받아오기
		ArrayList<Account> eList = service.excelConvert(account);
		//워크북 및 시트 생성
		Workbook wb = new HSSFWorkbook();
		Sheet sheet = wb.createSheet("이번달 가계부");
		//행 객체 생성
		Row row = null;
		//셀 생성
		Cell cell = null;
		int rowNo = 0;
		//컬럼 폭 설정
	    sheet.setColumnWidth(1, 6000);
	    sheet.setColumnWidth(2, 3000);
	    sheet.setColumnWidth(3, 4000);
	    sheet.setColumnWidth(4, 7000);
	    //headStyle
		CellStyle headStyle = wb.createCellStyle();
		headStyle.setBorderTop(BorderStyle.THIN);
		headStyle.setBorderBottom(BorderStyle.THIN);
		headStyle.setFillForegroundColor(HSSFColorPredefined.ROSE.getIndex());
		headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
		headStyle.setAlignment(HorizontalAlignment.CENTER);
		Font headFont = wb.createFont();
		headFont.setFontName("나눔고딕");
		headFont.setFontHeight((short)(16*20));
		headFont.setBold(true);
		headStyle.setFont(headFont);
		//bodyStyle
		CellStyle bodyStyle = wb.createCellStyle();
	    bodyStyle.setBorderTop(BorderStyle.THIN);
	    bodyStyle.setBorderBottom(BorderStyle.THIN);
	    bodyStyle.setDataFormat((short) 0xe);
	    bodyStyle.setAlignment(HorizontalAlignment.CENTER);
	    Font bodyFont = wb.createFont();
	    bodyFont.setFontName("나눔고딕");
	    bodyFont.setFontHeight((short)(15*20));
	    bodyStyle.setFont(bodyFont);
	    //헤더 생성
	    rowNo++;
	    row = sheet.createRow(rowNo++);
	    
	    cell = row.createCell(1);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("날짜");
	    cell = row.createCell(2);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("분류");
	    cell = row.createCell(3);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("내용");
	    cell = row.createCell(4);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("금액");
	    //받아온 리스트로 반복
	    for(Account acc : eList) {
	    	//행 생성
	        row = sheet.createRow(rowNo++);
	        
	        cell = row.createCell(1);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(acc.getAcDate());
	        cell = row.createCell(2);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(acc.getAcBig());
	        cell = row.createCell(3);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(acc.getAcSmall());
	        cell = row.createCell(4);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(acc.getAcPrice());
	    }
	    //현재시각 구하기
	    String inDate = new java.text.SimpleDateFormat("yyMM").format(new java.util.Date());
	    //컨텐츠 타입과 파일명 지정
	    response.setContentType("application/vnd.ms-excel");
	    response.setHeader("Content-Disposition", "attachment;filename=HearShare_"+inDate+".xls");
	    //엑셀 출력
	    wb.write(response.getOutputStream());
	    wb.close();
	}
	
	//차트
	@ResponseBody
	@RequestMapping(value="chart.do", method=RequestMethod.GET)
	public String chart(Model model, HttpServletResponse response) throws Exception {
		//세션
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		String memberId = loginMember.getMemberId();
		Account account = new Account();
		account.setMemberId(memberId);
		
		ArrayList<Account> chartList = service.chart(account);
		//DB > JSON 변환
		Gson gson = new Gson();
		String chartData = gson.toJson(chartList);
		return chartData;
	}
		
	//스터디룸 체크인 화면
	@RequestMapping(value="checkInStudyView.do", method=RequestMethod.GET)
	public String stduyCheckInView() {
		return "checkIn/studyCheckInView";
	}
	
	//스터디 아이디 검색 후 출력
	@ResponseBody
	@RequestMapping(value="checkIdStudy.do", method=RequestMethod.GET)
	public void checkIdStudy(Model model, String memberId, HttpServletResponse response) throws Exception{
		ArrayList<Reserve> checkStudy = service.checkIdStudy(memberId);
		
		for(Reserve check : checkStudy) {
			check.setrTime(URLEncoder.encode(check.getrTime(), "UTF-8"));
		}
		
		Gson gson = new Gson();
		gson.toJson(checkStudy, response.getWriter());
		
	}
	
	//스터디룸 체크인하기
	@RequestMapping(value="checkSelectStudy.do", method=RequestMethod.GET)
	public String checkInStudy(Model model, HttpServletResponse response, HttpServletRequest reqeust) {
		
		//chkbox의 name값으로 파라미터 넘겨받아 배열로 생성
		String [] studySelect = request.getParameterValues("studyCheck");
		//String 문자열을 int형 배열로 바꿔줌
		ArrayList<Integer> rNoList = new ArrayList<Integer>();
		for(int i=0; i<studySelect.length; i++) {
			rNoList.add(Integer.parseInt(studySelect[i]));
		}
		int result = service.checkSelectStudy(rNoList);
		if(result > 0) {
			model.addAttribute("msg", "체크인 되었습니다.");
			return "checkIn/studyCheckInView";
		}else {
			model.addAttribute("msg", "체크인에 실패했습니다.");
			return "checkIn/studyCheckInView";	
		}
	}

	//헬스 아이디 검색 후 출력
	@ResponseBody
	@RequestMapping(value="checkIdHealth.do", method=RequestMethod.GET)
	public void checkIdHealth(Model model, String memberId, HttpServletResponse response) throws Exception{
		ArrayList<Reserve> checkHealth = service.checkIdStudy(memberId);
		
		for(Reserve check : checkHealth) {
			check.setrTime(URLEncoder.encode(check.getrTime(), "UTF-8"));
		}
		
		Gson gson = new Gson();
		gson.toJson(checkHealth, response.getWriter());
		
	}
	
	//헬스룸 체크인하기
	@RequestMapping(value="checkSelectHealth.do", method=RequestMethod.GET)
	public String checkInHealth(Model model, HttpServletResponse response, HttpServletRequest reqeust) {
		
		//chkbox의 name값으로 파라미터 넘겨받아 배열로 생성
		String [] healthSelect = request.getParameterValues("healthCheck");
		//String 문자열을 int형 배열로 바꿔줌
		ArrayList<Integer> rNoList = new ArrayList<Integer>();
		for(int i=0; i<healthSelect.length; i++) {
			rNoList.add(Integer.parseInt(healthSelect[i]));
		}
		int result = service.checkSelectHealth(rNoList);
		if(result > 0) {
			model.addAttribute("msg", "체크인 되었습니다.");
			return "checkIn/healthCheckInView";
		}else {
			model.addAttribute("msg", "체크인에 실패했습니다.");
			return "checkIn/healthCheckInView";	
		}
	}


}
