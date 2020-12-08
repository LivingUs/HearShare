package com.kh.spring.board.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BoardController {

	@RequestMapping(value="board.do", method = RequestMethod.GET)
	public String board(Locale locale, Model model) {
		
		return "/board/board";
	}
	
	@RequestMapping(value="boardWrite.do", method = RequestMethod.GET)
	public String boardWriteView(Locale locale, Model model) {
		
		return "/board/boardWrite";
	}
	
}
