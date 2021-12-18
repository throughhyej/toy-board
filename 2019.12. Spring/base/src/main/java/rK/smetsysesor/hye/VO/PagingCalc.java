package rK.smetsysesor.hye.VO;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PagingCalc {
	private PagingBase pagingBase;
	private int totalCount;
	private int startPage;
	private int endPage;
	private boolean prev;	
	private boolean next;
	private int displayPageNum = 10; // 화면에 보여지는 페이지 번호의 숫자.

	public PagingBase getPagingBase() {
		return pagingBase;
	}
	public void setPagingBase(PagingBase pagingBase) {
		this.pagingBase = pagingBase;
	}

	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData(); // 한 라인에 보여줄 displayPAgeNum 계산 (1-10, 11-20, 21-30)
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
	
	public boolean isPrev() {
		return prev;
	}

	public boolean isNext() {
		return next;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}
	
	// 한 라인에 보여줄 displayPAgeNum 계산 (1-10, 11-20, 21-30)
	private void calcData() {
		// 마지막 페이지번호 = 현재페이지/보여줄 페이지수*보여줄 페이지수 = 페이지 나열자의 10번째 번호
		endPage = (int) (Math.ceil(pagingBase.getPage() / (double) displayPageNum) * displayPageNum);
		startPage = (endPage - displayPageNum) + 1;
		
		// endPage가 10 단위가 아닐 때
		int tempEndPage = (int) (Math.ceil(totalCount / (double) pagingBase.getPerPageNum()));
		
		if (endPage > tempEndPage) {
			endPage = tempEndPage;
		}

		prev = ( startPage == 1 ) ? false : true;
		next = ( endPage * pagingBase.getPerPageNum() >= totalCount ) ? false : true;
	}
	
	public String makeQuery(int page) {

	    UriComponents uriComponents 
	    	= UriComponentsBuilder.newInstance()
	    						  .queryParam("page", page)
	    						  .queryParam("perPageNum", pagingBase.getPerPageNum())
	    						  .build();
	    String strTemp = uriComponents.toUriString();
	    return uriComponents.toUriString();
	}
}
