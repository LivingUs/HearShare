package com.kh.spring.reserve.store;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.spring.reserve.domain.Reserve;
import com.kh.spring.reserve.domain.Ticket;

public interface ReserveStore {
	
	public int insertReserve(ArrayList<Reserve> reserve);
	public Ticket bringTicket(HashMap<String, String> para);
	public ArrayList<Reserve> reserveList(HashMap<String, String> para);
	public int ticketUpdate(Ticket ticket);
	public int ticketEnd(Ticket ticket);
	public int bbqInsert(Reserve reserve);
	public ArrayList<Reserve> bbqList();
}
