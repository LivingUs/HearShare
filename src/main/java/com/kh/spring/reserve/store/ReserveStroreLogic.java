package com.kh.spring.reserve.store;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.reserve.domain.Reserve;
@Repository
public class ReserveStroreLogic implements ReserveStore{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int insertReserve(ArrayList<Reserve> reserve) {
		return sqlSession.insert("reserveMapper.insertReserve",reserve);
	}

}
