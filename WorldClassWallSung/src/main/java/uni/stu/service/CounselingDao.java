package uni.stu.service;

import java.util.*;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import uni.stu.model.CounselingDto;

public class CounselingDao extends SqlSessionDaoSupport{
	public List<CounselingDto> subList(Map<String, Integer> m) {
		return getSqlSession().selectList("counseling.subList", m);
	}

	public List<CounselingDto> historyList(Map<String, Integer> m) {
		return getSqlSession().selectList("counseling.historyList", m);
	}
	
	public int counselingApply(CounselingDto dto) {
		return getSqlSession().insert("counseling.counselingApply", dto);
	}
}