package uni.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import uni.board.model.BoardDto;
import uni.board.model.Criteria;
import uni.board.model.PageMaker;
import uni.board.model.SearchCriteria;

public class BoardDao extends SqlSessionDaoSupport {
	public List<BoardDto> list(SearchCriteria scri){
		return getSqlSession().selectList("board.listPage",scri);
	}
	public int listCount(SearchCriteria scri) {
		return getSqlSession().selectOne("board.listCount", scri);
	}
	public int insert(BoardDto dto) {
		return getSqlSession().insert("board.insertBoard", dto);
	}
	public BoardDto list(int no){
		return getSqlSession().selectOne("board.selectTitle", no);
	}
	public int update(BoardDto dto) {
		return getSqlSession().update("board.updateTitle", dto);
	}
	public int delete(int no) {
		return getSqlSession().delete("board.deleteTitle", no);
	}
	public int addHit(int no) {
		return getSqlSession().update("board.addHit", no);
	}
	public int selectCount() {
		return getSqlSession().selectOne("board.selectCount");
	}
	public List<BoardDto> listNotice(){
		return getSqlSession().selectList("board.selectNotice");
	}
}
