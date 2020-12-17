package com.kh.spring.other.store;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.spring.other.domain.Account;
import com.kh.spring.other.domain.MonthPay;
import com.kh.spring.other.domain.PageInfo;
import com.kh.spring.other.domain.Reserve;
import com.kh.spring.other.domain.Ticket;

@Repository
public class OtherStoreLogic implements OtherStore {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Reserve> studyPayList(Reserve reserve) {
		return (ArrayList)sqlSession.selectList("OtherMapper.studyPayList", reserve);
	}
	
	@Override
	public ArrayList<Reserve> studySelect(HashMap<String, String> paramMap) {
		return (ArrayList)sqlSession.selectList("OtherMapper.studySelect", paramMap);
	}
	
	@Override
	public Ticket studyTicket(Ticket ticket) {
		return sqlSession.selectOne("OtherMapper.studyTicket", ticket);
	}
	
	@Override
	public ArrayList<Ticket> studyTicketList(PageInfo pi, Ticket ticket) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("OtherMapper.studyTicketList", ticket, rowBounds);
	}
	
	@Override
	public int getListCount(Ticket ticket) {
		return sqlSession.selectOne("OtherMapper.getListCount", ticket);
	}
	
	@Override
	public ArrayList<Reserve> healthPayList(Reserve reserve) {
		return (ArrayList)sqlSession.selectList("OtherMapper.healthPayList", reserve);
	}
	
	@Override
	public ArrayList<Reserve> healthSelect(HashMap<String, String> paramMap) {
		return (ArrayList)sqlSession.selectList("OtherMapper.healthSelect", paramMap);
	}
	
	@Override
	public Ticket healthTicket(Ticket ticket) {
		return sqlSession.selectOne("OtherMapper.healthTicket", ticket);
	}
	
	@Override
	public ArrayList<Ticket> healthTicketList(PageInfo pi, Ticket ticket) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("OtherMapper.healthTicketList", ticket, rowBounds);
	}
	
	@Override
	public int getListCountHealth(Ticket ticket) {
		return sqlSession.selectOne("OtherMapper.getListCountHealth", ticket);
	}
	@Override
	public int insertStudyTicket(Ticket ticket) {
		return sqlSession.insert("OtherMapper.insertStudyTicket",ticket);
	}

	@Override
	public int insertHealthTicket(Ticket ticket) {
		return sqlSession.insert("OtherMapper.insertHealthTicket",ticket);
	}

	@Override
	public int autoPayStop(MonthPay monthPay) {
		return sqlSession.update("OtherMapper.autoPayStop", monthPay);
	}

	@Override
	public ArrayList<MonthPay> autoPayList(MonthPay monthPay) {
		return (ArrayList)sqlSession.selectList("OtherMapper.autoPayList", monthPay);
	}

	@Override
	public int insertAccount(Account account) {
		return sqlSession.insert("OtherMapper.insertAccount", account);
	}

	@Override
	public ArrayList<Account> accountList(PageInfo pi, Account account) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("OtherMapper.accountList", account, rowBounds);
	}

	@Override
	public int getListCountAccount(Account account) {
		return sqlSession.selectOne("OtherMapper.getListCountAccount", account);
	}

	@Override
	public Account accountSum(Account account) {
		return sqlSession.selectOne("OtherMapper.accountSum", account);
	}

	@Override
	public ArrayList<Reserve> monthList(Reserve reserve) {
		return (ArrayList)sqlSession.selectList("OtherMapper.monthList", reserve);
	}

	@Override
	public ArrayList<Account> excelConvert(Account account) {
		return (ArrayList)sqlSession.selectList("OtherMapper.excelConvert",account);
	}

	@Override
	public ArrayList<Account> chart() {
		return (ArrayList)sqlSession.selectList("OtherMapper.chart");
	}







}
