package uni.sta.service;

import java.util.List; 
import org.mybatis.spring.support.SqlSessionDaoSupport;
import uni.sta.model.StaffDto;

public class StaffDao extends SqlSessionDaoSupport{

	public List<StaffDto> selectDepts() {
		// TODO Auto-generated method stub
		return getSqlSession().selectList("staff.deptlist");
	}

	public List<StaffDto> selectstaffList(String staff_dept) {
		return getSqlSession().selectList("staff.stafflist", staff_dept);
	}
	
}
