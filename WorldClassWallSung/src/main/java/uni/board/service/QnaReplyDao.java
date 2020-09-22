package uni.board.service;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import java.util.*;
import uni.board.model.QnaReplyDto;
public class QnaReplyDao extends SqlSessionDaoSupport{
	public List<QnaReplyDto> reList(int no){
		return getSqlSession().selectList("qnaboard.readReply",no);
	}
	public int insertReply(QnaReplyDto dto) {
		return getSqlSession().insert("qnaboard.writeReply", dto);
	}
	public int deleteReply(int rno) {
		return getSqlSession().delete("qnaboard.deleteReply",rno);
	}
}
