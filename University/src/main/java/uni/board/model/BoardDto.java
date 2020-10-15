package uni.board.model;

import java.sql.Timestamp;

public class BoardDto {
		int no;
		int mem_no;
		String horse;
		String title;
		String content;
		Timestamp board_dt;
		int hit;
		String writer;
		public int getNo() {
			return no;
		}
		public void setNo(int no) {
			this.no = no;
		}
		public int getMem_no() {
			return mem_no;
		}
		public void setMem_no(int mem_no) {
			this.mem_no = mem_no;
		}
		public String getHorse() {
			return horse;
		}
		public void setHorse(String horse) {
			this.horse = horse;
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
		public Timestamp getBoard_dt() {
			return board_dt;
		}
		public void setBoard_dt(Timestamp board_dt) {
			this.board_dt = board_dt;
		}
		public int getHit() {
			return hit;
		}
		public void setHit(int hit) {
			this.hit = hit;
		}
		public String getWriter() {
			return writer;
		}
		public void setWriter(String writer) {
			this.writer = writer;
		}
		@Override
		public String toString() {
			return "BoardDto [no=" + no + ", mem_no=" + mem_no + ", horse=" + horse + ", title=" + title + ", content="
					+ content + ", board_dt=" + board_dt + ", hit=" + hit + ", writer=" + writer + "]";
		}
		
		
		
}
