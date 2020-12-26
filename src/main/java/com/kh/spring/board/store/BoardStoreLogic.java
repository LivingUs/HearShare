package com.kh.spring.board.store;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.board.domain.Board;
import com.kh.spring.board.domain.BoardComment;
import com.kh.spring.board.domain.BoardLike;
import com.kh.spring.board.domain.BoardSearch;
import com.kh.spring.board.domain.PageInfo;

@Repository
public class BoardStoreLogic implements BoardStore {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertBoard(Board board) {
		return sqlSession.insert("BoardMapper.insertBoard", board);
	}

	@Override
	public int updateBoard(Board board) {
		return sqlSession.update("BoardMapper.updateBoard", board);
	}

	@Override
	public int deleteBoard(int bNo) {
		return sqlSession.delete("BoardMapper.deleteBoard", bNo);
	}
	
	@Override
	public Board selectBoard(int bNo) {
		return sqlSession.selectOne("BoardMapper.selectBoard", bNo);
	}

	@Override
	public ArrayList<Board> searchBoardList(BoardSearch bSearch) {
		return (ArrayList)sqlSession.selectList("BoardMapper.searchBoard", bSearch);
	}
	
	@Override
	public int addViewNo(int bNo) {
		return sqlSession.update("BoardMapper.addViewNo", bNo);
	}
	
	@Override
	public int getBoardListCount() {
		return sqlSession.selectOne("BoardMapper.boardListCount");
	}

	@Override
	public ArrayList<Board> listBoard() {
		return (ArrayList)sqlSession.selectList("BoardMapper.boardList");
	}
	
	@Override
	public ArrayList<Board> listMyBoard(Board board) {
		return (ArrayList)sqlSession.selectList("BoardMapper.boardMyList", board);
	}
	
	@Override
	public ArrayList<Board> selectList(PageInfo pi) {
		
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("BoardMapper.boardPagingList", null, rowBounds);
	}	
	

	@Override
	public int insertBoardComment(BoardComment bComment) {
		return sqlSession.insert("BoardMapper.insertComment", bComment);
	}

	@Override
	public int deleteBoardComment(BoardComment bComment) {
		return sqlSession.delete("BoardMapper.deleteComment", bComment);
	}

	@Override
	public ArrayList<BoardComment> listBoardComment(int bNo) {
		return (ArrayList)sqlSession.selectList("BoardMapper.commentList", bNo);
	}

	@Override
	public int addLike(BoardLike bLike) {
		return sqlSession.insert("BoardMapper.addLike", bLike);
	}

	@Override
	public int updateYLike(BoardLike bLike) {
		return sqlSession.update("BoardMapper.updateY", bLike);
	}
	
	@Override
	public int updateNLike(BoardLike bLike) {
		return sqlSession.update("BoardMapper.updateN", bLike);
	}

	@Override
	public BoardLike selectBoardLike(BoardLike bLike) {
		return sqlSession.selectOne("BoardMapper.selectBoardLike", bLike);
	}

}
