package com.spring.AtoZ.common.dto;


public class PageMaker {
	private int totalCount;  //전체 행의 개수 => 마지막페이지의 개수를 알기위해
	private int startPage = 1;  //시작 페이지 번호
	private int endPage = 1;  //마지막 페이지 번호
	private int realEndPage;  //끝 페이지 번호
	private boolean prev;  //이전페이지 버튼 유무
	private boolean next;  //다음페이지 버튼 유무
	
	private int displayPageNum = 10;  //한 페이지에 보여줄 페이지번호 개수
	
	private SearchMap searchMap;  //현재 페이지 정보
	
	//startPage, endPage, prev, next 설정. by totalCount
	private void calcData() {
		endPage = (int) (Math.ceil(searchMap.getPage() / (double) displayPageNum) * displayPageNum);
		startPage = (endPage - displayPageNum) + 1;
		
		realEndPage = (int) (Math.ceil(totalCount / (double) searchMap.getPerPage()));
		
		if(startPage < 0) {
			startPage = 1;
		}
		if(endPage > realEndPage) {
			endPage = realEndPage;
		}
		
		prev = startPage == 1 ? false : true;
		next = endPage * searchMap.getPerPage() >= totalCount ? false : true;
	}
	
	//getter,setter
		public int getTotalCount() {
			return totalCount;
		}

		public void setTotalCount(int totalCount) {
			this.totalCount = totalCount;
			calcData();  //totalCount를 set메서드에 넣어줄 때 setting됨
		}

		public int getStartPage() {
			return startPage;
		}

		public void setStartPage(int startPage) {
			this.startPage = startPage;
		}

		public int getEndPage() {
			return endPage;
		}

		public void setEndPage(int endPage) {
			this.endPage = endPage;
		}

		public int getRealEndPage() {
			return realEndPage;
		}

		public void setRealEndPage(int realEndPage) {
			this.realEndPage = realEndPage;
		}

		public boolean isPrev() {
			return prev;
		}

		public void setPrev(boolean prev) {
			this.prev = prev;
		}

		public boolean isNext() {
			return next;
		}

		public void setNext(boolean next) {
			this.next = next;
		}

		public int getDisplayPageNum() {
			return displayPageNum;
		}

		public void setDisplayPageNum(int displayPageNum) {
			this.displayPageNum = displayPageNum;
		}

		public SearchMap getSearchMap() {
			return searchMap;
		}

		public void setCri(SearchMap searchMap) {
			this.searchMap = searchMap;
		}
}
