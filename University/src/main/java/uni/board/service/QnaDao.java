package uni.board.service;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import java.util.*;
import uni.board.model.QnaDto;
import uni.board.model.SearchCriteria;
public class QnaDao extends SqlSessionDaoSupport{
	//�� ����Ʈ ���, ����¡, �˻�
	public List<QnaDto> list(SearchCriteria scri){
		return getSqlSession().selectList("qnaboard.listPage", scri);
	}
	//�� ����Ʈ ���, ����¡, �˻�
	public int listCount(SearchCriteria scri) {
		return getSqlSession().selectOne("qnaboard.listCount",scri);
	}
	//�۾���
	public int insert(QnaDto dto) {
		return getSqlSession().insert("qnaboard.insertBoard", dto);
	}
	//�� ��ȸ
	public QnaDto list(int no) {
		return getSqlSession().selectOne("qnaboard.selectTitle", no);
	}
	//��ȸ�� ����
	public int addHit(int no) {
		return getSqlSession().update("qnaboard.addHit", no);
	}
	//�� ����
	public int delete(int no) {
		return getSqlSession().delete("qnaboard.deleteTitle", no);
	}
	//�� ����
	public int update(QnaDto dto) {
		return getSqlSession().update("qnaboard.updateTitle", dto);
	}
}
