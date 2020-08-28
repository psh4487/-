package uni.stu.service;

import java.util.*;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import uni.stu.model.GradeMDto;

public class GradeMDao extends SqlSessionDaoSupport{
	public List<GradeMDto> yearsList(){
		return getSqlSession().selectList("gradeMana.yearsList");
	}
	public List<GradeMDto> semList(){
		return getSqlSession().selectList("gradeMana.semList");
	}
	public List<GradeMDto> gradeMSel(Map<String, Integer> m){
		return getSqlSession().selectList("gradeMana.gradeList", m);
	}
}