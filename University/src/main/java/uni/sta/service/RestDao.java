package uni.sta.service;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import uni.sta.model.SubjectDto;


public class RestDao extends SqlSessionDaoSupport{
	
	public List<SubjectDto> restList2(){
		return getSqlSession().selectList("rest.searchRest2");
	}
	
	public List<SubjectDto> reasonList(String sub_nm){
		return getSqlSession().selectList("rest.searchRest1",sub_nm);		
	}
	
	public void accept(String sub_cd) {
		getSqlSession().update("rest.accept", sub_cd);	
	}
	public void naccept(String sub_cd) {
		getSqlSession().update("rest.naccept", sub_cd);	
	}
}
