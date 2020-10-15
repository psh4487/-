package uni.board.service;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import java.util.*;
import uni.board.model.QnaDto;
import uni.board.model.SearchCriteria;
public class QnaDao extends SqlSessionDaoSupport{
	//글 리스트 출력, 페이징, 검색
	public List<QnaDto> list(SearchCriteria scri){
		return getSqlSession().selectList("qnaboard.listPage", scri);
	}
	//글 리스트 출력, 페이징, 검색
	public int listCount(SearchCriteria scri) {
		return getSqlSession().selectOne("qnaboard.listCount",scri);
	}
	//글쓰기
	public int insert(QnaDto dto) {
		return getSqlSession().insert("qnaboard.insertBoard", dto);
	}
	//글 조회
	public QnaDto list(int no) {
		return getSqlSession().selectOne("qnaboard.selectTitle", no);
	}
	//조회수 증가
	public int addHit(int no) {
		return getSqlSession().update("qnaboard.addHit", no);
	}
	//글 삭제
	public int delete(int no) {
		return getSqlSession().delete("qnaboard.deleteTitle", no);
	}
	//글 수정
	public int update(QnaDto dto) {
		return getSqlSession().update("qnaboard.updateTitle", dto);
	}
}
