package uni.stu.service;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import uni.stu.model.ApplyDownDto;
import uni.stu.model.ApplyDto;
import uni.stu.model.MajorDto;

import java.util.*;


public class MajorDao extends SqlSessionDaoSupport{
	
	public List<Map<String,Object>> cultureList(String isu){
		return getSqlSession().selectList("student.listCulture", isu);
	}
	public MajorDto selectDept() {
		return getSqlSession().selectOne("student.listDept");
	}
	public int insert(ApplyDto dto) {
		return getSqlSession().insert("student.apply", dto);
	}
	public List<ApplyDto> applyList(int stu_no){
		return getSqlSession().selectList("student.selectApply",stu_no);
	}
	public int delete(ApplyDto dto) {
		return getSqlSession().delete("student.deleteApply", dto);
	}
	public int update(ApplyDto dto) {
		return getSqlSession().update("student.updateApply", dto);		
	}
	public int update1(ApplyDto dto) {
		return getSqlSession().update("student.updateApply1", dto);
	}
	public int score(int stu_no) {
		return getSqlSession().selectOne("student.score",stu_no);
	}
	
	
}
