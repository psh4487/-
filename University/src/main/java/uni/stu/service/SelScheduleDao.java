package uni.stu.service;

import java.util.*;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import uni.stu.model.SelScheduleDto;

public class SelScheduleDao extends SqlSessionDaoSupport{
	public List<SelScheduleDto> builName(){
		return getSqlSession().selectList("selSchedule.builName");
	}

	public List<SelScheduleDto> subroomName(Map<String, String> m){
		return getSqlSession().selectList("selSchedule.subroomName", m);
	}
	
	public List<SelScheduleDto> subroomList(Map<String, String> m){
		return getSqlSession().selectList("selSchedule.subroomList", m);
	}
}