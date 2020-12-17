package com.kh.spring.reserve.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.reserve.domain.Reserve;
import com.kh.spring.reserve.domain.Ticket;
import com.kh.spring.reserve.store.ReserveStore;
@Service
public class ReserveServiceImpl implements ReserveService {
	
	@Autowired
	private ReserveStore rStore;

	@Override
	public int insertReserve(ArrayList<Reserve> reserve) {
		return rStore.insertReserve(reserve);
	}

	@Override
	public Ticket bringTicket(HashMap<String, String> para) {
		return rStore.bringTicket(para);
	}

	@Override
	public ArrayList<Reserve> reserveList(HashMap<String, String> para) {
		return rStore.reserveList(para);
	}

	@Override
	public int ticketUpdate(Ticket ticket) {
		return rStore.ticketUpdate(ticket);
	}

	@Override
	public int ticketEnd(Ticket ticket) {
		return rStore.ticketEnd(ticket);
	}

	@Override
	public int bbqInsert(Reserve reserve) {
		return rStore.bbqInsert(reserve);
	}

}
