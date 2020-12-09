package com.kh.spring.member.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.member.domain.Account;
import com.kh.spring.member.domain.MonthPay;
import com.kh.spring.member.domain.Reserve;
import com.kh.spring.member.domain.Ticket;
import com.kh.spring.member.store.MemberStore;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberStore mStore;
	
	@Override
	public ArrayList<Reserve> studyPayList() {
		return mStore.studyPayList();
	}
	
	@Override
	public ArrayList<Reserve> studySelect(HashMap<String, String> paramMap) {
		return mStore.studySelect(paramMap);
	}
	
	@Override
	public ArrayList<Ticket> studyTicketList() {
		return null;
	}

	@Override
	public ArrayList<Reserve> healthHealthList() {
		return null;
	}

	@Override
	public ArrayList<Ticket> healthTicketList() {
		return null;
	}

	@Override
	public int insertTicket(Ticket ticket) {
		return 0;
	}

	@Override
	public ArrayList<MonthPay> autoPayOne() {
		return null;
	}

	@Override
	public ArrayList<MonthPay> autoPayList() {
		return null;
	}

	@Override
	public int insertAccount(Account account) {
		return 0;
	}

	@Override
	public ArrayList<Account> accountList() {
		return null;
	}

}
