package uni.pro.service;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import uni.pro.model.Class_cancel_Dto;
import uni.pro.model.Class_cancel_Dto_main;
import uni.pro.model.ProSubjectDto;

public class ProSubjectDao extends SqlSessionDaoSupport {

	public List<ProSubjectDto> submain(int prof_cd) {
		return getSqlSession().selectList("Bachelor.submain", prof_cd);
	}
	
	public List<Class_cancel_Dto_main> class_cancel_main(int prof_cd) {
	return getSqlSession().selectList("Bachelor.class_cancel_main", prof_cd);
	}

	public List<ProSubjectDto> sublist(int prof_cd) {
		return getSqlSession().selectList("Bachelor.sublist", prof_cd);
	}

	public ProSubjectDto noclass(String sub_nm) {
		return getSqlSession().selectOne("Bachelor.noclass", sub_nm);
	}
	
	public void class_cancel(Class_cancel_Dto Dto) {
		getSqlSession().insert("Bachelor.class_cancel",Dto);
	}
	
	
}