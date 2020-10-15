package uni.pro.service;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import uni.pro.model.TestDto;

public class TestDao extends SqlSessionDaoSupport {
	
	public void updateTest(TestDto test) {
		getSqlSession().update("test.updateData", test);
	}

	public List<TestDto> selData(int prof_cd) {
		return getSqlSession().selectList("test.selData", prof_cd);
	}
}
