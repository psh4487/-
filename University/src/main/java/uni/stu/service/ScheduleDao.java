package uni.stu.service;

import java.util.*;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import uni.stu.model.ScheduleDto;

public class ScheduleDao extends SqlSessionDaoSupport{
	public List<ScheduleDto> scheduleList(Map<String, Integer> m){
		return getSqlSession().selectList("schedule.scheduleList", m);
	}

	public ScheduleDto scheduleName(Map<String, Integer> m){
		return getSqlSession().selectOne("schedule.scheduleName", m);
	}
}