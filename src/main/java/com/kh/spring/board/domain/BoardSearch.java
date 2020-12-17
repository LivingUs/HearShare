package com.kh.spring.board.domain;

public class BoardSearch {
	private String searchValue;
	private String searchContent;
	
	public BoardSearch() {
		
	}

	public BoardSearch(String searchValue, String searchContent) {
		super();
		this.searchValue = searchValue;
		this.searchContent = searchContent;
	}

	public String getSearchValue() {
		return searchValue;
	}

	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}

	public String getSearchContent() {
		return searchContent;
	}

	public void setSearchContent(String searchContent) {
		this.searchContent = searchContent;
	}

	@Override
	public String toString() {
		return "BoardSearch [searchValue=" + searchValue + ", searchContent=" + searchContent + "]";
	}
	
}
