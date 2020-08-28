package uni.pro.model;

import java.sql.Date;

public class BachelorDto {
	private int no;
	private String title;
	private int mem_no;
	private String hit;
	private Date board_dt;
	private String content;
	private String writer;
	
	public BachelorDto() {}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getMem_no() {
		return mem_no;
	}
	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}
	public String getHit() {
		return hit;
	}
	public void setHit(String hit) {
		this.hit = hit;
	}
	public Date getBoard_dt() {
		return board_dt;
	}
	public void setBoard_dt(Date board_dt) {
		this.board_dt = board_dt;
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

	@Override
	public String toString() {
		return "BachelorDto [no=" + no + ", title=" + title + ", mem_no=" + mem_no + ", hit=" + hit + ", board_dt="
				+ board_dt + ", content=" + content + ", writer=" + writer + "]";
	}
}
