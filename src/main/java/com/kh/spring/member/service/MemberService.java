package com.kh.spring.member.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.spring.member.domain.Account;
import com.kh.spring.member.domain.MonthPay;
import com.kh.spring.member.domain.Reserve;
import com.kh.spring.member.domain.Ticket;

public interface MemberService {
	
	//스터디룸 사용내역 출력
	public ArrayList<Reserve> studyPayList();
	public ArrayList<Reserve> studySelect(HashMap<String, String> paramMap);

	//스터디룸 결제내역 출력
	public ArrayList<Ticket> studyTicketList();
	
	//헬스룸 결제내역 출력
	public ArrayList<Reserve> healthHealthList();
	
	//헬스룸 사용내역 출력
	public ArrayList<Ticket> healthTicketList();
	
	//정기권 구매하기
	public int insertTicket(Ticket ticket);

	//이번달 자동결제 출력
	public ArrayList<MonthPay> autoPayOne();
	
	//전체 자동결제 출력
	public ArrayList<MonthPay> autoPayList();
	
	//가계부 입력
	public int insertAccount(Account account);
	
	//이번달 가계부 출력
	public ArrayList<Account> accountList();
	
	//이번달 쉐어하우스
	
	
	
	
	
	
}
