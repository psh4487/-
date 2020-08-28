package uni.board.model;

import java.sql.Timestamp;

public class SubjectBoardDto {
	int no;
	String dept_cd;
	String title;
	String content;
	String writer;
	String dept_nm;
	int hit;
	int mem_no;
	Timestamp board_dt;
	int prof_cd;
	
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
	public String getDept_cd() {
		return dept_cd;
	}
	public void setDept_cd(String dept_cd) {
		this.dept_cd = dept_cd;
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
	public String getDept_nm() {
		return dept_nm;
	}
	public void setDept_nm(String dept_nm) {
		this.dept_nm = dept_nm;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public int getMem_no() {
		return mem_no;
	}
	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}
	public Timestamp getBoard_dt() {
		return board_dt;
	}
	public void setBoard_dt(Timestamp board_dt) {
		this.board_dt = board_dt;
	}
	@Override
	public String toString() {
		return "SubjectBoardDto [no=" + no + ", dept_cd=" + dept_cd + ", title=" + title + ", content=" + content
				+ ", writer=" + writer + ", dept_nm=" + dept_nm + ", hit=" + hit + ", mem_no=" + mem_no + ", board_dt="
				+ board_dt + ", prof_cd=" + prof_cd + "]";
	}
	
	
}
