package uni.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import uni.board.model.DeptNm;
import uni.board.model.SearchCriteria;
import uni.board.model.SubjectBoardDto;
import java.util.*;

@Service
public class SubjectBoardService {
	SubjectBoardDao dao;
	@Autowired
	public void setDao(SubjectBoardDao dao) {
		this.dao = dao;
	}
	//글 리스트 출력, 페이징, 검색
	public List<SubjectBoardDto> list(SearchCriteria scri){
		return dao.list(scri);
	}
	//글 리스트 출력, 페이징, 검색
	public int listCount(SearchCriteria scri) {
		return dao.listCount(scri);
	}
	//학과명 조회
	public List<DeptNm> deptnm() {
		return dao.deptnm();
	}
	//글 쓰기
	public int insert(SubjectBoardDto dto) {
		return dao.insert(dto);
	}
	//글 조회
	public SubjectBoardDto selectTitle(int no) {
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
	public int updateTitle(SubjectBoardDto dto) {
		return dao.update(dto);
	}
}
