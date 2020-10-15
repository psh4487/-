package uni.pro.service;

import java.util.*;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import uni.pro.model.SelScheduleProDto;


public class SelScheduleProDao extends SqlSessionDaoSupport{
	public List<SelScheduleProDto> builName(int prof_cd){
		return getSqlSession().selectList("selSchedulePro.builName",prof_cd);
	}

	public List<SelScheduleProDto> subroomName(int sub_cd){
		return getSqlSession().selectList("selSchedulePro.stuname", sub_cd);
	}
	
	public SelScheduleProDto subroomList(Map<String, String> m){
		return getSqlSession().selectOne("selSchedulePro.subroomList", m);
	}
}