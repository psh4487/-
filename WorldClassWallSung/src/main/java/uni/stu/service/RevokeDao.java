package uni.stu.service;

import java.util.*;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import uni.stu.model.RevokeDto;

public class RevokeDao extends SqlSessionDaoSupport{
	public List<RevokeDto> revokeList(Map<String, Integer> m){
		return getSqlSession().selectList("revoke.revokeList", m);
	}
	
	public int revokeDelete(Map<String, Integer> m) {
		return getSqlSession().delete("revoke.revokeDelete", m);
	}
}