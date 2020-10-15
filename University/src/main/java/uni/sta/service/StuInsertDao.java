package uni.sta.service;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import uni.sta.model.ProDto;
import uni.sta.model.StaffDto;
import uni.sta.model.StuDeptDto;
import uni.sta.model.StuDto;

public class StuInsertDao extends SqlSessionDaoSupport {

	public void insertStu(StuDto dto) {
		getSqlSession().insert("staff.insertstu", dto);
	}

	public void insertSta(StaffDto dto) {
		getSqlSession().insert("staff.insertsta", dto);

	}

	public void insertPro(ProDto dto) {
		getSqlSession().insert("staff.insertpro", dto);

	}

	public List<StuDeptDto> selectStuDeptList() {
		return getSqlSession().selectList("staff.selectStuDept");
	}

}