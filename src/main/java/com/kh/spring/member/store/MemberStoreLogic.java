package com.kh.spring.member.store;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.spring.member.domain.Account;
import com.kh.spring.member.domain.MonthPay;
import com.kh.spring.member.domain.Ticket;
import com.kh.spring.member.domain.Reserve;

@Repository
public class MemberStoreLogic implements MemberStore {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Reserve> studyPayList() {
		return (ArrayList)sqlSession.selectList("MemberMapper.studyPayList");
	}
	
	@Override
	public ArrayList<Reserve> studySelect(HashMap<String, String> paramMap) {
		return (ArrayList)sqlSession.selectList("MemberMapper.studySelect", paramMap);
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
