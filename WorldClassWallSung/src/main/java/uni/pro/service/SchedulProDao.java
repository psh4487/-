package uni.pro.service;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import uni.pro.model.SchedulProDto;



public class SchedulProDao extends SqlSessionDaoSupport {
	
	public List<SchedulProDto> scheduleproList(int prof_cd){
		return getSqlSession().selectList("schedulepro.pro",prof_cd); 
	}
	
	public List<SchedulProDto> sublist(int prof_cd){
		return getSqlSession().selectList("schedulepro.schedule",prof_cd);
		}
}