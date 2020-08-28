package uni.pro.service;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import uni.pro.model.EstimationProDto;

public class EstimationProDao extends SqlSessionDaoSupport {
	public List<EstimationProDto> sublist(int prof_cd) {
		return getSqlSession().selectList("Estimationpro.sublist",prof_cd);
	}// 과목목록

	public List<EstimationProDto> estall(String sub_cd) {
		return getSqlSession().selectList("Estimationpro.Estimationproall",sub_cd);
	}// 평가목록

	public HashMap<String,Object> viewest(EstimationProDto dto) {
		return getSqlSession().selectOne("Estimationpro.Estimationproview",dto);
	}// 상세목록
	
	public int esteok(int  stu_no){
		return getSqlSession().update("Estimationpro.es_state", stu_no);
	}

	public HashMap<String,Object> view(String sub_cd) {
		return getSqlSession().selectOne("Estimationpro.view",sub_cd);
	}
}
