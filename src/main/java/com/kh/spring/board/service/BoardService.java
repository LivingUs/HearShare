package com.kh.spring.board.service;

import java.util.ArrayList;

import com.kh.spring.board.domain.Board;
import com.kh.spring.board.domain.BoardComment;
import com.kh.spring.board.domain.BoardLike;
import com.kh.spring.board.domain.BoardSearch;
import com.kh.spring.board.domain.PageInfo;

public interface BoardService {
	
	public int insertBoard(Board board);
	public int updateBoard(Board board);
	public int deleteBoard(int bNo);
	public Board selectBoard(int bNo);
	public ArrayList<Board> searchBoardList(BoardSearch bSearch);
	public int addViewNo(int bNo);
	public int getBoardListCount();
	public ArrayList<Board> listBoard();
	public ArrayList<Board> listMyBoard(Board board);
	public ArrayList<Board> selectList(PageInfo pi);
	public int insertBoardComment(BoardComment bComment);
	public int deleteBoardComment(BoardComment bComment);
	public ArrayList<BoardComment> listBoardComment(int bNo);
	public int addLike(BoardLike bLike);
	public int updateYLike(BoardLike bLike);
	public int updateNLike(BoardLike bLike);
	public BoardLike selectBoardLike(BoardLike bLike);
	
}
