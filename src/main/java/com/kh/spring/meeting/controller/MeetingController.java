package com.kh.spring.meeting.controller;

import java.io.File;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.spring.meeting.domain.Mcomment;
import com.kh.spring.meeting.domain.Meeting;
import com.kh.spring.meeting.domain.MeetingDetail;
import com.kh.spring.meeting.service.MeetingService;
import com.kh.spring.member.domain.Member;
import com.kh.spring.place.domain.Mreview;
import com.kh.spring.place.domain.Place;

@Controller
public class MeetingController {
	
	@Autowired
	private MeetingService mService;
	
	// 모임하기 등록 화면
	@RequestMapping(value="meetingWriteView.do", method = RequestMethod.GET)
	public String meetingWriteView() {
		return "meeting/meetingwrite";
	}
	
	// 모임하기 글 등록
	@RequestMapping(value="meetingWrite.do", method=RequestMethod.POST)
	public String meetingWrite(Meeting meeting, MeetingDetail meetingdetail, @RequestParam(value="pNo", required=false) Integer pNo, Model model, MultipartFile uploadFile, HttpServletRequest request, HttpSession session) throws Exception {
		
		if(!uploadFile.getOriginalFilename().equals("")) {
			String mrenameFileName = saveFile(uploadFile, request);
			if (mrenameFileName != null) {
				meeting.setMoriginalFileName(uploadFile.getOriginalFilename());
				meeting.setMrenameFileName(mrenameFileName);
			}
		}
		if(pNo != null) {
			String memberId = ((Member)session.getAttribute("loginMember")).getMemberId();
			meeting.setMemberId(memberId);
			
			int result = 0;
			String path = null;
			result = mService.meetingWrite(meeting);
			Place place = mService.selectPlace(pNo);
			
			if ( result > 0 ) {
				model.addAttribute("place", place);
				path = "redirect:meeting.do";
			} else {
				model.addAttribute("msg", "오류가 발생했어요 ㅠ.ㅠ");
				path = "common/errorPage";
			}
			return path;
		} else {
			String memberId = ((Member)session.getAttribute("loginMember")).getMemberId();
			meeting.setMemberId(memberId);
			
			int result = 0;
			String path = null;
			result = mService.meetingWrite(meeting);
			
			if ( result > 0 ) {
				path = "redirect:meeting.do";
			} else {
				model.addAttribute("msg", "오류가 발생했어요 ㅠ.ㅠ");
				path = "common/errorPage";
			}
			return path;
		}
	}
	
	// 파일 저장
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\meetingFiles";
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdir();
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String moriginalFileName = file.getOriginalFilename();
		String mrenameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "." + moriginalFileName.substring(moriginalFileName.lastIndexOf(".")+1);
		
		String filePath = folder + "\\" + file.getOriginalFilename();
		try {
			file.transferTo(new File(filePath));
		} catch(Exception e) {
			e.printStackTrace();
		}
		return mrenameFileName;
	}
	
	// 파일 삭제
	public void deleteFile(String fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\meetingFiles";
		File file = new File(savePath + "\\" + fileName);
		if (file.exists()) {
			file.delete();
		}
	}
		
	// 모임 게시판 전체 조회
	@RequestMapping(value="meeting.do", method=RequestMethod.GET)
	public ModelAndView meetingList(ModelAndView mv) {
		ArrayList<Meeting> mList = mService.meetingList();
		if(!mList.isEmpty()) {
			mv.addObject("mList", mList);
			mv.setViewName("meeting/meeting");
		} else {
			mv.addObject("msg", "오류가 발생했어요 ㅠ.ㅠ");
			mv.setViewName("common/error");
		}
		return mv;
	}
	
	// 모임 상세 페이지
	@RequestMapping(value="meetingdetail.do", method = RequestMethod.GET)
	public String meetingdetail(int mNo, Integer pNo, Model model, HttpSession session  ) {
		Meeting meeting = mService.meetingdetail(mNo);
		/* Place place = mService.selectPlace(pNo); */
		Member loginMember = (Member)session.getAttribute("loginMember"); 
		if ( meeting != null ) {
			model.addAttribute("meeting", meeting);
			model.addAttribute("loginMember", loginMember);
			return "meeting/meetingdetail";
			/*
			 * } else if ( meeting != null && pNo != 0 ) { model.addAttribute("meeting",
			 * meeting); model.addAttribute("place", place);
			 * model.addAttribute("loginMember", loginMember); return
			 * "meeting/meetingdetail";
			 */
		} else {
			model.addAttribute("msg", "오류가 발생했어요 ㅠ.ㅠ");
			return "common/errorPage";
		}
	}
	
	@RequestMapping(value="meetingmodify.do", method = RequestMethod.GET)
	public String meetingmodify() {
		
		return "meeting/meetingmodify";
	}
	
	// 모임 게시글 삭제
	@RequestMapping(value="meetingDelete.do", method=RequestMethod.GET)
	public String meetingDelete(int mNo, Model model, HttpServletRequest request) {
		// DB 데이터 삭제
		Meeting meeting = mService.meetingdetail(mNo);
		
		if (meeting.getMoriginalFileName() != null) {
			deleteFile(meeting.getMrenameFileName(), request);
		}
		// DB에서 데이터 삭제
		int result = mService.meetingDelete(mNo);
		if (result > 0) {
			return "redirect:meeting.do";
		} else {
			model.addAttribute("msg", "오류가 발생했어요 ㅠ.ㅠ");
			return "common/errorPage";
		}
	}
	
	// 댓글 등록
	@ResponseBody
	@RequestMapping(value="addComment.do", method=RequestMethod.POST)
	public String addComment(Mcomment comment, HttpSession session) {
		Member loginMember = (Member)session.getAttribute("loginMember");
		String memberId = loginMember.getMemberId();
		comment.setMemberId(memberId);
		int result = mService.addComment(comment);
		if (result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	// 댓글리스트
	@RequestMapping(value="commentList.do", method=RequestMethod.GET)
	public void getCommentList(HttpServletResponse response, int mNo) throws Exception{
		ArrayList<Mcomment> mList = mService.commentList(mNo);
		for ( Mcomment m : mList ) {
			m.setMcContent(URLEncoder.encode(m.getMcContent(), "utf-8"));
		}
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(mList, response.getWriter());
	}
	
	// 댓글삭제
	@ResponseBody
	@RequestMapping(value="CommentDelete.do", method=RequestMethod.GET)
	public String CommentDelete(int mcNo , HttpServletRequest request, Model model) {
		int result = mService.CommentDelete(mcNo);
		if (result > 0) {
			return "success";
		} else {
			model.addAttribute("msg", "오류가 발생했어요 ㅠ.ㅠ");
			return "common/errorPage";
		}
	}
	
}
