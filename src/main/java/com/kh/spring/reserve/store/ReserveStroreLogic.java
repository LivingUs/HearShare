package com.kh.spring.reserve.store;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.reserve.domain.Reserve;
import com.kh.spring.reserve.domain.Ticket;
@Repository
public class ReserveStroreLogic implements ReserveStore{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertReserve(ArrayList<Reserve> reserve) {
		return sqlSession.insert("reserveMapper.insertReserve",reserve);
	}

	@Override
	public Ticket bringTicket(HashMap<String, String> para) {
		return sqlSession.selectOne("reserveMapper.bringStudy", para);
	}

	@Override
	public ArrayList<Reserve> reserveList(HashMap<String, String> para) {
		return (ArrayList)sqlSession.selectList("reserveMapper.reserveList", para);
	}

	@Override
	public int ticketUpdate(Ticket ticket) {
		return sqlSession.update("reserveMapper.ticketUpdate", ticket);
	}

	@Override
	public int ticketEnd(Ticket ticket) {
		return sqlSession.update("reserveMapper.ticketEnd", ticket);
	}

	@Override
	public int bbqInsert(Reserve reserve) {
		return sqlSession.insert("reserveMapper.bbqInsert", reserve);
	}

}
