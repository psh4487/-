package uni.stu.service;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import uni.stu.model.ServiceDto;

import java.util.*;

public class ServiceDao extends SqlSessionDaoSupport{
	public List<ServiceDto> list(int stu_no){
		return getSqlSession().selectList("student.listService",stu_no);
	}
	public int delete(ServiceDto dto) {
		return getSqlSession().delete("student.deleteService", dto);
	}
	public int insert(ServiceDto dto) {
		return getSqlSession().insert("student.insertService", dto);
	}
}
