package uni.stu.service;

import java.util.*;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import uni.stu.model.LeaveDto;
import uni.stu.model.SubjectDto;

public class LeaveDao extends SqlSessionDaoSupport{
	public List<LeaveDto> leaveList(int stu_no){
		return getSqlSession().selectList("leave.leaveList", stu_no);
	}
	public int leaveInsert(LeaveDto dto){
		return getSqlSession().insert("leave.leaveInsert", dto);
	}
}