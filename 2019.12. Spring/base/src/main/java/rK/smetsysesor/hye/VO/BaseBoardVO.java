package rK.smetsysesor.hye.VO;

import java.util.Date;

public class BaseBoardVO {
	private int idx; // -- IDX
	private int num; // -- 재정렬 위한 컬럼
	private String title; // -- TITLE
	private String content; // -- CONTENT
	private String writer; // -- WRTIER
	private Date regDate; // -- REG_DATE
	private Date modDate; // -- MOD_DATE
	private int view; // -- VIEWCOUNT(조회수)
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public Date getModDate() {
		return modDate;
	}
	public void setModDate(Date modDate) {
		this.modDate = modDate;
	}
	public int getView() {
		return view;
	}
	public void setView(int view) {
		this.view = view;
	}
}
