package com.kh.spring.place.controller;

import java.net.URLEncoder;
import java.util.ArrayList;

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
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.spring.member.domain.Member;
import com.kh.spring.place.domain.Mreview;
import com.kh.spring.place.domain.Place;
import com.kh.spring.place.service.PlaceService;

@Controller
public class PlaceController {
	
	@Autowired
	private PlaceService pService;

	@RequestMapping(value="like.do", method = RequestMethod.GET)
	public String like() {
		
		return "place/like";
	}
	
	// 장소 게시판 전체 조회
	@RequestMapping(value="place.do", method = RequestMethod.GET)
	public ModelAndView placeList(ModelAndView mv) {
		ArrayList<Place> pList = pService.placeList();
		if(!pList.isEmpty()) {
			mv.addObject("pList", pList);
			mv.setViewName("place/place");
		} else {
			mv.addObject("msg", "오류가 발생했어요 ㅠ.ㅠ");
			mv.setViewName("common/error");
		}
		return mv;
	}
	
	// 모임하기 등록 화면(장소)
	@RequestMapping(value="meetingWritePlaceView.do", method = RequestMethod.GET)
	public String meetingWritePlaceView(int pNo, Model model) {
		Place place = pService.placedetail(pNo);
		if ( place != null ) {
			model.addAttribute("place", place);
			return "meeting/meetingwriteplace";
		} else {
			model.addAttribute("msg", "오류가 발생했어요 ㅠ.ㅠ");
			return "common/errorPage";
		}
	}
	
	// 장소 상세 페이지
	@RequestMapping(value="placedetail.do", method = RequestMethod.GET)
	public String placedetail(int pNo, Model model, HttpServletRequest request) {
		Place place = pService.placedetail(pNo);
		if ( place != null ) {
			model.addAttribute("place", place);
			return "place/placedetail";
		} else {
			model.addAttribute("msg", "오류가 발생했어요 ㅠ.ㅠ");
			return "common/errorPage";
		}
	}
	
	// 장소 먹거리 TOP5
	@RequestMapping(value="placeeattop5.do", method = RequestMethod.GET)
	public ModelAndView placeeattop5(ModelAndView mv) {
		ArrayList<Place> pList = pService.placeeattop5();
		if(!pList.isEmpty()) {
			mv.addObject("pList", pList);
			mv.setViewName("place/placeeattop5");
		} else {
			mv.addObject("msg", "오류가 발생했어요 ㅠ.ㅠ");
			mv.setViewName("common/error");
		}
		return mv;
	}
	
	// 장소 놀거리 TOP5
	@RequestMapping(value="placeplaytop5.do", method = RequestMethod.GET)
	public ModelAndView placeplaytop5(ModelAndView mv) {
		ArrayList<Place> pList = pService.placeplaytop5();
		if(!pList.isEmpty()) {
			mv.addObject("pList", pList);
			mv.setViewName("place/placeplaytop5");
		} else {
			mv.addObject("msg", "오류가 발생했어요 ㅠ.ㅠ");
			mv.setViewName("common/error");
		}
		return mv;
	}
	
	// 리뷰 등록
	@ResponseBody
	@RequestMapping(value="addReview.do", method=RequestMethod.POST)
	public String addReview(Mreview review, HttpSession session) {
		Member loginMember = (Member)session.getAttribute("loginMember");
		String memberId = loginMember.getMemberId();
		review.setMemberId(memberId);
		int result = pService.addReview(review);
		if (result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	// 리뷰리스트
	@RequestMapping(value="reviewList.do", method=RequestMethod.GET)
	public void getReviewList(HttpServletResponse response, int pNo) throws Exception{
		ArrayList<Mreview> pList = pService.reviewList(pNo);
		for ( Mreview p : pList ) {
			p.setMrContent(URLEncoder.encode(p.getMrContent(), "utf-8"));
		}
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(pList, response.getWriter());
	}
	
	// 리뷰삭제
	@ResponseBody
	@RequestMapping(value="ReviewDelete.do", method=RequestMethod.GET)
	public String ReviewDelete(int mrNo , HttpServletRequest request, Model model) {
		int result = pService.ReviewDelete(mrNo);
		if (result > 0) {
			return "success";
		} else {
			model.addAttribute("msg", "오류가 발생했어요 ㅠ.ㅠ");
			return "common/errorPage";
		}
	}
}
