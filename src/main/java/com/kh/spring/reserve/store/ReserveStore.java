package com.kh.spring.reserve.store;

import java.util.ArrayList;

import com.kh.spring.reserve.domain.Reserve;

public interface ReserveStore {
	
	public int insertReserve(ArrayList<Reserve> reserve);

}
