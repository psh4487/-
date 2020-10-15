package uni.stu.service;

import java.util.*;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import uni.stu.model.EestimationDto;

public class EstimationDao extends SqlSessionDaoSupport{
	public List<EestimationDto> subjectList(Map<String, Object> m) {
		return getSqlSession().selectList("estimation.subjectList", m);
	}
	
	public int joinEstimation(Map<String, Object> m) {
		return getSqlSession().insert("estimation.joinEstimation", m);
	}
	
	public List<EestimationDto> dataCheck(Map<String, Object> m) {
		return getSqlSession().selectList("estimation.dataCheck", m);
	}
}