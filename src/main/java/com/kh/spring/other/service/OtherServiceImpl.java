package com.kh.spring.other.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.other.domain.Account;
import com.kh.spring.other.domain.MonthPay;
import com.kh.spring.other.domain.PageInfo;
import com.kh.spring.other.domain.Reserve;
import com.kh.spring.other.domain.Ticket;
import com.kh.spring.other.store.OtherStore;

@Service
public class OtherServiceImpl implements OtherService{

	@Autowired
	private OtherStore store;
	
	@Override
	public ArrayList<Reserve> studyPayList(Reserve reserve) {
		return store.studyPayList(reserve);
	}
	
	@Override
	public ArrayList<Reserve> studySelect(HashMap<String, String> paramMap) {
		return store.studySelect(paramMap);
	}
	
	@Override
	public Ticket studyTicket(Ticket ticket) {
		return store.studyTicket(ticket);
	}
	
	@Override
	public ArrayList<Ticket> studyTicketList(PageInfo pi, Ticket ticket) {
		return store.studyTicketList(pi, ticket);
	}
	
	@Override
	public int getListCount(Ticket ticket) {
		return store.getListCount(ticket);
	}

	@Override
	public ArrayList<Reserve> healthPayList(Reserve reserve) {
		return store.healthPayList(reserve);
	}
	
	@Override
	public ArrayList<Reserve> healthSelect(HashMap<String, String> paramMap) {
		return store.healthSelect(paramMap);
	}
	
	@Override
	public Ticket healthTicket(Ticket ticket) {
		return store.healthTicket(ticket);
	}
	
	@Override
	public ArrayList<Ticket> healthTicketList(PageInfo pi, Ticket ticket) {
		return store.healthTicketList(pi, ticket);
	}

	@Override
	public int getListCountHealth(Ticket ticket) {
		return store.getListCountHealth(ticket);
	}
	
	@Override
	public int insertStudyTicket(Ticket ticket) {
		return store.insertStudyTicket(ticket);
	}

	@Override
	public int insertHealthTicket(Ticket ticket) {
		return store.insertHealthTicket(ticket);
	}

	@Override
	public int autoPayStop(MonthPay monthPay) {
		return store.autoPayStop(monthPay);
	}

	@Override
	public ArrayList<MonthPay> autoPayList(MonthPay monthPay) {
		return store.autoPayList(monthPay);
	}

	@Override
	public int insertAccount(Account account) {
		return store.insertAccount(account);
	}

	@Override
	public ArrayList<Account> accountList(PageInfo pi, Account account) {
		return store.accountList(pi, account);
	}

	@Override
	public int getListCountAccount(Account account) {
		return store.getListCountAccount(account);
	}

	@Override
	public Account accountSum(Account account) {
		return store.accountSum(account);
	}

	@Override
	public ArrayList<Reserve> monthList(Reserve reserve) {
		return store.monthList(reserve);
	}

	@Override
	public ArrayList<Account> excelConvert(Account account) {
		return store.excelConvert(account);
	}

	@Override
	public ArrayList<Account> chart(Account account) {
		return store.chart(account);
	}

	@Override
	public ArrayList<Reserve> checkIdStudy(String memberId) {
		return store.checkIdStudy(memberId);
	}

	@Override
	public int checkSelectStudy(ArrayList<Integer> rNoList) {
		return store.checkSelectStudy(rNoList);
	}

	@Override
	public ArrayList<Reserve> checkIdHealth(String memberId) {
		return store.checkIdHealth(memberId);
	}

	@Override
	public int checkSelectHealth(ArrayList<Integer> rNoList) {
		return store.checkSelectHealth(rNoList);
	}	
	




}
