package rK.smetsysesor.hye.VO;

public class PagingBase {
	private int page; // 페이지번호
	private int perPageNum; // 페이지당 보여지는 게시물 수
	private int pageStart; // 시작할 NUM 번호 1, 11, 21

	public PagingBase() {
		this.page = 1;
		this.perPageNum = 10;
	}

	public int getPage() {
		return page;
	}	
	public void setPage(int page) {
		if (page <= 0) {
			this.page = 1;
			return;
		}
		this.page = page;
	}

	public int getPageStart() {
		//...시작데이터번호 = (페이지번호 - 1)*페이지당 보여지는 개수.
		pageStart = (this.page - 1) * perPageNum;
		return pageStart;
	}
	public void setPageStart(int pageStart) {
		this.pageStart = pageStart;
	}	

	public int getPerPageNum() {
		return this.perPageNum;
	}	
	public void setPerPageNum(int perPageNum) {

		if (perPageNum <= 0 || perPageNum > 100) {
			this.perPageNum = 10;
			return;
		}

		this.perPageNum = perPageNum;
	}

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + ", pageStart=" + pageStart + "]";
	}

	
}
