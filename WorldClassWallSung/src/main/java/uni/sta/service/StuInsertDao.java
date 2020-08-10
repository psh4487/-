package uni.sta.service;


import org.mybatis.spring.support.SqlSessionDaoSupport; 
import uni.sta.model.StuDto;

public class StuInsertDao extends SqlSessionDaoSupport{

	public void insertStu(StuDto dto){
		getSqlSession().insert("staff.insertstu", dto);
	}
	
	
}