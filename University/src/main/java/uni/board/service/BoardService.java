package uni.board.service;

import java.util.List;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import uni.board.model.BoardDto;
import uni.board.model.Criteria;
import uni.board.model.SearchCriteria;

@Service
public class BoardService {
	BoardDao dao;
	@Autowired
	public void setDao(BoardDao dao) {
		this.dao = dao;
	}

	public List<BoardDto> list(SearchCriteria scri){
		return dao.list(scri);
	}
	public int listCount(SearchCriteria scri) {
		return dao.listCount(scri);
	}
	public int insert(BoardDto dto) {
		return dao.insert(dto);
	}
	public BoardDto selectTitle(int no) {
		return dao.list(no);
	}
	public int updateTitle(BoardDto dto) {
		return dao.update(dto);
	}
	public int deleteTitle(int no) {
		return dao.delete(no);
	}
	public int addHit(int no) {
		return dao.addHit(no);
	}
	public int selectCount() {
		return dao.selectCount();
	}
	public List<BoardDto> listNotice(){
		return dao.listNotice();
	}
}
