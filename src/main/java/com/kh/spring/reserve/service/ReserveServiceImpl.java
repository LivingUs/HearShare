package com.kh.spring.reserve.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.reserve.domain.Reserve;
import com.kh.spring.reserve.store.ReserveStore;
@Service
public class ReserveServiceImpl implements ReserveService {
	
	@Autowired
	private ReserveStore rStore;

	@Override
	public int insertReserve(ArrayList<Reserve> reserve) {
		return rStore.insertReserve(reserve);
	}

}
