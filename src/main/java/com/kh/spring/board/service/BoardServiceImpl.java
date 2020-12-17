package com.kh.spring.board.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.board.domain.Board;
import com.kh.spring.board.domain.BoardComment;
import com.kh.spring.board.domain.BoardLike;
import com.kh.spring.board.domain.BoardSearch;
import com.kh.spring.board.domain.PageInfo;
import com.kh.spring.board.store.BoardStore;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardStore bStore;
	
	@Override
	public int insertBoard(Board board) {
		return bStore.insertBoard(board);
	}

	@Override
	public int updateBoard(Board board) {
		return bStore.updateBoard(board);
	}
	
	@Override
	public Board selectBoard(int bNo) {
		return bStore.selectBoard(bNo);
	}

	@Override
	public int deleteBoard(int bNo) {
		return bStore.deleteBoard(bNo);
	}

	@Override
	public ArrayList<Board> searchBoardList(BoardSearch bSearch) {
		return bStore.searchBoardList(bSearch);
	}
	
	@Override
	public int addViewNo(int bNo) {
		return bStore.addViewNo(bNo);
	}
	
	@Override
	public int getBoardListCount() {
		return bStore.getBoardListCount();
	}

	@Override
	public ArrayList<Board> listBoard() {
		return bStore.listBoard();
	}
	
	@Override
	public ArrayList<Board> listMyBoard(Board board) {
		return bStore.listMyBoard(board);
	}
	
	@Override
	public ArrayList<Board> selectList(PageInfo pi) {
		return bStore.selectList(pi);
	}	

	@Override
	public int insertBoardComment(BoardComment bComment) {
		return bStore.insertBoardComment(bComment);
	}

	@Override
	public int updateBoardComment(BoardComment bComment) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteBoardComment(BoardComment bComment) {
		return bStore.deleteBoardComment(bComment);
	}

	@Override
	public ArrayList<BoardComment> listBoardComment(int bNo) {
		return bStore.listBoardComment(bNo);
	}

	@Override
	public int addLike(BoardLike bLike) {
		return bStore.addLike(bLike);
	}

	@Override
	public int updateYLike(BoardLike bLike) {
		return bStore.updateYLike(bLike);
	}
	
	@Override
	public int updateNLike(BoardLike bLike) {
		return bStore.updateNLike(bLike);
	}

	@Override
	public BoardLike selectBoardLike(BoardLike bLike) {
		return bStore.selectBoardLike(bLike);
	}
	
	
}
