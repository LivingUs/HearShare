package com.kh.spring.other.store;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.spring.other.domain.Account;
import com.kh.spring.other.domain.MonthPay;
import com.kh.spring.other.domain.PageInfo;
import com.kh.spring.other.domain.Reserve;
import com.kh.spring.other.domain.Ticket;

public interface OtherStore {

	//스터디룸 사용내역 출력
	public ArrayList<Reserve> studyPayList(Reserve reserve);
	public ArrayList<Reserve> studySelect(HashMap<String, String> paramMap);
	public Ticket studyTicket(Ticket ticket);

	//스터디룸 결제내역 출력
	public ArrayList<Ticket> studyTicketList(PageInfo pi, Ticket ticket);
	public int getListCount(Ticket ticket);
	
	//헬스룸 사용내역 출력
	public ArrayList<Reserve> healthPayList(Reserve reserve);
	public ArrayList<Reserve> healthSelect(HashMap<String, String> paramMap);
	public Ticket healthTicket(Ticket ticket);

	//헬스룸 결제내역 출력
	public ArrayList<Ticket> healthTicketList(PageInfo pi, Ticket ticket);
	public int getListCountHealth(Ticket ticket);
	
	//정기권 구매하기
	public int insertStudyTicket(Ticket ticket);
	public int insertHealthTicket(Ticket ticket);

	//자동결제 해지
	public int autoPayStop(MonthPay monthPay);
	
	//전체 자동결제 출력
	public ArrayList<MonthPay> autoPayList(MonthPay monthPay);
	
	//가계부 입력
	public int insertAccount(Account account);
	
	//이번달 가계부 출력
	public ArrayList<Account> accountList(PageInfo pi, Account account);
	public int getListCountAccount(Account account);
	public Account accountSum(Account account);
	
	//이번달 쉐어하우스
	public ArrayList<Reserve> monthList(Reserve reserve);
	
	//엑셀
	public ArrayList<Account> excelConvert(Account account);
	
	//차트
	public ArrayList<Account> chart();
}
