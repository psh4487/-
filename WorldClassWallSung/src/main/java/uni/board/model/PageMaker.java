package uni.board.model;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker {
	private int totalCount;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private int displayPageNum = 5;
	private Criteria cri;
	
	public void setCri(Criteria cri) {
		this.cri = cri;
	}
	
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}
	
	public int getTotalCount() {
		return totalCount;
	}
	
	public int getStartPage() {
		return startPage;
	}
	
	public int getEndPage() {
		return endPage;
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
	
	public Criteria getCri() {
		return cri;
	}
	// 페이징 처리를 담당하는 메소드
	private void calcData() {
		// 1~10 페이지는 endPage가 10으로 고정되고 11~20 페이지는 endPage가 20으로 고정되는 방식
		endPage = (int) (Math.ceil(cri.getPage() / (double)displayPageNum) * displayPageNum);
		// startPage는 매 첫번째 페이지
		startPage = (endPage - displayPageNum) + 1;
	  
		int tempEndPage = (int) (Math.ceil(totalCount / (double)cri.getPerPageNum()));
		if (endPage > tempEndPage) {
			// 마지막 게시물이 있는 페이지가 endPage로 다시 할당해준다.
			endPage = tempEndPage;
		}
		// 첫번째 페이지가 1이면 false를 반환하여 이전버튼이 사라지게 한다.
		prev = startPage == 1 ? false : true;
		// 마지막페이지의 게시글이 10개 이하면 false를 반환.
		next = endPage * cri.getPerPageNum() >= totalCount ? false : true;
	}
	
	public String makeQuery(int page) {
		UriComponents uriComponents =
		UriComponentsBuilder.newInstance()
						    .queryParam("page", page)
							.queryParam("perPageNum", cri.getPerPageNum())
							.build();
		   
		return uriComponents.toUriString();
	}
	public String makeSearch(int page) {
		// 원하는 페이지로 페이지 쿼리문을 날려준다.
		UriComponents uriComponents = 
			UriComponentsBuilder.newInstance().queryParam("page", page) // page번호를 파라미터값으로 날려준다.
			.queryParam("perPageNum", cri.getPerPageNum()) // page당 게시글 갯수를 파라미터값으로 날려준다.
			.queryParam("searchType", ((SearchCriteria)cri).getSearchType()) // 검색 할 타입을 파라미터값으로 날려준다.
			.queryParam("keyword", encoding(((SearchCriteria)cri).getKeyword())) // 검색한 내용을 파라미터값으로 날려준다.
			.build();
		return uriComponents.toUriString();
	}
	private String encoding(String keyword) {
		if(keyword == null || keyword.trim().length() == 0) {
			return "";
		}
		try {
			return URLEncoder.encode(keyword, "UTF-8");
			
		} catch(UnsupportedEncodingException e) {
			return "";
		}
	}
}
