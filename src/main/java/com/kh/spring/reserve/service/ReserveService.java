package com.kh.spring.reserve.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.spring.reserve.domain.Reserve;
import com.kh.spring.reserve.domain.Ticket;

public interface ReserveService {
	
	//예약 인서트
	public int insertReserve(ArrayList<Reserve> reserve);
	//정기권 select
	public Ticket bringTicket(HashMap<String, String> para);
	//예약 리스트 select
	public ArrayList<Reserve> reserveList(HashMap<String, String> para);
	//티켓 업데이트
	public int ticketUpdate(Ticket ticket);
	//티켓 사용불가
	public int ticketEnd(Ticket ticket);
	//바베큐장 인서트
	public int bbqInsert(Reserve reserve);
	//바베큐장 리스트
	public ArrayList<Reserve> bbqList();
}
