package uni.sta.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import uni.sta.model.SubjectDto;

public class RestSubDao extends SqlSessionDaoSupport{
	
	public List<SubjectDto> viewSub(){
		List<SubjectDto> li = getSqlSession().selectList("sub.viewSub");
		for(SubjectDto i : li) {
			i.setLec(i.getLec_1(),  i.getLec_2(), i.getLec_3()); 
		}
		return li;
	}

	public List<SubjectDto> viewSubOne(String sub_nm){	
		List<SubjectDto> li = getSqlSession().selectList("sub.searchSbj",sub_nm);
		for(SubjectDto i : li) {
			i.setLec(i.getLec_1(),  i.getLec_2(), i.getLec_3()); 
		}	
		return li;	
	}
	
	public void accept(String sub_cd) {
		getSqlSession().update("sub.accept", sub_cd);	
	}
	public void naccept(String sub_cd) {
		getSqlSession().update("sub.naccept", sub_cd);	
	}
	
	public List<SubjectDto> searchBd(){	
		return getSqlSession().selectList("sub.searchBd");		
	}
	public List<Map<String,Object>> searchRm(String buil_no){	
		return getSqlSession().selectList("sub.searchRm",buil_no);		
	}
	public List<SubjectDto> selectRm(String subroom_nm){	
		return getSqlSession().selectList("sub.selectRm",subroom_nm);		
	}
}
