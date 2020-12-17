package com.kh.spring.common;

import com.kh.spring.other.domain.PageInfo;

public class Pagination {

	//PageInfo 객체를 리턴해주는 메소드를 추가
	//PageInfo라는 클래스는 페이징 처리에 필요한 데이터를 담는 클래스
	//클래스가 계속 생성이 되면 정보들이 초기화되기 때문에
	//한번만 생성하여 정보를 저장할 수 있도록 해야 함
	//그래서 그냥 메소드가 아닌 static 메소드로 만들어 줌
	
	public static PageInfo getPageInfo(int currentPage, int listCount) {
		//즉 Paginataion 클래스에서 만드는 페이징 처리에 대한 정보를
		//PageInfo 클래스가 저장을 하는 것
		PageInfo pi = null;
		
		int pageLimit = 10; //한 페이지에서 보여줄 네비게이션 수,
							//이전 1 ~ 10 다음
		int maxPage;		//전체 페이지 중 가장 마지막 페이지
		int startPage;		//현재 페이지에서 시작하는 첫번째 페이지
		int endPage;		//현재 페이지에서 끝나는 마지막 페이지
		int boardLimit = 4;	//한 페이지에 보여줄 게시글 갯수, 내가 지정
		
		//전체 게시글 갯수 123, 한 페이지당 5개씩
		//총 페이지는 25페이지
		//0.1일 때 int로 형변환하면 나머지 게시글이 짤리기 때문에
		//0.9를 더해서 더 크게 만들어줌
		maxPage = (int)((double)listCount/boardLimit + 0.9);

		//현재 페이지에서 시작하는 첫번째 페이지 값
		startPage = (((int)((double)currentPage / pageLimit + 0.9))-1) * pageLimit + 1;

		//현재 페이지에서 끝나는 마지막 페이지 값
		endPage = startPage + pageLimit - 1;
		
		//오류방지용
		if(maxPage < endPage) {
			endPage = maxPage;
		}

		//PageInfo객체(매개변수 생성자)와 똑같은 순서로
		pi = new PageInfo(currentPage, boardLimit, pageLimit, startPage, endPage, listCount, maxPage);
		
		return pi;

	}
	
	
	
}
