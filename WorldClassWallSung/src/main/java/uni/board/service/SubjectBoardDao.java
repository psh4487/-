package uni.board.service;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import uni.board.model.DeptNm;
import uni.board.model.SearchCriteria;
import java.util.*;
import uni.board.model.SubjectBoardDto;


public class SubjectBoardDao extends SqlSessionDaoSupport{
	//글 리스트 출력, 페이징, 검색
	public List<SubjectBoardDto> list(SearchCriteria scri){
		return getSqlSession().selectList("subjectboard.listPage",scri);
	}
	//글 리스트 출력, 페이징, 검색
	public int listCount(SearchCriteria scri) {
		return getSqlSession().selectOne("subjectboard.listCount",scri);
	}
	//학과명 조회
	public List<DeptNm> deptnm() {
		return getSqlSession().selectList("subjectboard.dept_nm");
	}
	//글쓰기
	public int insert(SubjectBoardDto dto) {
		return getSqlSession().insert("subjectboard.insertBoard",dto);
	}
	//글 조회
	public SubjectBoardDto list(int no) {
		return getSqlSession().selectOne("subjectboard.selectTitle",no);
	}
	//조회수 증가
	public int addHit(int no) {
		return getSqlSession().update("subjectboard.addHit",no);
	}
	//글 삭제
	public int delete(int no) {
		return getSqlSession().delete("subjectboard.deleteTitle", no);
	}
	//글 수정
	public int update(SubjectBoardDto dto) {
		return getSqlSession().update("subjectboard.updateTitle",dto);
	}
}
