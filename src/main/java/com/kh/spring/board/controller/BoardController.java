package com.kh.spring.board.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.spring.board.common.Pagination;
import com.kh.spring.board.domain.Board;
import com.kh.spring.board.domain.BoardComment;
import com.kh.spring.board.domain.BoardLike;
import com.kh.spring.board.domain.BoardSearch;
import com.kh.spring.board.domain.PageInfo;
import com.kh.spring.board.service.BoardService;
import com.kh.spring.member.domain.Member;

@Controller
public class BoardController {
	
	
	@Autowired
	private BoardService bService;
	
	// 자유게시판
	@RequestMapping(value="boardList.do", method = RequestMethod.GET)
	public ModelAndView listBoard(ModelAndView mv, HttpServletResponse response) {
		
		ArrayList<Board> bList = bService.listBoard();
		
		if (!bList.isEmpty()) {
			mv.addObject("bList", bList);
			mv.setViewName("board/board");
		} else {
			try {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter writer;
				writer = response.getWriter();
				writer.println("<script>alert('자유게시판 조회에 실패하였습니다.'); location.href='home.do';</script>");
				writer.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return mv;
	}
	
	
	// 자유게시판 페이징 스크롤
	@RequestMapping(value="boardPaging.do", method=RequestMethod.POST)
	public void boardPaging (HttpServletRequest request, HttpServletResponse response, Integer start) throws Exception{
		
		int currentPage = (start != null) ? start : 1;
		int listCount = bService.getBoardListCount();
		
		// Pagination클래스는 common 패키지에 있음
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		
		ArrayList<Board> bList = bService.selectList(pi);
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(bList, response.getWriter());
	}
	
	
	// 게시판 게시글 등록화면
	@RequestMapping(value="boardWriteForm.do", method=RequestMethod.GET)
	public String insertBoardView() {
		
		return "board/boardWrite";
	}
	
	// 공지사항 등록화면
	@RequestMapping(value="noticeWriteForm.do", method=RequestMethod.GET)
	public String insertNoticeView() {
		
		return "board/noticeWrite";
	}
	
	
	
	// 게시물 등록
	@RequestMapping(value="boardWrite.do", method=RequestMethod.POST)
	public String insertBoard (Model model, Board board, HttpServletRequest request, 
								@RequestParam(name="bUploadFile", required=false) MultipartFile uploadFile, HttpServletResponse response) {
		
		if (!uploadFile.getOriginalFilename().equals("")) {
			String fileName = saveFile(uploadFile, request);
			
			if (fileName != null) {
				board.setbFileName(fileName);
			}
		}
		
		int result = bService.insertBoard(board);
		String path = null;
		
		if (result > 0) {
			path = "redirect:boardList.do";
		} else {
			try {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter writer;
				writer = response.getWriter();
				writer.println("<script>alert('게시물 등록에 실패하였습니다.'); location.href='boardWrite.do';</script>");
				writer.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		return path;
	}
	
	
	
	
	// 파일 저장
	public String saveFile(MultipartFile file, HttpServletRequest request) {
			
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root+"\\bUploadFiles";
			
		File folder = new File(savePath);
			
		if (!folder.exists()) {
			folder.mkdir();
		}
			
		// 게시판 같은 경우 많은 회원들이 동시에 올릴 수 있고, 같은 이름의 파일을 올릴수도 있기 때문에
		// 파일명을 rename하는 과정이 필요함. rename할땐 "년월일시분초.확장자"로 변경 필요
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originalFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
										+originalFileName.substring(originalFileName.lastIndexOf(".")+1);
			
			
		String filePath = folder+"\\"+renameFileName;
			
		try {
			file.transferTo(new File(filePath));
		} catch(Exception e) {
			e.printStackTrace();
		}
		return renameFileName;
	}
	
	
	
	
	// 게시글 수정화면
	@RequestMapping(value="boardUpdateView.do", method=RequestMethod.GET)
	public ModelAndView updateBoardView(ModelAndView mv, int bNo) {
		mv.addObject("board", bService.selectBoard(bNo));
		mv.setViewName("board/boardUpdate");	
		
		return mv;
	}

	// 공지사항 수정화면
		@RequestMapping(value="noticeUpdateView.do", method=RequestMethod.GET)
		public ModelAndView updateNoticeView(ModelAndView mv, int bNo) {
			mv.addObject("board", bService.selectBoard(bNo));
			mv.setViewName("board/noticeUpdate");	
			
			return mv;
		}
	
	
	// 게시물 수정
	@RequestMapping(value="boardUpdate.do",method=RequestMethod.POST)
	public ModelAndView updateBoard (ModelAndView mv, Board board, HttpServletRequest request, MultipartFile reloadFile, HttpServletResponse response) {
		
		// 새로 업로드된 파일이 있을 경우
		if (reloadFile != null && !reloadFile.isEmpty()) {
			
			// 기존 업로드된 파일 삭제
			if (board.getbFileName()!= null) {
				deleteFile(board.getbFileName(), request);
			}
			
			// 새로 업로드된 파일 저장
			String renameFileName = saveFile(reloadFile, request);
			if (renameFileName != null) {
				board.setbFileName(reloadFile.getOriginalFilename());
				board.setbFileName(renameFileName);
			}
		}
		
		int result = bService.updateBoard(board);
		
		if (result > 0) {
			mv.setViewName("redirect:boardList.do");
		} else {
			try {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter writer;
				writer = response.getWriter();
				writer.println("<script>alert('게시물 수정에 실패하였습니다.'); location.href='boardUpdateView.do';</script>");
				writer.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return mv;
	}
	
	
	
	
	// 파일 삭제 메소드
	public void deleteFile(String fileName, HttpServletRequest request) {
		// 파일 저장 경로 설정
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\buploadFiles";
		
		// 삭제할 파일 경로를 통한 파일 객체 생성
		File file = new File(savePath + "\\" + fileName);
		
		// 해당 파일이 존재할 경우 삭제
		if (file.exists()) {
			file.delete();
		}
	}
	
	
	
	// 게시물 삭제
	@RequestMapping(value="boardDelete.do", method=RequestMethod.GET)
	public String deleteBoard (int bNo, Model model, HttpServletRequest request, HttpServletResponse response) {
		
		int result = bService.deleteBoard(bNo);
		String path = null;
		
		if (result > 0) {
			path = "redirect:boardList.do";
		} else {
			try {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter writer;
				writer = response.getWriter();
				writer.println("<script>alert('게시글 삭제에 실패하였습니다.'); location.href='boardList.do';</script>");
				writer.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return path;
	}
	
	
	
	
	// 내가 쓴글
	@RequestMapping(value="myBoard.do", method = RequestMethod.GET)
	public ModelAndView myBoard(ModelAndView mv, Board board, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		
		String memberId = ((Member)session.getAttribute("loginMember")).getMemberId();
		board.setMemberId(memberId);
		
		ArrayList<Board> bList = bService.listMyBoard(board);
		
		if (!bList.isEmpty()) {
			mv.addObject("bList", bList);
			mv.setViewName("board/board");
		} else {
			try {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter writer;
				writer = response.getWriter();
				writer.println("<script>alert('작성한 게시글이 없습니다.'); location.href='boardList.do';</script>");
				writer.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return mv;
	}
	
	
	
	
	// 게시물 검색
	@RequestMapping(value="boardSearch.do", method=RequestMethod.GET)
	public ModelAndView searchBoard(ModelAndView mv, BoardSearch bSearch, HttpServletResponse response) {
		ArrayList<Board> searchBList = bService.searchBoardList(bSearch);
		
		if (!searchBList.isEmpty()) {
			mv.addObject("bList", searchBList);
			mv.setViewName("board/board");
		} else {
			try {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter writer;
				writer = response.getWriter();
				writer.println("<script>alert('검색 결과가 없습니다.'); location.href='boardList.do';</script>");
				writer.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return mv;
	}
	
	
	
	// 게시물 상세조회
	@RequestMapping(value="boardContent.do", method=RequestMethod.GET)
	public ModelAndView selectBoard(ModelAndView mv, HttpServletRequest request, int bNo, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		
		String memberId = ((Member)session.getAttribute("loginMember")).getMemberId();
		// 조회수 증가
		bService.addViewNo(bNo);
		
		Board board = bService.selectBoard(bNo);
		
		// 좋아요 여부 확인
		BoardLike bLike = new BoardLike();
		bLike.setbNo(bNo);
		bLike.setMemberId(memberId);
		bLike = bService.selectBoardLike(bLike);
		
		if (board != null) {
			mv.addObject("board", board);
			mv.addObject("bLike", bLike);
			mv.setViewName("board/boardContent");
		} else {
			try {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter writer;
				writer = response.getWriter();
				writer.println("<script>alert('게시물 조회에 실패하였습니다.'); location.href='boardList.do';</script>");
				writer.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return mv;
	}
	
	
	

	// 댓글 등록
	@ResponseBody
	@RequestMapping(value="insertComment.do", method=RequestMethod.POST)
	public String insertBoardComment(BoardComment bComment, HttpSession session) {
		Member loginMember = (Member)session.getAttribute("loginMember");
		String cWriter = loginMember.getMemberId();
		bComment.setMemberId(cWriter);
		
		int result = bService.insertBoardComment(bComment);
		
		if (result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	
	
	
	// 댓글 전체 조회
	@RequestMapping(value="commentList.do", method=RequestMethod.GET)
	public void getCommentList (HttpServletResponse response, int bNo) throws Exception {
		ArrayList<BoardComment> bcList = bService.listBoardComment(bNo);
		
		// 한글이 있으면 인코딩
		for (BoardComment bc : bcList) {
			bc.setBcContent(URLEncoder.encode(bc.getBcContent(), "UTF-8"));
		}
		
		// 날짜 출력 포맷 변환
		Gson gson = new GsonBuilder().setDateFormat("yyyyMMddHHmmss").create();
		gson.toJson(bcList, response.getWriter());
		
	}
	
	
	
	
	// 댓글 삭제
	@RequestMapping(value="commentDelete.do", method=RequestMethod.GET)
	public String deleteBoardComment (Model model,HttpServletRequest request, HttpServletResponse response, BoardComment bComment) {
		HttpSession session = request.getSession();
		
		Member loginMember = (Member)session.getAttribute("loginMember");
		String cWriter = loginMember.getMemberId();
		String bNoTransfer = request.getParameter("bNo");
		int bNo = Integer.parseInt(bNoTransfer);
		String bcNoTransfer = request.getParameter("bcNo"); 
		int bcNo = Integer.parseInt(bcNoTransfer);

		
		bComment.setMemberId(cWriter);
		bComment.setbNo(bNo);
		bComment.setBcNo(bcNo);
		
		int result = bService.deleteBoardComment(bComment);
		String path = null;
		
		if (result > 0) {
			path = "redirect:boardContent.do?bNo="+bNo;
		} else {
			try {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter writer;
				writer = response.getWriter();
				writer.println("<script>alert('댓글 삭제에 실패하였습니다.'); location.href='boardWrite.do';</script>");
				writer.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return path;
	}
	
	
	
	
	// 좋아요
	@ResponseBody
	@RequestMapping(value="addbLike.do", method=RequestMethod.POST)
	public Object addLike (Model model, BoardLike bLike, HttpServletRequest request, int bNo, String memberId) throws Exception {
		
		// bNo와 memberId로 BOARDLIKE 테이블에서 찾아옴
		BoardLike bLikeYn = bService.selectBoardLike(bLike);
		
		if (bLikeYn == null) {
			int result = bService.addLike(bLike);
			
		} else {
			// BOARDLIKE 테이블에서 찾아와서 check 여부 확인
			if (bLikeYn.getlCheckYn().equals("Y")) {
				int likeNcheck = bService.updateNLike(bLikeYn);
			} else if (bLikeYn.getlCheckYn().equals("N")) {
				int likeYcheck = bService.updateYLike(bLikeYn);
			}			
		}
		
		HashMap<String, String> paramMap = new HashMap<String, String>();
		bLikeYn = bService.selectBoardLike(bLike);
		Board board = bService.selectBoard(bNo);
		String bLikeNo = Integer.toString(board.getbLike());
			
		paramMap.put("likeYn", bLikeYn.getlCheckYn());
		paramMap.put("likeCount", bLikeNo);
		return paramMap;
		
	}
	
	
}
