package uni.pro.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.web.bind.annotation.RequestParam;

import uni.pro.model.BachelorDto;
import uni.pro.model.ProSubjectDto;

public class LecturDao extends SqlSessionDaoSupport{

	public int code(){
		return getSqlSession().selectOne("Bachelor.code");
	}
	
	public int seachetime(){
		return getSqlSession().selectOne("Bachelor.seach");
	}
	
	public int subjecttbsave(ProSubjectDto subdto){
		return getSqlSession().insert("Bachelor.subject",subdto);
	}
	
	public List<ProSubjectDto> select(int prof_cd) {
		return getSqlSession().selectList("Bachelor.select",prof_cd);
	}
	public List<ProSubjectDto> lectureroom(){
		return getSqlSession().selectList("Bachelor.lectureroom");
	}
	
	public List<ProSubjectDto> appDomt_domt_employee_add_listselect() {
	 return getSqlSession().selectList("Bachelor.Subroomnm");
		   }
	
	  public List<Map<String,Object>> appDomt_domt_employee_add_listselect_two(String Subroom_nm){
	      return getSqlSession().selectList("Bachelor.lec", Subroom_nm);
	   }
}