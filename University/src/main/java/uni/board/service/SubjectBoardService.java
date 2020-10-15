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
	//�� ����Ʈ ���, ����¡, �˻�
	public List<SubjectBoardDto> list(SearchCriteria scri){
		return dao.list(scri);
	}
	//�� ����Ʈ ���, ����¡, �˻�
	public int listCount(SearchCriteria scri) {
		return dao.listCount(scri);
	}
	//�а��� ��ȸ
	public List<DeptNm> deptnm() {
		return dao.deptnm();
	}
	//�� ����
	public int insert(SubjectBoardDto dto) {
		return dao.insert(dto);
	}
	//�� ��ȸ
	public SubjectBoardDto selectTitle(int no) {
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
	public int updateTitle(SubjectBoardDto dto) {
		return dao.update(dto);
	}
	public String dept_nm(int prof_cd) {
		return dao.dept_nm(prof_cd);
	}
}
