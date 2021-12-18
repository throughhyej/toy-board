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
	private int displayPageNum = 10; // ȭ�鿡 �������� ������ ��ȣ�� ����.

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
		calcData(); // �� ���ο� ������ displayPAgeNum ��� (1-10, 11-20, 21-30)
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
	
	// �� ���ο� ������ displayPAgeNum ��� (1-10, 11-20, 21-30)
	private void calcData() {
		// ������ ��������ȣ = ����������/������ ��������*������ �������� = ������ �������� 10��° ��ȣ
		endPage = (int) (Math.ceil(pagingBase.getPage() / (double) displayPageNum) * displayPageNum);
		startPage = (endPage - displayPageNum) + 1;
		
		// endPage�� 10 ������ �ƴ� ��
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
