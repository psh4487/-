package uni.sta.service;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import uni.sta.model.StuDto;

public class LoginStuDao extends SqlSessionDaoSupport{

	public StuDto LoginStu(StuDto dto) {
		return getSqlSession().selectOne("staff.selectstu", dto);
	}

	
}
