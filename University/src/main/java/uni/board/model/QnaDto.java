package uni.board.model;

import java.sql.Timestamp;

public class QnaDto {
	int no;
	String title;
	int mem_no;
	int hit;
	Timestamp board_dt;
	String content;
	String writer;
	int stu_no;
	int prof_cd;
	
	
	
	public int getStu_no() {
		return stu_no;
	}
	public void setStu_no(int stu_no) {
		this.stu_no = stu_no;
	}
	public int getProf_cd() {
		return prof_cd;
	}
	public void setProf_cd(int prof_cd) {
		this.prof_cd = prof_cd;
	}
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
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public Timestamp getBoard_dt() {
		return board_dt;
	}
	public void setBoard_dt(Timestamp board_dt) {
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
	
}
