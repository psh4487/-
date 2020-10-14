package uni.board.model;

public class Criteria {
	int page; // 페이지 번호
	int perPageNum; // 페이지당 게시글 갯수
	int rowStart; // 페이지 한 행의 첫번째 게시물 rowNum
	int rowEnd; // 페이지 한 행의 마지막 게시물 rowNum
	
	public Criteria() {
		this.page = 1;
		this.perPageNum = 10;
	}
	public void setPage(int page) {
		if(page <= 0) {
			this.page = 1;
			return;
		}
		this.page = page;
	}
	public void setPerPageNum(int perPageNum) {
		if(perPageNum <= 0 || perPageNum > 100) {
			this.perPageNum = 10;
			return;
		}
		this.perPageNum = perPageNum;
	}
	public int getPage() {
		return page;
	}
	public int getPageStart() {
		// 현재페이지 * 현재 페이지 당 게시글 수를 리턴 
		return (this.page - 1) * perPageNum;
	}
	public int getPerPageNum() {
		return this.perPageNum;
	}
	public int getRowStart() {
		rowStart = ((page-1)*perPageNum)+1;
		return rowStart;
	}
	public int getRowEnd() {
		rowEnd = rowStart + perPageNum - 1;
		return rowEnd;
	}
}
