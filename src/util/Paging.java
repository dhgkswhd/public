package util;

public class Paging {
	private int pageSize;   // 한 화면에 보여질 항목 개수 (우리가 설정할 값)
	private int totalCount; // DB에서 조회 (미리 조회해서 넘길 예정)
	private int totalPage;  // 전체 페이지 개수 (전체 항목 개수와 한 화면에 보여질 항목 수에 따라 결정됨)
	private int currentPage;// 현재 페이지 번호 (사용자의 요청(클릭) or 파라미터 page에 따라)
	private int startNo;	// 현재 페이지의 항목 '시작번호' -- > 쿼리문에 들어갈 값 (시작이 1이면)
	private int endNo;		// 현재 페이지의 항목 '끝 번호'	--> 쿼리문에 들어갈 값 (끝은 10)
	private int startPage;	// 페이지 목록 중, 시작 페이지 번호 (페이지가1000개면 다 보여주진 않을것)
	private int endPage;	// 페이지 목록 중, 마지막 페이지 번호
	
	public Paging() {}
	
	// 페이지 객체를 완성하기 위해 필요한 값들을 전달받는다 (3개 항목은 나한테 전달 받아야 나머지를 계산할수가있음)
	public Paging( int pageSize, int totalCount, int currentPage ) {
		// 10, 6, 1
		this.pageSize = pageSize;
		this.totalCount = totalCount;
		this.currentPage = currentPage;
		calc();
	}
	
	// 나머지 멤버의 값들을 전달된 3개의 값을 이용하여 계산하는 메서드
	private void calc() {
		// 전체 항목 40, 한 화면에 10개면 ---> 전체 페이지는 4
		// 전체 항목 41, 한 화면에 10개면 ---> 전체 페이지는 5
		totalPage = (totalCount - 1) / pageSize + 1;
		
		// 만약에 요청 페이지가 전체 페이지 수 보다 크면, 마지막 페이지로 설정한다 (잘못된 요청)
		if ( currentPage > totalPage ) {
			currentPage = totalPage;
		}
		
		// currentPage가 2, 항목 수가 10개라면 -_> 11
		startNo = (currentPage - 1) * pageSize + 1;
		
		// startNo가 11, 항목 수가 10이라면 --> 20
		endNo = startNo + pageSize - 1; 
		
		// 2페이지에서는 11~20 순서의 10개 항목을 보여주고싶다
		
		// 마지막 페이지에선 endNo이 전체 개수보다 클 수도 있다.
		// 게시물이 13개있는데 2페이지요청후 11~20이 되야하는데.. 14~20은 없으므로 13으로 변경
		if ( endNo > totalCount ) {
			endNo = totalCount;
		}
		
		// 페이지 목록의 처음 페이지 번호 계산
		// 현재 페이지가 2 --> 1
		// 현재 페이지가 5 --> 1
		// 현재 페이지가 12 --> 11
		
		startPage = (currentPage - 1) / 10*10 + 1;
		endPage = startPage + 9;
		// 시작과 끝 페이지를 1~10, 11~20, 21~30 형태로 맞추기
		
		// 마지막 페이지 번호가 전체 페이지 수보다 클수도 있다.
		if ( endPage > totalPage ) {
			endPage = totalPage;
		}
	} // calc() 끝
	
	// getter, setter

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getStartNo() {
		return startNo;
	}

	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}

	public int getEndNo() {
		return endNo;
	}

	public void setEndNo(int endNo) {
		this.endNo = endNo;
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
	
}























