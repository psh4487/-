package uni.sta.service;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import uni.sta.model.StaLeaveDto;

public class StaLeaveDao extends SqlSessionDaoSupport{


	public List<StaLeaveDto> selectLeaveList() {
		return getSqlSession().selectList("staff.leavelist");
	}

}
