package uni.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.*;
import uni.board.model.QnaReplyDto;
@Service
public class QnaReplyService {
	QnaReplyDao dao;
	
	@Autowired
	public void setDao(QnaReplyDao dao) {
		this.dao = dao;
	}
	public List<QnaReplyDto> reList(int no){
		return dao.reList(no);
	}
	public int insertReply(QnaReplyDto dto) {
		return dao.insertReply(dto);
	}
}
