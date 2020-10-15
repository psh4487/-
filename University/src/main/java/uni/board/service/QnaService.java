package uni.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import uni.board.model.SearchCriteria;
import java.util.*;
import uni.board.model.QnaDto;
@Service
public class QnaService {
	QnaDao dao;
	@Autowired
	public void setDao(QnaDao dao) {
		this.dao = dao;
	}
	//글 리스트 출력, 페이징, 검색
	public List<QnaDto> list(SearchCriteria scri){
		return dao.list(scri);
	}
	//글 리스트 출력, 페이징, 검색
	public int listCount(SearchCriteria scri) {
		return dao.listCount(scri);
	}
	//글쓰기
	public int insert(QnaDto dto) {
		return dao.insert(dto);
	}
	//글 조회
	public QnaDto selectTitle(int no) {
		return dao.list(no);
	}
	//조회수 증가
	public int addHit(int no) {
		return dao.addHit(no);
	}
	//글 삭제
	public int deleteTitle(int no) {
		return dao.delete(no);
	}
	//글 수정
	public int updateTitle(QnaDto dto) {
		return dao.update(dto);
	}
}
