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
	//�� ����Ʈ ���, ����¡, �˻�
	public List<QnaDto> list(SearchCriteria scri){
		return dao.list(scri);
	}
	//�� ����Ʈ ���, ����¡, �˻�
	public int listCount(SearchCriteria scri) {
		return dao.listCount(scri);
	}
	//�۾���
	public int insert(QnaDto dto) {
		return dao.insert(dto);
	}
	//�� ��ȸ
	public QnaDto selectTitle(int no) {
		return dao.list(no);
	}
	//��ȸ�� ����
	public int addHit(int no) {
		return dao.addHit(no);
	}
	//�� ����
	public int deleteTitle(int no) {
		return dao.delete(no);
	}
	//�� ����
	public int updateTitle(QnaDto dto) {
		return dao.update(dto);
	}
}
