package uni.stu.service;

import java.util.*;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import uni.stu.model.LeaveDto;
import uni.stu.model.SubjectDto;

public class LeaveDao extends SqlSessionDaoSupport{
	public List<LeaveDto> leaveList(){
		return getSqlSession().selectList("leave.leaveList");
	}
	public int leaveInsert(Map<String, Object> m){
		return getSqlSession().insert("leave.leaveInsert", m);
	}
}