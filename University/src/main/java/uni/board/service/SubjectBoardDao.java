package uni.board.service;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import uni.board.model.DeptNm;
import uni.board.model.SearchCriteria;
import java.util.*;
import uni.board.model.SubjectBoardDto;


public class SubjectBoardDao extends SqlSessionDaoSupport{
	//�� ����Ʈ ���, ����¡, �˻�
	public List<SubjectBoardDto> list(SearchCriteria scri){
		return getSqlSession().selectList("subjectboard.listPage",scri);
	}
	//�� ����Ʈ ���, ����¡, �˻�
	public int listCount(SearchCriteria scri) {
		return getSqlSession().selectOne("subjectboard.listCount",scri);
	}
	//�а��� ��ȸ
	public List<DeptNm> deptnm() {
		return getSqlSession().selectList("subjectboard.dept_nm");
	}
	//�۾���
	public int insert(SubjectBoardDto dto) {
		return getSqlSession().insert("subjectboard.insertBoard",dto);
	}
	//�� ��ȸ
	public SubjectBoardDto list(int no) {
		return getSqlSession().selectOne("subjectboard.selectTitle",no);
	}
	//��ȸ�� ����
	public int addHit(int no) {
		return getSqlSession().update("subjectboard.addHit",no);
	}
	//�� ����
	public int delete(int no) {
		return getSqlSession().delete("subjectboard.deleteTitle", no);
	}
	//�� ����
	public int update(SubjectBoardDto dto) {
		return getSqlSession().update("subjectboard.updateTitle",dto);
	}
	//�а����
	public String dept_nm(int prof_cd) {
		return getSqlSession().selectOne("subjectboard.deptList", prof_cd);
	}
}
